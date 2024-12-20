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
    <title>View Bills - Billing Software</title>
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
        .no-data {
            text-align: center;
            color: #888;
            margin: 20px 0;
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
        <h1>View Bills</h1>
    </header>

    <div class="container">
        <h2>All Generated Bills</h2>
        <%
            try {
                Connection conn = DatabaseConnection.initializeDatabase();
                String query = "SELECT DISTINCT billId, billDate, totalAmount FROM bills ORDER BY billDate DESC";
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();
        %>
        <table>
            <thead>
                <tr>
                    <th>Bill ID</th>
                    <th>Date</th>
                    <th>Total Amount (₹)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    boolean hasBills = false;
                    while (rs.next()) {
                        hasBills = true;
                        int billId = rs.getInt("billId");
                        String billDate = rs.getString("billDate");
                        double totalAmount = rs.getDouble("totalAmount");
                %>
                <tr>
                    <td><%= billId %></td>
                    <td><%= billDate %></td>
                    <td><%= totalAmount %></td>
                    <td>
                        <form action="viewBillDetails.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="billId" value="<%= billId %>">
                            <button type="submit">View Details</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                    if (!hasBills) {
                %>
                <tr>
                    <td colspan="4" class="no-data">No bills have been generated yet.</td>
                </tr>
                <%
                    }
                    conn.close();
                %>
            </tbody>
        </table>
        <%
            } catch (Exception e) {
                out.println("<p class='no-data'>Error fetching bills: " + e.getMessage() + "</p>");
            }
        %>
    </div>

    <footer>
        <p>&copy; 2024 Billing Software Project. All Rights Reserved.</p>
    </footer>
</body>
</html>
