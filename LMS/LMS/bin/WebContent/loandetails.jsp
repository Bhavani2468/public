<%@ page language="java" import="java.util.*,com.models.LoanApplication" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    center {
        margin-top: 20px;
    }

    h1 {
        color: #333;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 0 auto;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0px 0px 10px #aaa;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
        width: 7.14%; /* 100% divided by 14 columns for equal width */
    }

    th {
        background-color: #007bff;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
    .edit-button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 2px;
        cursor: pointer;
        border-radius: 5px;
    }
     .save-button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 2px;
        cursor: pointer;
        border-radius: 5px;
    }
</style>
</head>
<body>
<center>
<h1>Loan Details</h1>
	<table border="1px">
        <tr>
            <th>lnap_id</th>
            <th>lnap_cust_id</th>
            <th>lnap_apdate</th>
            <th>lnty_id</th>
            <th>l_amt</th>
            <th>Emi</th>
            <th>nom req</th>
            <th>cibil score</th>
            <th>status</th>
            <th>conclu rem</th>
            <th>proce user</th>
            <th>p date</th>
            <th>Edit and Save</th>
            <th>Submit</th>
        </tr>
        <tbody>
	<% ArrayList<LoanApplication> al=(ArrayList<LoanApplication>)request.getAttribute("ld");
		for(LoanApplication l:al){
	%>
		<tr>
			<td><%=l.getLnap_id()%></td>
			<td><%=l.getLnap_cust_id()%></td>
			<td><%=l.getLnap_apdate()%></td>
			<td><%=l.getLnap_lnty_id()%></td>
			<td><%=l.getLnap_amount()%></td>
			<td><%=l.getLnap_emi()%></td>
			<td><%=l.getLnap_nom_requested()%></td>
			<td><%=l.getLnap_cibil_Score()%></td>
			<td><%=l.getLnap_status()%></td>
			<td><%=l.getLnap_conclusion_remarks()%></td>
			<td><%=l.getLnap_processed_user()%></td>
			<td><%=l.getLnap_processed_Date()%></td>
			<td><button class="edit-button" onclick="toggleEditSave(this)">Edit</button></td>
			<td><form action="id"><input type="hidden" name="lnap_id" value="<%=l.getLnap_id()%>">
			<input type="hidden" id="s1" name="lnap_status">
			<input type="hidden" id="s2" name="lnap_conclusion_remarks">
			<input class="save-button" type="submit" value="Submit"></form></td>
		</tr>
	
	<%} %>
	</tbody>
		</table>
		</center>
		<script>
		 var lAmtInput;
		 var nomReqInput; 
		function toggleEditSave(row) {
	        var tableRow = row.parentNode.parentNode;
	        var lAmtCell = tableRow.cells[8]; // Index 9 corresponds to the "l_amt" column
	        var nomReqCell = tableRow.cells[9]; // Index 10 corresponds to the "nom req" column

	        if (row.textContent === "Edit") {
	            // Switch to edit mode
	          lAmtInput = document.createElement("input");
	            nomReqInput = document.createElement("input");

	            lAmtInput.value = lAmtCell.innerText;
	            console.log(lAmtInput.value);
	            nomReqInput.value = nomReqCell.innerText;

	            lAmtCell.innerHTML = '';
	            nomReqCell.innerHTML = '';

	            lAmtCell.appendChild(lAmtInput);
	            nomReqCell.appendChild(nomReqInput);
	            

	            row.textContent = "Save";
	        } else if (row.textContent === "Save") {
	        	row.textContent = "Edit";
	            // Save changes and switch back to edit mode
	            lAmtCell.innerText = lAmtCell.querySelector("input").value;
	            nomReqCell.innerText = nomReqCell.querySelector("input").value;
	            document.getElementById("s1").value=lAmtInput.value;
	            console.log(lAmtInput.value)
	            document.getElementById("s2").value=nomReqInput.value;
	            lAmtCell.removeChild(lAmtCell.querySelector("input"));
	            nomReqCell.removeChild(nomReqCell.querySelector("input"));
				
	            
	        }
	    }
</script>
</body>
</html>