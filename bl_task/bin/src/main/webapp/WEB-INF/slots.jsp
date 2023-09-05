<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slots</title>
</head>
<body>
<div id="slot"></div>
	<script>
	<%
		ArrayList<Integer> clist=null;
		if(request.getAttribute("scount")!=null)
		{
			clist=(ArrayList<Integer>)request.getAttribute("scount");
		}
		System.out.println(clist);
		for(int c : clist)
		{%>
			var div=document.createElement("div");
			<%
			for(int i=1;i<=c;i++)
			{%>
				var button=document.createElement("button");
				button.textContent="slot "+"<%=i%>";
				button.onclick = function() {
						
						window.location.href="patients";
				}
				div.appendChild(button);
			<%}%>
			document.getElementById("slot").appendChild(div);
		<%}
	%>
	</script>
</body>
</html>