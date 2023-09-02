<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>
</head>
<body>
<center>
<form action="amt" method="GET">
<table>
<tr>
<td>Doctor : <b>Dr.M.Subba lakshmi</b></td>
</tr>
<tr><td></td></tr>
<tr>
<td>Appointment date : </td><td><input type="date" name="cal" id="acal" placeholder="Choose appointment date" onchange="slots()"> </td>
</tr>
</table>
<br><br><br>
From : <input type="text" id="if" name="from"><br><br>
To : <input type="text" id="it" name="to"><br><br>
<input type="submit" value="Confirm">
</form>

<div id="buttn" name="divbt" style="padding-top:30px;"></div><br><br>
<div id="innerdiv" name="idiv"></div>
<br><br><br>



<form action="amt2" method="post">
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
        <input type="submit" value="Register">
    </form>
</center>



<script>

<%
List<Integer> l =(List<Integer>)request.getAttribute("dlist");
for(Integer d:l)
{
%>

var highlightedDate = '<%= d %>';

function styleHighlightedDate() {
    var calendarInput = document.getElementById('acal');
    if (calendarInput && highlightedDate) {
        calendarInput.value = highlightedDate; 
        calendarInput.style.backgroundColor = 'red'; 
    }
}

styleHighlightedDate();

<%
}
%>






function slots()
{
	var divb=document.getElementById("buttn");
	divb.innerHTML="";
	var a=document.createElement("button");
	a.style.backgroundColor="green";
	a.style.color="white";
	a.textContent="Slot1";
	 a.addEventListener("click", function() {
		 var id=document.getElementById("innerdiv");
			id.innerHTML="";
			var a1=document.createElement("button");
			a1.style.backgroundColor="green";
			a1.style.color="white";
			a1.textContent="8 - 8.30";
			 a1.addEventListener("click", function() { 
				document.getElementById("if").value="08:00:00";
				document.getElementById("it").value="08:30:00";
				 console.log("Clicked on 8 - 8.30");
			    });
			id.appendChild(a1);
			
			var a2=document.createElement("button");
			a2.style.backgroundColor="green";
			a2.style.color="white";
			a2.textContent="8.30 - 9";
			 a2.addEventListener("click", function() { 
					document.getElementById("if").value="08:30:00";
					document.getElementById("it").value="09:00:00";
					// console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a2);
			
			var a3=document.createElement("button");
			a3.style.backgroundColor="green";
			a3.style.color="white";
			a3.textContent="9 - 9.30";
			 a3.addEventListener("click", function() { 
					document.getElementById("if").value="09:00:00";
					document.getElementById("it").value="09:30:00";
					// console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a3);
	    });
	divb.appendChild(a);
	var b=document.createElement("button");
	b.style.backgroundColor="green";
	b.style.color="white";
	b.textContent="Slot2";
	 b.addEventListener("click", function() {
		 var id=document.getElementById("innerdiv");
			id.innerHTML="";
			var a1=document.createElement("button");
			a1.style.backgroundColor="green";
			a1.style.color="white";
			a1.textContent="8 - 8.30";
			 a1.addEventListener("click", function() { 
					document.getElementById("if").value="02:00:00";
					document.getElementById("it").value="02:30:00";
					 console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a1);
			
			var a2=document.createElement("button");
			a2.style.backgroundColor="green";
			a2.style.color="white";
			a2.textContent="8.30 - 9";
			 a2.addEventListener("click", function() { 
					document.getElementById("if").value="02:30:00";
					document.getElementById("it").value="03:00:00";
					// console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a2);
			
			var a3=document.createElement("button");
			a3.style.backgroundColor="green";
			a3.style.color="white";
			a3.textContent="9 - 9.30";
			 a3.addEventListener("click", function() { 
					document.getElementById("if").value="03:00:00";
					document.getElementById("it").value="03:30:00";
					 //console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a3);
	    });
	divb.appendChild(b);
	var c=document.createElement("button");
	c.style.backgroundColor="green";
	c.style.color="white";
	c.textContent="Slot3";
	 c.addEventListener("click", function() {
		 var id=document.getElementById("innerdiv");
			id.innerHTML="";
			var a1=document.createElement("button");
			a1.style.backgroundColor="green";
			a1.style.color="white";
			a1.textContent="8 - 8.30";
			 a1.addEventListener("click", function() { 
					document.getElementById("if").value="06:00:00";
					document.getElementById("it").value="06:30:00";
					 console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a1);
		 var a2=document.createElement("button");
			a2.style.backgroundColor="green";
			a2.style.color="white";
			a2.textContent="8.30 - 9";
			 a2.addEventListener("click", function() { 
					document.getElementById("if").value="06:30:00";
					document.getElementById("it").value="07:00:00";
					// console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a2);
			
			var a3=document.createElement("button");
			a3.style.backgroundColor="green";
			a3.style.color="white";
			a3.textContent="9 - 9.30";
			 a3.addEventListener("click", function() { 
					document.getElementById("if").value="07:00:00";
					document.getElementById("it").value="07:30:00";
					// console.log("Clicked on 8 - 8.30");
				    });
			id.appendChild(a3);
	    });
	divb.appendChild(c);
}
</script>
</body>
</html>