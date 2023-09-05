<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body
{
	 background: linear-gradient(to bottom, #11998e, #38ef7d);
}
form
{
	display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh; 
}
td
{
	width: 300px;
    padding: 10px;
    font-size: 25px;
}

 input[type="text"] {
    height: 10px; 
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: transparent; 
  }
  input[type="number"] {
    height: 10px; 
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: transparent; 
  }
  input[type="tel"] {
    height: 10px; 
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: transparent; 
  }
  #regButt {
  width: 100px;
  padding: 10px;
  font-size: 20px;
  background-color: green;
  color: white;
}
</style>
<script>
	function fun(event)
	{
		event.preventDefault(); // Prevent the default form submission
		
		var d = "<%=request.getParameter("slotdate")%>"; // Get the slotdate value from Java
		
		// Get form values
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;
		var gender = document.getElementById("gender").value;
		var mobile = document.getElementById("mobile").value;
		
		// Redirect with query parameters
		var redirectURL = "amt2?slotdate=" + d + "&name=" + name + "&age=" + age + "&gender=" + gender + "&mobile=" + mobile+"&did="+<%=request.getParameter("did")%>;
		window.location.href = redirectURL;
	}
</script>
</head>
<body>
<center>
<form onsubmit="fun(event)"> <!-- Call the fun() function on form submission -->
        <table>
            <tr>
                <td><label for="name">Patient Name:</label></td>
                <td><input type="text" id="name" name="name" required placeholder="Enter patient name"></td>
            </tr>
            <tr>
                <td><label for="age">Age:</label></td>
                <td><input type="number" id="age" name="age" required placeholder="Enter patient age"></td>
            </tr>
            <tr>
                <td><label for="gender">Gender:</label></td>
                <td>
                    <select id="gender" name="gender" required style="background: transparent; ">
                        <option value="M" selected>Male</option>
                        <option value="F">Female</option>
                        <option value="O">Others</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="mobile">Mobile Number:</label></td>
                <td><input type="tel" id="mobile" name="mobile" required placeholder="Enter patient mobile number"></td>
            </tr>
            <tr><td></td></tr>
            <tr>
            <td colspan="2">
            <center><input type="submit" value="Register" id="regButt"></center>
            </td>
            </tr>
        </table>
        <br>
    </form>
</center>
</body>
</html>
