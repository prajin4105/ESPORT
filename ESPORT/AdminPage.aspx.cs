using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.Script.Services;

namespace EsportsHub
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Role"]?.ToString() != "Admin")
                {
                    Response.Redirect("Login.aspx");
                }

                BindUsers();
            }
        }

        private void BindUsers()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True";
            string query = "SELECT Username, Email, Role FROM Users";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                RepeaterUsers.DataSource = reader;
                RepeaterUsers.DataBind();
                conn.Close();
            }
        }

        // Add User method
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void AddUser(string username, string email, string password, string role)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Email, Password, Role) VALUES (@Username, @Email, @Password, @Role)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // You should hash the password before saving
                cmd.Parameters.AddWithValue("@Role", role);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}
