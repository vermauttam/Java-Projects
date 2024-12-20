<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Billing Software</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }
        header {
            background-color: #007BFF;
            color: white;
            padding: 15px;
            text-align: center;
        }
        header h1 {
            margin: 0;
        }
        .welcome {
            text-align: center;
            margin: 20px 0;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
        }
        .card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            width: 250px;
            margin: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            text-align: center;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card h3 {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            margin: 0;
        }
        .card p {
            padding: 15px;
            margin: 0;
        }
        .card a {
            display: block;
            padding: 10px;
            margin: 10px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .card a:hover {
            background-color: #0056b3;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            margin-top: 30px;
        }
        .logout {
            position: absolute;
            right: 20px;
            top: 20px;
            background-color: #dc3545;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <header>
        <h1>Billing Software Dashboard</h1>
        <form action="logoutServlet" method="post" style="display: inline;">
            <button class="logout" type="submit">Logout</button>
        </form>
    </header>

    <div class="welcome">
        <h2>Welcome, <%= username %>!</h2>
        <p>Manage your billing tasks efficiently.</p>
    </div>

    <div class="container">
        <div class="card">
            <h3>Customer Management</h3>
            <p>Add, edit, and delete customer details.</p>
            <a href="customerManagement.jsp">Go to Customers</a>
        </div>
        <div class="card">
            <h3>Generate Invoice</h3>
            <p>Create and manage invoices easily.</p>
            <a href="generateInvoice.jsp">Go to Invoices</a>
        </div>
        <div class="card">
            <h3>View Reports</h3>
            <p>Analyze transaction history and performance.</p>
            <a href="reports.jsp">View Reports</a>
        </div>
        <div class="card">
            <h3>Inventory Management</h3>
            <p>Track and manage product inventory.</p>
            <a href="inventoryManagement.jsp">Manage Inventory</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Billing Software Project. All Rights Reserved.</p>
    </footer>
</body>
</html>
