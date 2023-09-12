<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi-Part Form</title>
    
    <style>
    /* Reset some default browser styles */
    
        /* CSS for the popup */
        .popup {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1;
}

/* CSS for the popup content */
.popup-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    width: 80%; /* Set the width to 80% of the viewport width */
    max-height: 80%; /* Set a maximum height if needed */
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
    overflow-y: auto; /* Enable vertical scrolling if content overflows */
}

    
    body {
        margin: 0;
        padding-top: 100px;
    }

    .form-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
        border-radius: 5px;
    }
 .popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        z-index: 1;
    }

    /* CSS for the popup content */
    .popup-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        width: 80%;
        max-height: 80%;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        overflow-y: auto;
    }

    /* Style the headings (h3) inside the popup */
    .popup-content h3 {
        font-size: 18px;
        color: #333;
        
    }

    /* Style the paragraph (p) tags inside the popup */
    .popup-content p {
        font-size: 16px;
        color: #555;
        display: inline-block;
    }

    /* Add spacing between the headings and paragraphs */
    .popup-content h3 + p {
        margin-top: 5px;
    }

    /* Style the popup title (if needed) */
    .popup-title {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        margin-bottom: 20px;
    }

    /* Style the tabs */
    .tabs {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
    }

    .tab {
        background-color: green;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .popup div {
    margin-bottom: 10px;
}

.popup h3 {
    font-size: 14px;
    margin: 0;
}

.popup p {
    font-size: 16px;
    margin: 0;
}

.popup input[type="button"],
.popup input[type="submit"] {
    margin-top: 10px;
    padding: 5px 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

.popup input[type="button"]:hover,
.popup input[type="submit"]:hover {
    background-color: #0056b3;
}

    .tab.active-tab {
        background-color: #007bff;
    }

    /* Style the form box */
    .form-box {
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-part h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"] {
        width: 90%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 16px;
    }
	input[type="date"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}
input[type="tel"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}
input[type="number"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}
    button.form-button {
        background-color: green;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    button.form-button:hover {
        background-color: #0056b3;
    }

    form:invalid {
        border-color: #ff0000;
    }

    #submission-message {
        color: #009900;
        font-weight: bold;
        margin-top: 10px;
    }
    </style>
    
    <script>
    let currentTab = 0;

    function showTab(tabIndex) {
        const formParts = document.querySelectorAll('.form-part');
        formParts[currentTab].style.display = 'none';
        formParts[tabIndex].style.display = 'block';
        
        // Remove the 'active-tab' class from all tab buttons
        const tabButtons = document.querySelectorAll('.tab');
        tabButtons.forEach(button => button.classList.remove('active-tab'));
        
        // Add the 'active-tab' class to the current tab button
        tabButtons[tabIndex].classList.add('active-tab');
        
        currentTab = tabIndex;
    }

    function nextTab(tabIndex) {
        const form = document.getElementById(`form-part-${tabIndex + 1}`);
        if (form.checkValidity()) {
            showTab(tabIndex + 1);
        } else {
            alert('Please fill in all required fields.');
        }
    }

    function prevTab(tabIndex) {
        showTab(tabIndex - 1);
    }
    </script>
</head>
<body>

   
    <center><h2 style="color: red;">Loan Application Form</h2></center>
    <div class="form-container">
        <div class="tabs">
            <button class="tab" onclick="showTab(0)">Personal Details</button>
            <button class="tab" onclick="showTab(1)">Loan Details</button>
            <button class="tab" onclick="showTab(2)">Nominee Details</button>
        </div>
        <div class="form-box">
         <form action="savenew" id="form-part-1">
            <div class="form-part">
    <b>FirstName : </b>
    <input type="text" id="cust_firstname" name="cust_firstname" placeholder="Enter FirstName"><br>
    <b>LastName : </b>
    <input type="text" id="cust_lastname" name="cust_lastname" placeholder="Enter Last name"><br>
    <b>DateOfBirth : </b><br>
    <input type="date" id="cust_dob" name="cust_dob" placeholder="Enter date of birth"><br>
    <b>Pancard No : </b>
    <input type="text" id="cust_panno" name="cust_panno" placeholder="Enter pancard number"><br>
    <b>Mobile Number : </b><br>
    <input type="tel" id="cust_mobile" name="cust_mobile" placeholder="Enter mobile number"><br>
    <b>Address : </b>
    <input type="text" id="cust_address" name="cust_address" placeholder="Enter address"><br>
    <b>Guardian Name : </b>
    <input type="text" id="cust_gname" name="cust_gname" placeholder="Enter guardian name"><br>
                    <button class="form-button" type="button" onclick="nextTab(0)">Next</button>
                
            </div>
 
  <div class="form-part" style="display: none;">               
               
               		 <h2>Loan Details</h2>
               
					<a href="loanEligibility.jsp">Check Loan Eligibility</a><br><br>             
               
                    <b >Loan Type : Personal</b><br><br>
              		<input type="hidden" name="lnap_amount" value="<%= request.getParameter("loanAmount")%>"> 
              		<input type="hidden" name="lnap_emi" value="<%= request.getParameter("emiAmount")%>"> 
              		<input type="hidden" name="lnap_nom_requested" value="<%=request.getParameter("months") %>"> 
                    <b>Loan Amount : </b><b id="lnap_amount" name="lnap_amount"><%= request.getParameter("loanAmount")%></b><br><br>
                    <b>EMI Amount : </b>
                    <b id="lnap_emi_range_from" name="lnap_emi_range_from" "><%= request.getParameter("emiAmount")%></b><br><br>
                    <b>Number of Months : </b>
                    <b id="lnap_nom_requested" name="lnap_nom_requested"><%=request.getParameter("months") %></b><br>
                    
                    <a href="emiSchedule.jsp?emiAmt=<%= request.getParameter("emiAmount") %>&months=<%= request.getParameter("months") %>">Check EMI Schedule</a><br><br> <br>
  					  <b>lnap apdate : </b>
  					  <input type="date" id="lnap_apdate" name="lnap_apdate" placeholder="Enter date"><br>
  					  <b>lnap loantype id : </b><br>
   						 <input type="text" id="lnap_lnty_id" value="1" name="lnap_lnty_id" placeholder="Enter id"><br>
  						 
                    
                    
                    
                    <b>cibil score : </b>
                    <input type="number" id="lnap_cibil_Score" name="lnap_cibil_Score" placeholder="Enter cibil score"><br>
                    <button type="button" onclick="nextTab(1)" style="background-color: green;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;">Next</button>
                    <button type="button" onclick="prevTab(1)" style="background-color: green;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;">Previous</button>
                
            </div>
            <div class="form-part" style="display: none;">
                <h2>Nominee Details</h2>
    
    <b>lnap nominee : </b>
    <input type="text" id="lnap_nominee" name="lnap_nominee" placeholder="Enter FirstName"><br>
    <b>lnap relation : </b>
    <input type="text" id="lanp_relation" name="lanp_relation" placeholder="Enter Last name"><br>
                    <button class="form-button" type="button" onclick="prevTab(2)">Previous</button>
                    <button class="form-button" type="button" onclick="openPopup()">Preview</button>
             
            </div>
            <div id="myPopup" class="popup">
        <div class="popup-content">
        <center>
        <h4 class="popup-title">PREVIEW</h4>
    
    <div>
        <h3>c_fname :</h3>
        <p id="c_fname"></p>
    </div>

    <div>
        <h3>c_lname :</h3>
        <p id="c_lname"></p>
    </div>

    <div>
        <h3>c_dob :</h3>
        <p id="c_dob"></p>
    </div>

    <div>
        <h3>c_pan :</h3>
        <p id="c_pan"></p>
    </div>

    <div>
        <h3>c_mobile :</h3>
        <p id="c_mobile"></p>
    </div>

    <div>
        <h3>c_address :</h3>
        <p id="c_address"></p>
    </div>

    <div>
        <h3>c_gname :</h3>
        <p id="c_gname"></p>
    </div>

    <div>
        <h3>l_ap_date:</h3>
        <p id="l_ap_date"></p>
    </div>

    <div>
        <h3>l_lty_id:</h3>
        <p id="l_lty_id"></p>
    </div>

    <div>
        <h3>l_amt:</h3>
        <p id="l_amt"></p>
    </div>

    <div>
        <h3>l_emi:</h3>
        <p id="l_range_from"></p>
    </div>

    <div>
        <h3>l_nom_req:</h3>
        <p id="l_nom_req"></p>
    </div>

    <div>
        <h3>cibil score:</h3>
        <p id="cibil_score"></p>
    </div>


    <div>
        <h3>lp_nominee:</h3>
        <p id="lp_nominee"></p>
    </div>

    <div>
        <h3>lp_relation:</h3>
        <p id="lp_relation"></p>
    </div><br></br>

            <input type="button" onclick="closePopup()" value="Edit">
            <input type="submit" value="Submit"></input>
            </center>
        </div>
    </div>
              </form>
        </div>
    </div>
     <!-- The popup itself -->
    

    <!-- JavaScript to handle the popup -->
    <script>
 // Get elements by their IDs
    
        function openPopup() {
     
        	var cust_firstname = document.getElementById("cust_firstname").value;
        	var cust_lastname = document.getElementById("cust_lastname").value;
        	var cust_dob = document.getElementById("cust_dob").value;
        	var cust_panno = document.getElementById("cust_panno").value;
        	var cust_mobile = document.getElementById("cust_mobile").value;
        	var cust_address = document.getElementById("cust_address").value;
        	var cust_gname = document.getElementById("cust_gname").value;

        	
        	
        	var lnap_apdate = document.getElementById("lnap_apdate").value;
        	var lnap_lnty_id = document.getElementById("lnap_lnty_id").value;
        	var lnap_amount = document.querySelector("#lnap_amount").textContent;
        	var lnap_emi_range_from = document.querySelector("#lnap_emi_range_from").textContent;
        	
        	var lnap_nom_requested = document.querySelector("#lnap_nom_requested").textContent;
        	var lnap_cibil_Score = document.getElementById("lnap_cibil_Score").value;

        	var lnap_nominee = document.getElementById("lnap_nominee").value;
        	var lanp_relation = document.getElementById("lanp_relation").value;

        	// Populate content of certain elements with JavaScript variables
        	console.log(cust_firstname,cust_lastname,cust_dob,cust_panno,cust_mobile,cust_address,cust_gname,lnap_apdate,lnap_lnty_id,lnap_amount,lnap_emi_range_from,lnap_nom_requested,lnap_cibil_Score,lnap_nominee,lanp_relation);
        	document.getElementById("c_fname").textContent = cust_firstname;
        	document.getElementById("c_lname").textContent = cust_lastname;
        	document.getElementById("c_dob").textContent = cust_dob;
        	document.getElementById("c_pan").textContent = cust_panno;
        	document.getElementById("c_mobile").textContent = cust_mobile;
        	document.getElementById("c_address").textContent = cust_address;
        	document.getElementById("c_gname").textContent = cust_gname;
    

        
        	
        	document.getElementById("l_ap_date").textContent = lnap_apdate;
        	document.getElementById("l_lty_id").textContent = lnap_lnty_id;
        	document.getElementById("l_amt").textContent = lnap_amount;
        	document.getElementById("l_range_from").textContent = lnap_emi_range_from;
        
        	document.getElementById("l_nom_req").textContent = lnap_nom_requested;
        	document.getElementById("cibil_score").textContent = lnap_cibil_Score;
    
        	
        	document.getElementById("lp_nominee").textContent = lnap_nominee;
        	document.getElementById("lp_relation").textContent = lanp_relation;

            
            
            document.getElementById("myPopup").style.display = "block";
        }

        function closePopup() {
            document.getElementById("myPopup").style.display = "none";
        }
    </script>
</body>
</html>
