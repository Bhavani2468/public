<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	padding: 8px 15px;
	cursor: pointer;
}
</style>
</head>
<body>
<center>
	<h1>Your Total Amount</h1><br></br>
	<% double mny=500; %>
	<h1><%=mny%></h1>
	<button id="rzp-button1" >
		<i class="fas fa-money-bill"></i> make payment
	</button>
	</center>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script>
	var pid="";
		document.getElementById('rzp-button1').onclick = function(e) {
			var options = {
				"key" : "rzp_test_4jwnZunhRo2Y9N",
				"amount" : <%=mny%> * 100,
				"currency" : "INR",
				"handler" : function(response) {
					alert(response.razorpay_payment_id);
					pid=response.razorpay_payment_id;
					var ss = new XMLHttpRequest();
					var ttt="<%=mny%>";
					var data="&pid="+pid+"&total="+ttt;
					ss.open('GET', 'presp?par=12'+ data, true)
					ss.onreadystatechange = function () {
						if (ss.readyState === 4) {
							
						}
					}
					ss.send();
				},
			};

			var rzp1 = new Razorpay(options);
			rzp1.open();
			e.preventDefault();
		}
		
	</script>
</body>
</html>