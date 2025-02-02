<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tournaments.aspx.cs" Inherits="EsportsHub.Tournaments" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esports Hub - Tournaments</title>
    <link rel="stylesheet" href="css/StyleSheet1.css">
</head>
<body>
    <header>
        <div class="logo">🎮 Esports Hub</div>
        <nav>
            <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Tournaments.aspx">Tournaments</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <section id="tournaments" class="section">
        <h2>Available Tournaments</h2>
        <div class="tournament-list">
            <div class="tournament-card">
                <h3>Battle Royale Showdown</h3>
                <p>Date: January 15, 2025</p>
                <p>Prize Pool: $50,000</p>
                <button onclick="registerTournament('Battle Royale Showdown')">Register</button>
            </div>
            <div class="tournament-card">
                <h3>FPS Masters League</h3>
                <p>Date: February 10, 2025</p>
                <p>Prize Pool: $100,000</p>
                <button onclick="registerTournament('FPS Masters League')">Register</button>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Esports Hub. Designed for Gamers, by Gamers.</p>
    </footer>

    <script>
        function registerTournament(tournamentName) {
            alert("You have registered for " + tournamentName + "!");
        }
    </script>
</body>
</html>
