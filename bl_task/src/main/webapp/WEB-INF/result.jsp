<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Booking</title>
<style>
body
{
	 background: linear-gradient(to bottom, #11998e, #38ef7d);
}
.container {
  display: flex;
  align-items: center;
  justify-content: center;
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
  width: 50px;
  padding: 10px;
  font-size: 30px;
  background-color: green;
}

</style>
<script>
window.onload = function()
{
<%
List<Integer> ll =(List<Integer>)request.getAttribute("dlist");
for(Integer d:ll)
{
%>
	document.getElementById(<%=d%>).style.backgroundColor="red";
<%
}
%>
}
function slots(name)
{
	var flag=0;
<%
	List<Integer> l =(List<Integer>)request.getAttribute("dlist");
	for(Integer d:l)
	{
	%>
		if(name==<%=d%>)
		{
			flag=1;
		}
		
	<%}%>
	
	if(flag==0)
		window.location.href = "slot?button=" + encodeURIComponent(name)+"&p="+encodeURIComponent("res");
	
}
function goToOct()
{
	var i= "<%=request.getParameter("img")%>";
	var n= "<%=request.getParameter("name")%>";
	window.location.href="october?img="+encodeURIComponent(i)+"&name="+encodeURIComponent(n);	
}
</script>
</head>
<body>
<Center>

<img src="<%=request.getParameter("img")%>"   style="width:200px;height:200px;">
<h4><%=request.getParameter("name")%></h4>






<div class="container">
<table class="button-table">
<tr><td colspan="7"><h2>September<input type="button" value=">" id="m2" onclick="goToOct()"  style="width:25px;height:25px;background-color:white;padding:0px;font-size:20px;border: none;"></h2></td></tr>
<tr>
<td><input type="button" id="1" value="1"  style="background-color: gray;"></td>
<td><input type="button" id="2" value="2" onclick="slots(2)"></td>
<td><input type="button" id="3" value="3" onclick="slots(3)"></td>
<td><input type="button" id="4" value="4" onclick="slots(4)"></td>
<td><input type="button" id="5" value="5" onclick="slots(5)"></td>
<td><input type="button" id="6" value="6" onclick="slots(6)"></td>
<td><input type="button" id="7" value="7" onclick="slots(7)"></td>
</tr>
<tr>

<td><input type="button" id="8" value="8"  style="background-color: gray;"></td>
<td><input type="button" id="9" value="9" onclick="slots(9)"></td>
<td><input type="button" id="10" value="10" onclick="slots(10)"> </td>
<td><input type="button" id="11" value="11" onclick="slots(11)"></td>
<td><input type="button" id="12" value="12"  onclick="slots(12)"></td>
<td><input type="button" id="13" value="13" onclick="slots(13)"></td>
<td><input type="button" id="14" value="14" onclick="slots(14)"></td>
</tr>
<tr>

<td><input type="button" id="15" value="15"  style="background-color: gray;"></td>
<td><input type="button" id="16" value="16" onclick="slots(16)"></td>
<td><input type="button" id="17" value="17" onclick="slots(17)"></td>
<td><input type="button" id="18" value="18"  onclick="slots(18)"></td>
<td><input type="button" id="19" value="19" onclick="slots(19)"></td>
<td><input type="button" id="20" value="20" onclick="slots(20)"></td>
<td><input type="button" id="21" value="21" onclick="slots(21)"></td>
</tr>
<tr>

<td><input type="button" id="22" value="22"  style="background-color: gray;"></td>
<td><input type="button" id="23" value="23" onclick="slots(23)"></td>
<td><input type="button" id="24" value="24" onclick="slots(24)"></td>
<td><input type="button" id="25" value="25" onclick="slots(25)"></td>
<td><input type="button" id="26" value="26" onclick="slots(26)"></td>
<td><input type="button" id="27" value="27" onclick="slots(27)"></td>
<td><input type="button" id="28" value="28" onclick="slots(28)"></td>
</tr>
<tr>

<td><input type="button" id="29" value="29"  style="background-color: gray;"></td>
<td><input type="button" id="30" value="30" onclick="slots(30)" ></td>
<td><input type="button" id="31" value="31" onclick="slots(31)"></td>
</tr>
</table>
</div>
</Center>



</body>
</html>