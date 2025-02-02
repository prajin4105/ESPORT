using System;
using System.Data.SqlClient;

namespace EsportsHub
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in
            if (Session["Username"] != null)
            {
                string role = Session["Role"].ToString();
                if (role == "Admin")
                {
                    Response.Redirect("AdminPage.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblErrorMessage.Text = "Username and password cannot be empty!";
                return;
            }

            // Connection string to your database
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True";

            // SQL query to verify the user's credentials
            string query = "SELECT UserID, Username, Role FROM Users WHERE Username = @Username AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();

                    // Store user details in session variables
                    Session["UserID"] = reader["UserID"].ToString();
                    Session["Username"] = reader["Username"].ToString();
                    Session["Role"] = reader["Role"].ToString();

                    // Redirect based on role
                    string role = reader["Role"].ToString();
                    if (role == "Admin")
                    {
                        Response.Redirect("AdminPage.aspx");
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Invalid username or password!";
                }

                conn.Close();
            }
        }
    }
}
