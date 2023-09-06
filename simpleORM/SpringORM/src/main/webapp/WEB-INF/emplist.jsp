<%@ page language="java" import="java.util.*,orm.model.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display EmpList</title>
<style>
td {
    border: 1px solid #000; /* Border properties */
}
.container {
  display: flex;
  justify-content: center; /* Horizontally center */
  align-items: center; /* Vertically center */
  height: 100vh; /* Set the container height to the viewport height */
}
</style>
</head>
<body>
<center>
<div id="emplist" class="container"></div>
</center>
<script>
var div=document.getElementById("emplist");
<%
	ArrayList<Employee>l=null;
	if(request.getAttribute("elist")!=null)
	{
		l=(ArrayList<Employee>)request.getAttribute("elist");
	}
	System.out.println("List in jsp is.."+l);	
	%>
	var table=document.createElement("table");
	table.style.border = "1px solid #000";
	<%
	for(Employee e:l)
	{
	%>
		var row=document.createElement("tr");
		var id=document.createElement("td");
		id.textContent="<%= e.getEmpno()%>";
		row.appendChild(id);
		
		var ename=document.createElement("td");
		ename.textContent="<%= e.getEname()%>";
		row.appendChild(ename);
		
		var job=document.createElement("td");
		job.textContent="<%= e.getJob()%>";
		row.appendChild(job);
		
		var sal=document.createElement("td");
		sal.textContent="<%= e.getSal()%>";
		row.appendChild(sal);
		
		var deptno=document.createElement("td");
		deptno.textContent="<%= e.getDept_no()%>";
		row.appendChild(deptno);
		table.appendChild(row);
	<%
	}
	%>
	div.appendChild(table);
</script>
</body>
</html>