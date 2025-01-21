<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error - Billing Software</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8d7da;
            color: #721c24;
        }
        header {
            background-color: #f5c6cb;
            color: #721c24;
            padding: 15px;
            text-align: center;
        }
        header h1 {
            margin: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #f5c6cb;
        }
        h2 {
            text-align: center;
            color: #721c24;
        }
        p {
            font-size: 16px;
            line-height: 1.6;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #f5c6cb;
            color: #721c24;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #f1b0b7;
        }
        footer {
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #f5c6cb;
            color: #721c24;
        }
    </style>
</head>
<body>
    <header>
        <h1>Oops! Something went wrong</h1>
    </header>

    <div class="container">
        <h2>An Error Occurred</h2>
        <p>
            We encountered an error while processing your request. Please find the details below:
        </p>
        <p><strong>Error Message:</strong></p>
        <p>
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage == null) {
                    out.println("An unknown error occurred. Please try again later.");
                } else {
                    out.println(errorMessage);
                }
            %>
        </p>
        <a href="dashboard.jsp">Go Back to Dashboard</a>
    </div>

    <footer>
        <p>&copy; 2024 Billing Software Project. All Rights Reserved.</p>
    </footer>
</body>
</html>
