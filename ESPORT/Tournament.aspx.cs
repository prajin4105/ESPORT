using System;
using System.Data;
using System.Data.SqlClient;

namespace EsportsHub
{
    public partial class Tournament : System.Web.UI.Page

    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTournaments();
            }
        }


        private void BindTournaments()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True";
            string query = "SELECT TournamentName, StartDate, EndDate, PrizePool FROM Tournaments";
            


            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                    DataTable tournamentsTable = new DataTable();
                    adapter.Fill(tournamentsTable);

                    // Check if tournaments exist
                    if (tournamentsTable.Rows.Count > 0)
                    {
                        RepeaterTournaments.DataSource = tournamentsTable;
                        RepeaterTournaments.DataBind();
                        // Hide the 'No tournaments' message if there are tournaments
                        NoTournamentsMessage.Visible = false;
                    }
                    else
                    {
                        // Show the 'No tournaments' message
                        NoTournamentsMessage.Visible = true;
                    }
                }
            }
            catch (SqlException ex)
            {
                // Log and handle the error
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }
    }
}
