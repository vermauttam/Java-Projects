
<html>
<body>
<h2>Hello World!</h2>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Billing Software</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <h1>Welcome to the Billing Software</h1>
        <nav>
            <ul>
                <li><a href="createBill.jsp">Create Bill</a></li>
                <li><a href="viewBills.jsp">View Bills</a></li>
                <li><a href="payment.jsp">Make Payment</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Create a New Bill</h2>
        <form action="processBill.jsp" method="post">
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" required><br><br>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required><br><br>

            <input type="submit" value="Generate Bill">
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Billing Software. All rights reserved.</p>
    </footer>
</body>
</html>
</html>
