using System;

namespace EsportsHub
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If user is logged in
            if (Session["Username"] != null)
            {
                lblUsername.Text = "Hello, " + Session["Username"].ToString(); // Display username
                btnLogin.Visible = false; // Hide Login button
                btnRegister.Visible = false; // Hide Register button
                btnLogout.Visible = true; // Show Logout button
            }
            else
            {
                lblUsername.Text = "Guest"; // Display "Guest" if not logged in
                btnLogin.Visible = true; // Show Login button
                btnRegister.Visible = true; // Show Register button
                btnLogout.Visible = false; // Hide Logout button
            }
        }

        // Logic for login button click (you can add redirection here)
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        // Logic for register button click (you can add redirection here)
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        // Logic for logout button click
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clear the session
            Response.Redirect("Home.aspx"); // Redirect to home page after logout
        }
    }
}
