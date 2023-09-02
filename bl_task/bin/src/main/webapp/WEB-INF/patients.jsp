<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="amt2" method="get">
        <table>
            <tr>
                <td><label for="name">Patient Name:</label></td>
                <td><input type="text" id="name" name="name" required></td>
            </tr>
            <tr>
                <td><label for="age">Age:</label></td>
                <td><input type="number" id="age" name="age" required></td>
            </tr>
            <tr>
                <td><label for="gender">Gender:</label></td>
                <td>
                    <select id="gender" name="gender" required>
                        <option value="M">Male</option>
                        <option value="F">Female</option>
                        <option value="O">Others</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="mobile">Mobile Number:</label></td>
                <td><input type="tel" id="mobile" name="mobile" required></td>
            </tr>
        </table>
        <br>
        <input type="hidden" name="lastId" value="<%=request.getParameter("lastId")%>" />
    <input type="hidden" name="buttonId" value="<%=request.getParameter("buttonId")%>" />
    <input type="hidden" name="dateId" value="<%=request.getParameter("dateId")%>" />
        <input type="submit" value="Register">
    </form>
</center>
</body>
</html>