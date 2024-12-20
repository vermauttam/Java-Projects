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
    <title>Add Item - Billing Software</title>
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
            text-align: center;
            padding: 15px 0;
        }
        header h1 {
            margin: 0;
        }
        form {
            margin: 50px auto;
            width: 40%;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007BFF;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error, .success {
            text-align: center;
            margin-bottom: 15px;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Add New Item</h1>
    </header>

    <form action="addItemServlet" method="post">
        <h2>Item Details</h2>

        <!-- Display error or success message -->
        <div class="error">
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
                    out.println(errorMessage);
                }
            %>
        </div>
        <div class="success">
            <% 
                String successMessage = (String) request.getAttribute("successMessage");
                if (successMessage != null) {
                    out.println(successMessage);
                }
            %>
        </div>

        <label for="itemName">Item Name:</label>
        <input type="text" id="itemName" name="itemName" placeholder="Enter item name" required>

        <label for="itemCode">Item Code:</label>
        <input type="text" id="itemCode" name="itemCode" placeholder="Enter item code" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required min="1">

        <label for="price">Price (per unit):</label>
        <input type="number" id="price" name="price" placeholder="Enter price" required min="0.01" step="0.01">

        <button type="submit">Add Item</button>
    </form>

    <footer>
        <p>&copy; 2024 Billing Software Project. All Rights Reserved.</p>
    </footer>
</body>
</html>
