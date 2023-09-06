<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Employee Form</title>
</head>
<body>
	  <h1>Employee Add Form</h1>
  <form action="savenewemp" method="post">
   <table style="with: 80%">
    <tr>
     <td>Emp No</td>
     <td><input type="text" name="empno" /></td>
    </tr>
    <tr>
     <td> Name</td>
     <td><input type="text" name="ename" /></td>
    </tr>
    <tr>
     <td>Job</td>
     <td><input type="text" name="job" /></td>
    </tr>
    <tr>
     <td>Sal</td>
     <td><input type="text" name="sal" /></td>
    </tr>
    <tr>
     <td>Dept NO</td>
     <td><input type="text" name="dept_no" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
</body>
</html>