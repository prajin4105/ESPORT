<!DOCTYPE html>
<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
    End Sub
</script>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esports Tournament Management</title>
    <link rel="stylesheet" href="css/StyleSheet1.css">

    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #fff;
        }

        header {
            background-color: #1f1f1f;
            padding: 20px;
            text-align: center;
            color: white;
        }

        header .logo {
            font-size: 2rem;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

        .cta {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-size: 1.2rem;
            border-radius: 5px;
        }

        .cta:hover {
            background-color: #0056b3;
        }

        .section {
            padding: 40px 20px;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.8);
        }

        .modal-content {
            background-color: #333;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            color: #fff;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: white;
            text-decoration: none;
            cursor: pointer;
        }

        /* Form Styles */
        .auth-form {
            display: flex;
            flex-direction: column;
        }

        .auth-form input {
            margin: 10px 0;
            padding: 10px;
            font-size: 14px;
            background-color: #444;
            color: white;
            border: 1px solid #666;
        }

        .auth-form input:focus {
            outline: none;
            border-color: #007bff;
        }

        .auth-form button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .auth-form button:hover {
            background-color: #0056b3;
        }

        /* Hero Section */
        .hero {
            background-color: #1f1f1f;
            padding: 80px 20px;
            text-align: center;
        }

        .hero h1 {
            font-size: 3rem;
        }

        .hero p {
            font-size: 1.5rem;
        }

        .hero-image img {
            width: 100%;
            max-width: 500px;
            margin-top: 20px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #1f1f1f;
            color: #888;
        }
    </style>

</head>
<body>
    <header>
        <div class="logo">🎮 Esports Hub</div>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#tournaments">Tournaments</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="javascript:void(0);" onclick="openModal('loginModal')">Login</a></li>
                <li><a href="javascript:void(0);" onclick="openModal('signupModal')">Sign Up</a></li>
            </ul>
        </nav>
    </header>

    <section id="home" class="hero">
        <div class="hero-content">
            <h1>Welcome to Esports Hub</h1>
            <p>Your gateway to organizing and competing in thrilling esports tournaments.</p>
            <a href="#tournaments" class="cta">Discover Tournaments</a>
        </div>
        <div class="hero-image">
            <img src="images/hero-image.png" alt="Esports Arena">
        </div>
    </section>

    <section id="about" class="section">
        <h2>About Esports Hub</h2>
        <p>We are dedicated to bringing gamers together through seamless tournament organization and participation. Our mission is to elevate the esports experience globally.</p>
    </section>

    <section id="tournaments" class="section">
        <h2>Featured Tournaments</h2>
        <div class="tournament-list">
            <div class="tournament-card">
                <h3>Battle Royale Showdown</h3>
                <p>Date: January 15, 2025</p>
                <p>Prize Pool: $50,000</p>
                <button>Register</button>
            </div>
            <div class="tournament-card">
                <h3>FPS Masters League</h3>
                <p>Date: February 10, 2025</p>
                <p>Prize Pool: $100,000</p>
                <button>Register</button>
            </div>
        </div>
    </section>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('loginModal')">&times;</span>
            <h2>Login</h2>
            <form action="login_process.php" method="POST" class="auth-form">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">Login</button>
            </form>
        </div>
    </div>

    <!-- Sign Up Modal -->
    <div id="signupModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('signupModal')">&times;</span>
            <h2>Sign Up</h2>
            <form action="signup_process.php" method="POST" class="auth-form">
                <label for="new-username">Username:</label>
                <input type="text" id="new-username" name="username" required>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                <label for="new-password">Password:</label>
                <input type="password" id="new-password" name="password" required>
                <button type="submit">Sign Up</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Esports Hub. Designed for Gamers, by Gamers.</p>
    </footer>

    <script>
        // Function to open the modal
        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
        }

        // Function to close the modal
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }

        // Close the modal if clicked outside of the modal content
        window.onclick = function (event) {
            if (event.target.className == "modal") {
                event.target.style.display = "none";
            }
        }
    </script>
</body>
</html>
