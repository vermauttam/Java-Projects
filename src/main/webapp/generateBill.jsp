<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>
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
    <title>Generate Bill - Billing Software</title>
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
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        form {
            display: flex;
            justify-content: space-between;
        }
        form select, form input[type="number"] {
            padding: 10px;
            width: 200px;
            margin-right: 10px;
        }
        button {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
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
        <h1>Generate Bill</h1>
    </header>

    <div class="container">
        <h2>Billing Details</h2>

        <!-- Display Error or Success Messages -->
        <div style="color: red; text-align: center;">
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
                    out.println(errorMessage);
                }
            %>
        </div>

        <form action="addToBillServlet" method="post">
            <select name="itemCode" required>
                <option value="">Select Item</option>
                <%
                    try {
                        Connection conn = DatabaseConnection.initializeDatabase();
                        String query = "SELECT itemCode, itemName FROM items";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            String code = rs.getString("itemCode");
                            String name = rs.getString("itemName");
                %>
                <option value="<%= code %>"><%= name %> (<%= code %>)</option>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        out.println("<option disabled>Error fetching items</option>");
                    }
                %>
            </select>

            <input type="number" name="quantity" placeholder="Enter Quantity" required min="1">
            <button type="submit">Add to Bill</button>
        </form>

        <!-- Display Current Bill -->
        <h3>Current Bill</h3>
        <table>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Item Code</th>
                    <th>Quantity</th>
                    <th>Price (per unit)</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    double grandTotal = 0;
                    try {
                        Connection conn = DatabaseConnection.initializeDatabase();
                        String query = "SELECT items.itemName, bill.itemCode, bill.quantity, items.price, (bill.quantity * items.price) AS totalPrice FROM bill INNER JOIN items ON bill.itemCode = items.itemCode";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            String name = rs.getString("itemName");
                            String code = rs.getString("itemCode");
                            int quantity = rs.getInt("quantity");
                            double price = rs.getDouble("price");
                            double total = rs.getDouble("totalPrice");
                            grandTotal += total;
                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= code %></td>
                    <td><%= quantity %></td>
                    <td><%= price %></td>
                    <td><%= total %></td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='5'>Error fetching bill details</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <div class="total">
            Grand Total: ₹<%= grandTotal %>
        </div>

        <form action="finalizeBillServlet" method="post">
            <button type="submit">Finalize Bill</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2024 Billing Software Project. All Rights Reserved.</p>
    </footer>
</body>
</html>
