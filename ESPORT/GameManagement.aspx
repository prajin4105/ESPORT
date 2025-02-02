<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameManagement.aspx.cs" Inherits="EsportsHub.GameManagement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Management</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Game Management</h2>

        <!-- Add Game Form -->
        <form id="AddGameForm" runat="server">
            <label for="GameName">Game Name:</label>
            <asp:TextBox ID="GameName" runat="server" required></asp:TextBox>
            
            <label for="GameGenre">Game Genre:</label>
            <asp:TextBox ID="GameGenre" runat="server" required></asp:TextBox>
            
            <asp:Button ID="AddGameButton" runat="server" Text="Add Game" OnClick="AddGame_Click" />
        </form>

        <h3>Games List</h3>
        <asp:GridView ID="GamesGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="GameID"
            OnRowEditing="GamesGrid_RowEditing" 
            OnRowUpdating="GamesGrid_RowUpdating" 
            OnRowDeleting="GamesGrid_RowDeleting"
            OnRowCancelingEdit="GamesGrid_RowCancelingEdit">
            
            <Columns>
                <asp:BoundField DataField="GameID" HeaderText="Game ID" ReadOnly="True" />
                <asp:BoundField DataField="GameName" HeaderText="Game Name" />
                <asp:BoundField DataField="GameGenre" HeaderText="Game Genre" />

                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</body>
</html>
