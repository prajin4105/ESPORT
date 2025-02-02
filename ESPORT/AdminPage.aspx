<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="EsportsHub.AdminPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS here -->
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <nav class="sidebar">
            <div class="sidebar-header">
                <h2>Admin</h2>
            </div>

            <ul class="sidebar-menu">
                <li><a href="#"><i class="fas fa-users"></i> User Management</a></li><br />
                <li><a href="TournamentManagement.aspx"><i class="fas fa-trophy"></i> Tournament Management</a></li><br />
                <li><a href="#"><i class="fas fa-gamepad"></i> Match Management</a></li><br />
                <li><a href="#"><i class="fas fa-calendar"></i> Event Scheduling</a></li><br />
                <li><a href="GameManagement.aspx"><i class="fas fa-gamepad"></i> Game Management</a></li><br />

            </ul>
        </nav>

        <!-- Main Content -->
        <div class="content">
            <header>
                <h2 style="color:black">Dashboard</h2>
                <p>UNDER DOG🐶</p>
            </header>

            <!-- Add User Button -->
            <div class="add-user-btn-container">
                <button class="add-user-btn" onclick="openAddUserModal()">Add User</button>
            </div>

            <div class="card-grid">
                <asp:Repeater ID="RepeaterUsers" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <h3><%# Eval("Username") %></h3>
                            <p>Email: <%# Eval("Email") %></p>
                            <p>Role: <%# Eval("Role") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <!-- Modal for Add User -->
    <div id="addUserModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeAddUserModal()">&times;</span>
            <h3>Add New User</h3>
            <form id="addUserForm" onsubmit="return submitUserForm(event)">
                <label for="username" style="color:black">Username:</label>
                <input type="text" id="username" name="username" required><br><br>

                <label for="email" style="color:black">Email:</label>
                <input type="email" id="email" name="email" required><br><br>

                <label for="password" style="color:black">Password:</label>
                <input type="password" id="password" name="password" required><br><br>

                <label for="role" style="color:black">Role:</label>
                <select id="role" name="role">
                    <option value="Player">Player</option>
                    <option value="Admin">Admin</option>
                    <option value="Coach">Coach</option>
                </select><br><br>

                <button type="submit">Add User</button>
            </form>
        </div>
    </div>

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
            color:white;
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

        .profile-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-bottom: 10px;
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

        header p {
            font-size: 16px;
            color: #6c757d;
        }

        .add-user-btn-container {
            margin-bottom: 20px;
            display: flex;
            justify-content: flex-start;
        }

        .add-user-btn {
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

        .add-user-btn:hover {
            background-color: #0056b3;
        }

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

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 0;
            right: 10px;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

    <script>
        function openAddUserModal() {
            document.getElementById('addUserModal').style.display = 'block';
        }

        function closeAddUserModal() {
            document.getElementById('addUserModal').style.display = 'none';
        }

        function submitUserForm(event) {
            event.preventDefault();

            var username = document.getElementById('username').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var role = document.getElementById('role').value;

            // Send data to server to insert into the database
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'AdminPage.aspx/AddUser', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    alert('User added successfully!');
                    location.reload(); // Reload the page to reflect the changes
                }
            };
            xhr.send(JSON.stringify({
                username: username,
                email: email,
                password: password,
                role: role
            }));

            closeAddUserModal();
        }
    </script>
</body>
</html>
