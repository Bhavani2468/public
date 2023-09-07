<%@ page language="java" import="com.models.*" contentType="text/html; charset=ISO-8859-1"
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
        color: #555;
    }

    form {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0px 0px 10px #aaa;
    }

    h5 {
        margin: 10px 0;
    }

    input[type="hidden"] {
        display: none;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b5;
    }
    body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .container {
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0px 0px 10px #aaa;
        }

        h5 {
            color: #555;
        }
        h1 {
            color: #555;
        }
</style>
</head>
<body>
<% Customer c=(Customer)request.getAttribute("c");
	LoanApplication l=(LoanApplication)request.getAttribute("l");
	LoanApplicantNominee n=(LoanApplicantNominee)request.getAttribute("n");
		%>
<center>
<h1>Preview</h1>
	<form action="savenew">
		<input type="hidden" name="cust_id" value="<%=c.getCust_id() %>" placeholder="Enter FirstName">
		<input type="hidden" name="cust_firstname" value="<%=c.getCust_firstname()%>" placeholder="Enter FirstName">
		<input type="hidden" name="cust_lastname" value="<%=c.getCust_lastname()%>" placeholder="Enter Last name">
		<input type="hidden" name="cust_dob" value="<%=c.getCust_dob()%>" placeholder="Enter hidden of birth">
		<input type="hidden" name="cust_panno" value="<%=c.getCust_panno()%>" placeholder="Enter pancard number"> 
		<input type="hidden" name="cust_mobile" value="<%=c.getCust_mobile()%>" placeholder="Enter mobile number">
		<input type="hidden" name="cust_address" value="<%=c.getCust_address()%>" placeholder="Enter address">
		<input type="hidden" name="cust_gname" value="<%=c.getCust_gname()%>" placeholder="Enter guardian name">
		<input type="hidden" name="cust_luudate" value="<%=c.getCust_luudate()%>" placeholder="Enter guardian name">
		<input type="hidden" name="cust_luser" value="<%=c.getCust_luser()%>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_id" value="<%=l.getLnap_id() %>" placeholder="Enter FirstName">
		<input type="hidden" name="lnap_cust_id" value="<%=l.getLnap_cust_id() %>" placeholder="Enter FirstName">
		<input type="hidden" name="lnap_apdate" value="<%=l.getLnap_apdate() %>" placeholder="Enter Last name">
		<input type="hidden" name="lnap_lnty_id" value="<%=l.getLnap_lnty_id() %>" placeholder="Enter hidden of birth">
		<input type="hidden" name="lnap_amount" value="<%=l.getLnap_amount() %>" placeholder="Enter pancard number">
		<input type="hidden" name="lnap_emi_range_from" value="<%=l.getLnap_emi_range_from() %>" placeholder="Enter mobile number">
		<input type="hidden" name="lnap_emi_range_to"	value="<%=l.getLnap_emi_range_to() %>" placeholder="Enter address">
		<input type="hidden" name="lnap_nom_requested" value="<%=l.getLnap_nom_requested() %>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_cibil_Score" value="<%=l.getLnap_cibil_Score() %>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_status" value="<%=l.getLnap_status() %>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_conclusion_remarks" value="<%=l.getLnap_conclusion_remarks() %>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_processed_user" value="<%=l.getLnap_processed_user() %>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_processed_date" value="<%=l.getLnap_processed_Date() %>" placeholder="Enter guardian name">
		<input type="hidden" name="lnap_idd" value="<%=n.getLnap_id() %>" placeholder="Enter FirstName">
		<input type="hidden" name="lnap_nominee" value="<%=n.getLnap_nominee() %>" placeholder="Enter FirstName">
		<input type="hidden" name="lanp_relation"	value="<%=n.getLanp_relation() %>" placeholder="Enter Last name">
	
		<h5><b>cust_id :</b><%=c.getCust_id() %></h5>
		<h5><b>c_fname :</b><%=c.getCust_firstname() %></h5>
		<h5><b>c_lname :</b><%=c.getCust_lastname() %></h5>
		<h5><b>c_dob :</b><%=c.getCust_dob() %></h5>
		<h5><b>c_pan :</b><%=c.getCust_panno() %></h5>
		<h5><b>c_mobile :</b><%=c.getCust_mobile() %></h5>
		<h5><b>c_address :</b><%=c.getCust_address() %></h5>
		<h5><b>c_gname :</b><%=c.getCust_gname() %></h5>
		<h5><b>cust_luudate :</b><%=c.getCust_luudate() %></h5>
		<h5><b>cust_luser :</b><%=c.getCust_luser() %></h5>
		<h5><b>lnap_id:</b><%=l.getLnap_id() %></h5>
		<h5><b>l_c_id:</b><%=l.getLnap_cust_id() %></h5>
		<h5><b>l_ap_date:</b><%=l.getLnap_apdate() %></h5>
		<h5><b>l_lty_id:</b><%=l.getLnap_lnty_id() %></h5>
		<h5><b>l_amt:</b><%=l.getLnap_amount() %></h5>
		<h5><b>l_range_from:</b><%=l.getLnap_emi_range_from() %></h5>
		<h5><b>l_range_to:</b><%=l.getLnap_emi_range_to() %></h5>
		<h5><b>l_nom_req:</b><%=l.getLnap_nom_requested() %></h5>
		<h5><b>cibil score:</b><%=l.getLnap_cibil_Score() %></h5>
		<h5><b>l_status:</b><%=l.getLnap_status() %></h5>
		<h5><b>l_con_rem:</b><%=l.getLnap_conclusion_remarks() %></h5>
		<h5><b>lP_user:</b><%=l.getLnap_processed_user() %></h5>
		<h5><b>lp_date:</b><%=l.getLnap_processed_Date() %></h5>
		<h5><b>lp_id:</b><%=n.getLnap_id() %></h5>
		<h5><b>lp_nominee:</b><%=n.getLnap_nominee() %></h5>
		<h5><b>lp_relation:</b><%=n.getLanp_relation() %></h5>
		<input type="submit" value="Submit"></input>
		</form>
		</center>
</body>
</html>