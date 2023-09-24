<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar p {
            float: right;
            display: block;
            color: white;
            text-align: center;
          	
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        .dashboard-item {
            text-align: center;
            background-color: #f2f2f2;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 30%;
        }

        .dashboard-item a {
            text-decoration: none;
        }

        .dashboard-item h2 {
            margin: 0;
        }

        .dashboard-item p {
            margin-top: 10px;
        }

        .dashboard-item button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .dashboard-item button:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<% String un=request.getParameter("username");
String ut = ""+request.getParameter("usertype");
%>
<div class="header">
    <h1>Welcome to Dashboard</h1>
</div>
<div class="navbar">
    <a href="#">Home</a>
    <a href="#">About</a>
    <a href="#">Services</a>
    <a href="#">Contact</a>
    <p>👤 <%=un %></p>
</div>

<div class="container">
    <div class="dashboard-item">
        <a href="adminld1?usertype=<%=ut %>">
            <button><h2>Processed Loans</h2></button>
        </a>
        <p>View and manage processed loan applications.</p>
    </div>
    <div class="dashboard-item">
        <a href="adminld?un=<%=un %>&usertype=<%=ut %>">
            <button><h2>InProgress Loans</h2></button>
        </a>
        <p>Track loans that are currently in progress.</p>
    </div>
    <div class="dashboard-item">
        <a href="adminld2?usertype=<%=ut %>">
            <button><h2>Rejected Loans</h2></button>
        </a>
        <p>Review and manage rejected loan applications.</p>
    </div>
</div>
<div class="footer">
    <p>&copy; 2023 Pennant. All rights reserved.</p>
</div>
</body>
</html>
