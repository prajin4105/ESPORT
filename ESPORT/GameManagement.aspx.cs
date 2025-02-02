using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EsportsHub
{
    public partial class GameManagement : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\prajin\\source\\repos\\ESPORT\\ESPORT\\App_Data\\db.mdf;Integrated Security=True"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGamesGrid();
            }
        }

        // Load Games into GridView
        private void BindGamesGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Games", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GamesGrid.DataSource = dt;
                GamesGrid.DataBind();
            }
        }

        // Add New Game
        protected void AddGame_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "INSERT INTO Games (GameName, GameGenre) VALUES (@GameName, @GameGenre)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@GameName", GameName.Text);
                    cmd.Parameters.AddWithValue("@GameGenre", GameGenre.Text);
                    cmd.ExecuteNonQuery();
                }
            }

            BindGamesGrid();
        }

        // Edit Mode
        protected void GamesGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GamesGrid.EditIndex = e.NewEditIndex;
            BindGamesGrid();
        }

        // Update Game
        protected void GamesGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GamesGrid.Rows[e.RowIndex];
            int gameID = Convert.ToInt32(GamesGrid.DataKeys[e.RowIndex].Values[0]);

            string gameName = (row.Cells[1].Controls[0] as TextBox).Text;
            string gameGenre = (row.Cells[2].Controls[0] as TextBox).Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE Games SET GameName = @GameName, GameGenre = @GameGenre WHERE GameID = @GameID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@GameName", gameName);
                    cmd.Parameters.AddWithValue("@GameGenre", gameGenre);
                    cmd.Parameters.AddWithValue("@GameID", gameID);
                    cmd.ExecuteNonQuery();
                }
            }

            GamesGrid.EditIndex = -1;
            BindGamesGrid();
        }

        // Cancel Editing
        protected void GamesGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GamesGrid.EditIndex = -1;
            BindGamesGrid();
        }

        // Delete Game
        protected void GamesGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int gameID = Convert.ToInt32(GamesGrid.DataKeys[e.RowIndex].Values[0]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM Games WHERE GameID = @GameID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@GameID", gameID);
                    cmd.ExecuteNonQuery();
                }
            }

            BindGamesGrid();
        }
    }
}
