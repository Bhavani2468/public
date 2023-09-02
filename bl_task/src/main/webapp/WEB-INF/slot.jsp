<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.button-table {
 border-collapse: collapse;
  table-layout: fixed;
}

.button-table td {
  width: 16.66%; /* Distribute equally across 6 columns */

  text-align: center;
  border: 1px solid #ccc;
}

.button-table input[type="button"] {
  width: 150px;
  padding: 10px;
  font-size: 30px;
   background-color: green;
}

</style>
</head>
<body>
<div class="container">
<table class="button-table">
<tr>
<td><input type="button" name="s1" id="8" value="slot1" onclick="pregister(8)"></td>
</tr>
<tr>
<td><input type="button" name="s2" id="2" value="slot2" onclick="pregister(2)"></td>
</tr>
<tr>
<td><input type="button" name="s3" id="6" value="slot3" onclick="pregister(6)"></td>

</tr>
</table>
</div>
<script>
<%
List<String>ll=null;
System.out.println("Entered slot page..");
if(request.getParameter("p") .equals("res"))
{
	ll =(List<String>)request.getAttribute("slist");
}
else
{
	ll =(List<String>)request.getAttribute("oslist");
}
%>
var dateid=<%= request.getParameter("button") %>;

window.onload = function()
{
<%
for(String d:ll)
{
	String[] s=d.split(":");
	System.out.println("s values..."+s[0]+" "+s[1]);
%>
console.log("helloo..."+<%= request.getParameter("button") %>);
	if(<%= request.getParameter("button") %>=="<%=s[0]%>")
	{
	console.log("helllooo...");
	document.getElementById(<%=s[1]%>).style.backgroundColor="red";
	}
<%
}
%>
}


function pregister(slot)
{
	var flag=0;
	var sid=<%=request.getAttribute("lastid")%>;
	console.log(sid);
<%

for(String d:ll)
{
	String[] s=d.split(":");
%>
	if((<%= request.getParameter("button") %>=="<%=s[0]%>") && (slot=="<%=s[1]%>"))
	{
			flag=1;
	}
		
	<%}%>
	if(flag==0)
		window.location.href = "patients?lastId="+encodeURIComponent(sid)+"&buttonId="+encodeURIComponent(slot)+"&dateId="+encodeURIComponent(dateid)+"&p="+encodeURIComponent("<%=request.getParameter("p")%>");
	
}



</script>





</body>
</html>