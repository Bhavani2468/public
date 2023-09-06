<%@ page language="java" import="orm.model.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee has been Successfully Saved</title>
</head>
<body>
<H3> Employee has been added successfully</H3>
<%
		Employee emp=(Employee)request.getAttribute("emp");
%>        
<table>
		<tr><td>Emp No </td>
			<td> <%= emp.getEmpno() %> </td> 
		</tr>
		<tr><td>Name </td>
			<td><%= emp.getEname() %> </td> 
		</tr>
		<tr><td>Job </td>
			<td><%=  emp.getJob() %> </td>
		</tr>
		<tr><td>Salary </td>
			<td><%= emp.getSal() %></td> 
		</tr>
		<tr><td>Dept No </td>
			<td><%= emp.getDept_no() %> </td> 
		</tr>
	</table>
</body>
</html>