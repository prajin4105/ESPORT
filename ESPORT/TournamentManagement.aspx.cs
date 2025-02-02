using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EsportsHub
{
    public partial class TournamentManagement : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\prajin\source\repos\ESPORT\ESPORT\App_Data\db.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTournamentsGrid();
            }
        }

        private void BindTournamentsGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Tournaments";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        TournamentsGrid.DataSource = dt;
                        TournamentsGrid.DataBind();
                    }
                }
            }
        }

        protected void AddTournament_Click(object sender, EventArgs e)
        {
            string tournamentName = TournamentName.Text;
            string gameId = GameID.Text;

            DateTime startDate, endDate;
            bool isStartDateValid = DateTime.TryParseExact(StartDate.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out startDate);
            bool isEndDateValid = DateTime.TryParseExact(EndDate.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out endDate);

            if (!isStartDateValid || !isEndDateValid)
            {
                Response.Write("<script>alert('Invalid Date Format! Please enter a valid date.');</script>");
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Tournaments (TournamentName, GameID, StartDate, EndDate) VALUES (@TournamentName, @GameID, @StartDate, @EndDate)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TournamentName", tournamentName);
                    cmd.Parameters.AddWithValue("@GameID", gameId);
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            BindTournamentsGrid();
        }

        protected void TournamentsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TournamentsGrid.EditIndex = e.NewEditIndex;
            BindTournamentsGrid();
        }

        protected void TournamentsGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = TournamentsGrid.Rows[e.RowIndex];
            int tournamentID = Convert.ToInt32(TournamentsGrid.DataKeys[e.RowIndex].Values[0]);
            string tournamentName = (row.Cells[1].Controls[0] as TextBox).Text;
            string gameId = (row.Cells[2].Controls[0] as TextBox).Text;

            DateTime startDate, endDate;
            bool isStartDateValid = DateTime.TryParseExact((row.Cells[3].Controls[0] as TextBox).Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out startDate);
            bool isEndDateValid = DateTime.TryParseExact((row.Cells[4].Controls[0] as TextBox).Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out endDate);

            if (!isStartDateValid || !isEndDateValid)
            {
                Response.Write("<script>alert('Invalid Date Format! Please enter a valid date.');</script>");
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Tournaments SET TournamentName=@TournamentName, GameID=@GameID, StartDate=@StartDate, EndDate=@EndDate WHERE TournamentID=@TournamentID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TournamentID", tournamentID);
                    cmd.Parameters.AddWithValue("@TournamentName", tournamentName);
                    cmd.Parameters.AddWithValue("@GameID", gameId);
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            TournamentsGrid.EditIndex = -1;
            BindTournamentsGrid();
        }

        protected void TournamentsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TournamentsGrid.EditIndex = -1;
            BindTournamentsGrid();
        }

        protected void TournamentsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int tournamentID = Convert.ToInt32(TournamentsGrid.DataKeys[e.RowIndex].Values[0]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Tournaments WHERE TournamentID=@TournamentID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TournamentID", tournamentID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            BindTournamentsGrid();
        }
    }
}
