<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="custom" uri="/WEB-INF/dbDD.tld" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>RailWay Ticket Booking</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<script >

	function removingRow(table,row)
	{
		if(table.rows.length>2)
		{
			var scounter=row.rowIndex-1;
			row.remove();
			for(var i=scounter;i<table.rows.length;i++)
			{
				var currentRow=table.rows[i];
				currentRow.cells[0].textContent=i;
			}
			var cntRow=table.rows[i];
			var nameId="name"+table.rows[scounter];
			var GenderId="gender"+table.rows[scounter];
			var AgeId="age"+table.rows[scounter];
			cntRow.getElementByTagName("input")[0].setAttributes("name",nameId);
			cntRow.getElementByTagName("select")[0].setAttributes("name",genderId);
			cntRow.getElementByTagName("input")[1].setAttributes("name",ageId);
		}
	}
	function addingRow(table)
	{
		var scounter=parseInt(table.rows[table.rows.length-1].cells[0].textContent);
		if(table.rows.length<7)
		{
			var newRow=table.rows[table.rows.length-1].cloneNode(true);
			table.appendChild(newRow);
			newRow.querySelector("input[value='x']").onclick=function(){removingRow(table,newRow);};
			newRow.cells[0].textContent=++scounter;
			var nameId="name"+table.rows[table.rows.length-1];
			console.log("hhhhhhhhhhhhhhhhhhhhhhhhh",nameId);
			var genderId="gender"+table.rows[table.rows.length-1];
			var ageId="age"+table.rows[table.rows.length-1];
			newRow.getElementsByTagName("input")[0].setAttribute("name",nameId);
			newRow.getElementsByTagName("select")[0].setAttribute("name",genderId);
			newRow.getElementsByTagName("input")[1].setAttribute("name",ageId);
		}
	}
	function redirection(page)
	{
		window.location.replace(page);
	}
	
	
	
	
	

	
</script>
<style >

h1
{
	Margin-top:40;
	text-align:center;
}
.buttons
{
	padding-left: 80px;
}
 body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url("https://akm-img-a-in.tosshub.com/aajtak/images/story/202009/train-2-sixteen_nine.jpg?size=948:533");
      background-size: 100%;
      background-repeat: no-repeat;
      background-position: center;
      opacity: 0.3;
    }

    form {
      position: relative;
    }

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">





</head> 
<body>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
<div class="container"> 
 <div class="row justify-content-center">
      <div class="col-12 col-md-8 col-lg-6">
<center> 
<h1><u>Ticket Booking</u></h1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
<form style="padding-top:50px;" action="BookingServlet" method="get">
<table >
<tr>
<td style="padding-bottom: 20px;">
<b>From&nbsp;</b>
	<custom:hello  table="chinnu_trains" displayColumn="trn_start" valueColumn="trn_start"/>

</td >
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td style="padding-bottom: 20px;"><b>To</b>&nbsp;	
<custom:hello  table="chinnu_trains" displayColumn="trn_end" valueColumn="trn_end"/>

</td>
</tr>
<tr>
<td style="padding-bottom: 20px;" colspan="3"><b>Train Name</b>&nbsp;
<custom:hello  table="chinnu_trains" displayColumn="trn_name" valueColumn="trn_no"/>

 
</td>
</tr>


<tr>
<td><b>Class&nbsp;</b><select name="cls" style="background-color: rgba(255, 255, 255, 0.3);">
  <option value="Sleeper">Sleeper</option>
  <option value="1A" selected>1A</option>
  <option value="2A">2A</option>
  <option value="3A">3A</option>
</select></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><b>Date</b>&nbsp;<input type="date" name="tdate" style="background-color: rgba(255, 255, 255, 0.3);"></td>
</tr>

</table>

<b><br>Passengers</b>
<table border="1" style="border-spacing: 0px;" id="passengersTable">
<tr><th>SNO</th><th>Name</th><th>Gender</th><th>Age</th>
<tr id="row1">
<td>1</td>
<td><input type="text" style="width: 200px; height: 25px;background-color: rgba(255, 255, 255, 0.3);"></td>
<td>
<select style="background-color: rgba(255, 255, 255, 0.3);">
<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="Others">Others</option>
</td>
<td><input type="number" style="width: 50px; height: 25px;background-color: rgba(255, 255, 255, 0.3);">&nbsp;<input type="button" value="x" style="color:white; background-color:red" onClick="removingRow(passengersTable,row1)" ></td>
</tr>


</table>
<br>
<div class="buttons"><input type="submit" value="Book" style="color:white; background-color:green;font-size: 16px; font-weight: bold;">&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" style="color:white; background-color:red; font-size: 16px; font-weight: bold;" onClick="redirection('RailwayHomePage.html')">&nbsp;&nbsp;&nbsp;<input type="button" value="Add" style="color:white; background-color:blue; font-size: 16px; font-weight: bold;" onClick="addingRow(passengersTable)"></div>

</form>
</center>
</div></div></div>

</body>
</html>