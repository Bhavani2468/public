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
            <th>range from</th>
            <th>range to</th>
            <th>nom req</th>
            <th>cibil score</th>
            <th>status</th>
            <th>conclu rem</th>
            <th>proce user</th>
            <th>p date</th>
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
			<td><%=l.getLnap_emi_range_from()%></td>
			<td><%=l.getLnap_emi_range_to()%></td>
			<td><%=l.getLnap_nom_requested()%></td>
			<td><%=l.getLnap_cibil_Score()%></td>
			<td><%=l.getLnap_status()%></td>
			<td><%=l.getLnap_conclusion_remarks()%></td>
			<td><%=l.getLnap_processed_user()%></td>
			<td><%=l.getLnap_processed_Date()%></td>
		</tr>
	
	<%} %>
	</tbody>
		</table>
		</center>
</body>
</html>