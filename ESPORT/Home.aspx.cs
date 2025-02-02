using System;
using System.Web.UI;

namespace EsportsHub
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       

       

        protected void GoToTournaments(object sender, EventArgs e)
        {
            // Redirect to tournaments page
            Response.Redirect("Tournament.aspx");
        }
    }
}
