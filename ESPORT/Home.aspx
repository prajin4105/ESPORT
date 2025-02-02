<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EsportsHub.Home" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="css/StyleSheet1.css">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Navigation Bar -->
    <div class="navbar">
      
       
    </div>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="hero-content">
            <h1>Welcome to UNDER DOG</h1>
            <p>Your gateway to organizing and competing in thrilling esports tournaments.</p>
            <asp:Button ID="btnFeatureTournament" Text="Feature Tournament" runat="server" OnClick="GoToTournaments" />
        </div>
    </section>

    <!-- New Game Section -->
    <section id="games" class="section">
        <h2>Games</h2>
        <p>Explore tournaments for your favorite games. Select a game and start your journey.</p>
        <div class="card-container">
            <div class="card">
                <img src="image/cod.jpeg" alt="Call of Duty: Warzone">
                <h3>Call of Duty: Warzone</h3>
            </div>
            <div class="card">
                <img src="image/freefire.jpeg" alt="Free Fire">
                <h3>Free Fire</h3>
            </div>
            <div class="card">
                <img src="image/valorent.jpeg" alt="Valorant">
                <h3>Valorant</h3>
            </div>
            <div class="card">
                <img src="image/bgmi.jpeg" alt="BGMI">
                <h3>BGMI</h3>
            </div>
            <div class="card">
                <img src="image/codm.jpeg" alt="Call of Duty Mobile">
                <h3>Call of Duty Mobile</h3>
            </div>
        </div>
        <asp:Button ID="btnGoToTournament" Text="Go to Tournaments" runat="server" OnClick="GoToTournaments" CssClass="btn-tournament" />
    </section>

    <!-- About Section -->
    <section id="about" class="section">
        <h2>About Esports Hub</h2>
        <p>We are dedicated to bringing gamers together through seamless tournament organization and participation. Our mission is to elevate the esports experience globally.</p>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Esports Hub. Designed for Gamers, by Gamers.</p>
    </footer>
</asp:Content>
