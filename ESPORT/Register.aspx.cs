using System;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This code runs when the page is loaded
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string email = txtEmail.Text.Trim();

            // Validation: Check if fields are empty
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email))
            {
                lblErrorMessage.Text = "All fields are required!";
                return;
            }

            // Validate Email format
            if (!IsValidEmail(email))
            {
                lblErrorMessage.Text = "Please enter a valid email address!";
                return;
            }

            // Check if the username already exists
            if (UsernameExists(username))
            {
                lblErrorMessage.Text = "Username already taken!";
                return;
            }

            // Connection string to your database
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True";

            // SQL query to insert a new user
            string query = "INSERT INTO Users (Username, Password, Email, Role) VALUES (@Username, @Password, @Email, 'Player')";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Email", email);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");  // Redirect to the login page after successful registration
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        // Validate the email format
        private bool IsValidEmail(string email)
        {
            try
            {
                var mailAddress = new System.Net.Mail.MailAddress(email);
                return mailAddress.Address == email;
            }
            catch
            {
                return false;
            }
        }

        // Check if the username already exists in the database
        private bool UsernameExists(string username)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True";
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                return count > 0;
            }
        }
    }
}
