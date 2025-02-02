using System;
using System.Web.UI;

namespace EsportsHub
{
    public partial class Tournaments : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Add any server-side logic needed during the page load
            if (!IsPostBack)
            {
                // Initialization code if required
            }
        }
    }
}
