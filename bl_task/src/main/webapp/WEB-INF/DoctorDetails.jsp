<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
   body {
    background: linear-gradient(to bottom, #11998e, #38ef7d);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }
  .card {
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    overflow: hidden;
    width: 18rem;
  }
  .card-img-top {
    width: 100%;
    height: auto;
  }
  .card-body {
    padding: 1rem;
  }
  .card-title {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
  }
  .card-text {
    font-size: 18px;
    color: #666;
  }
  .btn-primary {
    background-color: #007BFF;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.3s ease;
  }
  .btn-primary:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
<% 
	String img=request.getParameter("img");
	System.out.println(img);
	String name=""+request.getParameter("name");
	String qual=""+request.getParameter("qual");
	String exp=""+request.getParameter("exp");
	String desp=""+request.getParameter("desg");
	%>
  <div class="card">
    <img src=<%= img%> class="card-img-top" alt="Doctor's Photo">
    <div class="card-body">
      <h5 class="card-title"><%=name %></h5>
      <p class="card-text"><b>Qualification:</b> <%=qual %></p>
      <p class="card-text"><b>Experience:</b> <%=exp %> years</p>
      <p class="card-text"><b>Designation:</b> <%=desp %></p>
      <a href="res?img=<%= java.net.URLEncoder.encode(img, "UTF-8") %>&name=<%= name %>&qual=<%= qual %>&exp=<%= exp %>&desg=<%= desp %>" class="btn btn-primary">Book Appointment</a>
    </div>
  </div>
</body>
</html>