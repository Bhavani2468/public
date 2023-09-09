<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0px 0px 10px #aaa;
        }

        h1 {
            color: #333;
        }

        .dashboard-item {
            background-color: #f9f9f9;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Admin Dashboard</h1>
    </header>
    <nav>
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Admins</a></li>
            <li><a href="#">Loans</a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Settings</a></li>
        </ul>
    </nav>
    <div class="container">
    	<div class="dashboard-item">
            <center><h2>Welcome</h2></center>
            <!-- Add a list of recent users here -->
        </div>
        <div class="dashboard-item">
            <center><a href="ld"><button><h2>Get Loan Details</h2></button></a></center>
            <!-- Add your statistics and charts here -->
        </div>
    </div>
    <footer>
        &copy; 2023 Admin Dashboard
    </footer>
</body>
</html>
