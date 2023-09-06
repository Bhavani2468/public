<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function fun(event)
{
	event.preventDefault();
	var eid=document.getElementById("eno").value;
	window.location.href="emplist?empid="+eid;
}
</script>
</head>
<body>

<form onsubmit="fun(event)">
<input type="number" id="eno" name="empid">
<input type="submit" value="search">
</form>
</body>
</html>