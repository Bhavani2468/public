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
            background-color: rgba(0,0,0,0.7);
            z-index: 1;
        }
        
        /* CSS for the popup content */
        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.5);
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
    
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelector('[name="lnap_nom_requested"]').addEventListener('change', function () {
            generateNomineeFields();
        });
    });

    function generateNomineeFields() {
        const numNominees = parseInt(document.querySelector('[name="lnap_nom_requested"]').value, 10);
        const nomineeFieldsContainer = document.getElementById('nominee-fields');
        nomineeFieldsContainer.innerHTML = ''; 

        for (let i = 0; i < numNominees; i++) {
            const nomineeFieldset = document.createElement('fieldset');
            const nomineeNumber = i + 1;
            nomineeFieldset.innerHTML = '<legend>Nominee ' + nomineeNumber + '</legend>' +
            '<input type="text" name="nominee_name_' + nomineeNumber + '" placeholder="Enter Nominee Name"><br>' +
            '<input type="text" name="nominee_relation_' + nomineeNumber + '" placeholder="Enter Nominee Relation"><br>';

            nomineeFieldsContainer.appendChild(nomineeFieldset);
        }
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
            <div class="form-part">
                <form id="form-part-1">
                	
                    <b>FirstName : </b>
                    <input type="text" name="cust_firstname" placeholder="Enter FirstName"><br>
                    <b>LastName : </b>
                    <input type="text" name="cust_lastname" placeholder="Enter Last name"><br>
                    <b>DateOfBirth : </b><br>
                    <input type="date" name="cust_dob" placeholder="Enter date of birth"><br>
                    <b>Pancard No : </b>
                    <input type="text" name="cust_panno" placeholder="Enter pancard number"><br>
                    <b>Mobile Number : </b><br>
                    <input type="tel" name="cust_mobile" placeholder="Enter mobile number"><br>
                    <b>Address : </b>
                    <input type="text" name="cust_address" placeholder="Enter address"><br>
                    <b>Guardian Name : </b>
                    <input type="text" name="cust_gname" placeholder="Enter guardian name"><br>
                   
                    <button class="form-button" type="button" onclick="nextTab(0)">Next</button>
                
            </div>
            <div class="form-part" style="display: none;">               
               
					<a href="loanEligibility.jsp">Check Loan Eligibility</a><br><br>             
               
                    <b >Loan Type : Personal</b><br><br>
              
                    <b>Loan Amount : </b><b name="lnap_amount"><%= request.getParameter("loanAmount")%></b><br><br>
                    <b>EMI Amount : </b>
                    <b name="lnap_emi_range_from" "><%= request.getParameter("emiAmount")%></b><br><br>
                    
                    <a href="emiSchedule.jsp?emiAmt=<%= request.getParameter("emiAmount") %>&months=<%= request.getParameter("months") %>">Check EMI Schedule</a><br><br> <br>
                    
                    <b>Number of Nominee : </b>
                    <input type="number" name="lnap_nom_requested" placeholder="Enter number of nominee"><br>
                    <b>cibil score : </b>
                    <input type="number" name="lnap_cibil_Score" placeholder="Enter cibil score"><br>
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
               
                    <div id="nominee-fields"></div>
                    <button class="form-button" type="button" onclick="prevTab(2)">Previous</button>
                    <button class="form-button" type="button" onclick="">Preview</button>
               </form>
            </div>
        </div>
    </div>
     <!-- The popup itself -->
    <div id="myPopup" class="popup">
        <div class="popup-content">
            
            <button onclick="closePopup()">Edit</button>
        </div>
    </div>

    <!-- JavaScript to handle the popup -->
    <script>
        function openPopup() {
            document.getElementById("myPopup").style.display = "block";
        }

        function closePopup() {
            document.getElementById("myPopup").style.display = "none";
        }
    </script>
</body>
</html>