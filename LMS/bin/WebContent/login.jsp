<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
    <h2>Login</h2>
    <form id="loginForm" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="usertype">User Type:</label>
        <select id="usertype" name="usertype">
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select><br><br>
        
        <input type="submit" value="Login">
    </form>
    
    <script>
        document.getElementById('loginForm').addEventListener('submit', function (e) {
            e.preventDefault(); 


            const userType = document.getElementById('usertype').value;

 
            if (userType === 'user') {
                this.action = 'personaldetails.jsp'; 
            } else if (userType === 'admin') {
                this.action = '#'; 
            }

     
            this.submit();
        });
    </script>
</body>
</html>

