<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="YourNamespace.Register" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Your Application</title>
    <link rel="stylesheet" href="css/StyleSheet1.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        .register-container h2 {
            margin-bottom: 20px;
        }

        .register-container input[type="text"],
        .register-container input[type="password"],
        .register-container input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .register-container input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .register-container input[type="submit"]:hover {
            background-color: #218838;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Register</h2>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" type="email"></asp:TextBox>
            <asp:Button ID="btnRegister" Text="Register" runat="server" OnClick="btnRegister_Click" />
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
