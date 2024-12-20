<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Billing Software Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        header {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }
        nav {
            margin: 20px;
            text-align: center;
        }
        nav a {
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
            margin: 0 15px;
            padding: 10px 20px;
            border: 2px solid #007BFF;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        nav a:hover {
            background-color: #007BFF;
            color: white;
        }
        section {
            margin: 40px auto;
            width: 80%;
            text-align: center;
        }
        footer {
            margin-top: 30px;
            text-align: center;
            padding: 10px;
            background-color: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Billing Software</h1>
        <p>Efficient and Reliable Billing Management System</p>
    </header>

    <nav>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </nav>

    <section>
        <h2>About the Software</h2>
        <p>
            Our Billing Software is designed to simplify and automate the billing process for businesses.
            Manage items, generate invoices, and keep track of customer transactions seamlessly.
        </p>
        <h3>Key Features:</h3>
        <ul style="list-style-type: square; text-align: left; display: inline-block;">
            <li>Login and User Management</li>
            <li>Inventory and Item Management</li>
            <li>Automated Bill Generation</li>
            <li>Transaction History and Reports</li>
            <li>Secure and Easy-to-Use Interface</li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2024 Billing Software Project. All Rights Reserved.</p>
    </footer>
</body>
</html>
