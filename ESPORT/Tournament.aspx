<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tournament.aspx.cs" Inherits="EsportsHub.Tournament" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <h2>Featured Tournaments</h2>

        <!-- Panel to show message when no tournaments are available -->
        <asp:Panel ID="NoTournamentsMessage" runat="server" Visible="false">
            <p>No tournaments are available at the moment.</p>
        </asp:Panel>

        <div class="tournament-list">
          <asp:Repeater ID="RepeaterTournaments" runat="server">
    <ItemTemplate>
        <div class="tournament-card">
            <h3><%# Eval("TournamentName") %></h3>
            <p>Date: <%# Eval("StartDate", "{0:MMMM dd, yyyy}") %> - <%# Eval("EndDate", "{0:MMMM dd, yyyy}") %></p>
            <p>Prize Pool: $<%# Eval("PrizePool") %></p>
            <button>Register</button>
        </div>
    </ItemTemplate>
</asp:Repeater>

        </div>
    </section>
</asp:Content>
