<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TournamentManagement.aspx.cs" Inherits="EsportsHub.TournamentManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tournament Management</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard">
            <!-- Sidebar -->
            <nav class="sidebar">
                <div class="sidebar-header">
                    <h2>Admin</h2>
                </div>

                <ul class="sidebar-menu">
                    <li><a href="AdminPage.aspx"><i class="fas fa-users"></i> User Management</a></li><br />
                    <li><a href="TournamentManagement.aspx"><i class="fas fa-trophy"></i> Tournament Management</a></li><br />
                    <li><a href="#"><i class="fas fa-gamepad"></i> Match Management</a></li><br />
                    <li><a href="#"><i class="fas fa-calendar"></i> Event Scheduling</a></li><br />
                </ul>
            </nav>

            <!-- Main Content -->
            <div class="content" style="color: #000000">
                <header>
                    <h2>Tournament Management</h2>
                </header>

                <!-- Add Tournament Form -->
                <div>
                    <h3>Add Tournament</h3>
                    <label for="TournamentName">Tournament Name:</label>
                    <asp:TextBox ID="TournamentName" runat="server" /><br /><br />

                    <label for="GameID">Game ID:</label>
                    <asp:TextBox ID="GameID" runat="server" /><br /><br />

                    <label for="StartDate">Start Date:</label>
                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" /><br /><br />

                    <label for="EndDate">End Date:</label>
                    <asp:TextBox ID="EndDate" runat="server" TextMode="Date" /><br /><br />

                    <asp:Button ID="AddTournamentButton" runat="server" Text="Add Tournament" OnClick="AddTournament_Click" />
                </div>

                <hr />

                <!-- Display Tournaments -->
                <h3>Tournaments List</h3>
                <asp:GridView ID="TournamentsGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="TournamentID" 
                    OnRowEditing="TournamentsGrid_RowEditing" 
                    OnRowUpdating="TournamentsGrid_RowUpdating" 
                    OnRowCancelingEdit="TournamentsGrid_RowCancelingEdit" 
                    OnRowDeleting="TournamentsGrid_RowDeleting">
                    
                    <Columns>
                        <asp:BoundField DataField="TournamentID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="TournamentName" HeaderText="Tournament Name" />
                        <asp:BoundField DataField="GameID" HeaderText="Game ID" />
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>

<!-- Add the following styles in your 'styles.css' -->
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
        color: #212529;
    }

    .dashboard {
        display: flex;
        height: 100vh;
        color: white;
    }

    /* Sidebar */
    .sidebar {
        width: 250px;
        background-color: #343a40;
        color: #fff;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px 0;
    }

    .sidebar-header {
        text-align: center;
        margin-bottom: 20px;
    }

    .sidebar-menu {
        list-style: none;
        padding: 0;
        width: 90%;
        height: 323px;
    }

    .sidebar-menu li {
        margin: 10px 0;
    }

    .sidebar-menu a {
        display: flex;
        align-items: center;
        gap: 10px;
        color: #fff;
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    .sidebar-menu a:hover {
        background-color: #495057;
    }

    /* Main Content */
    .content {
        flex: 1;
        padding: 20px;
        overflow-y: auto;
    }

    header {
        margin-bottom: 20px;
    }

    header h2 {
        font-size: 24px;
        margin-bottom: 5px;
        color: #343a40;
    }

    .add-tournament-btn-container {
        margin-bottom: 20px;
        display: flex;
        justify-content: flex-start;
    }

    .add-tournament-btn {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .add-tournament-btn:hover {
        background-color: #0056b3;
    }

    /* Grid for Tournament List */
    .card-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
    }

    .card {
        background: #fff;
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 15px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
    }

    .card h3 {
        font-size: 18px;
        color: #007bff;
        margin-bottom: 10px;
    }

    .card p {
        font-size: 14px;
        color: #6c757d;
        margin: 0;
    }
</style>
