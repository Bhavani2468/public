<%@ page language="java" import="org.json.JSONObject" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Form Data</title>
</head>
<body>
    <h1>Display Form Data</h1>
    
    <h2>Personal Details</h2>
    <%
        // Retrieve and parse the JSON data from the session attribute for Personal Details
        String formData1 = (String) session.getAttribute("formData-1");
        if (formData1 != null) {
            JsonObject data = new com.google.gson.JsonParser().parse(formData1).getAsJsonObject();
    %>
        <p>First Name: <%= data.get("fn").getAsString() %></p>
        <p>Last Name: <%= data.get("ln").getAsString() %></p>
        <p>Date of Birth: <%= data.get("dob").getAsString() %></p>
        <p>Pancard No: <%= data.get("pan").getAsString() %></p>
        <p>Mobile Number: <%= data.get("mbn").getAsString() %></p>
        <p>Address: <%= data.get("addr").getAsString() %></p>
        <p>Guardian Name: <%= data.get("gn").getAsString() %></p>
    <%
        }
    %>

    <h2>Loan Details</h2>
    <%
        // Retrieve and parse the JSON data from the session attribute for Loan Details
        String formData2 = (String) session.getAttribute("formData-2");
        if (formData2 != null) {
            JsonObject data = new com.google.gson.JsonParser().parse(formData2).getAsJsonObject();
    %>
        <p>Loan Type: <%= data.get("ltype").getAsString() %></p>
        <p>Loan Amount: <%= data.get("lamt").getAsString() %></p>
        <p>Minimum EMI Amount: <%= data.get("lbemi").getAsString() %></p>
        <p>Maximum EMI Amount: <%= data.get("lhemi").getAsString() %></p>
        <p>Nominee Count: <%= data.get("ln").getAsString() %></p>
    <%
        }
    %>

    <h2>Nominee Details</h2>
    <%
        // Retrieve and parse the JSON data from the session attribute for Nominee Details
        String formData3 = (String) session.getAttribute("formData-3");
        if (formData3 != null) {
            JsonObject data = new com.google.gson.JsonParser().parse(formData3).getAsJsonObject();
    %>
        <p>Nominee Name: <%= data.get("nn").getAsString() %></p>
        <p>Nominee Relation: <%= data.get("nr").getAsString() %></p>
    <%
        }
    %>
</body>
</html>
