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
                    <input type="text" name="fn" placeholder="Enter FirstName"><br>
                    <b>LastName : </b>
                    <input type="text" name="ln" placeholder="Enter Last name"><br>
                    <b>DateOfBirth : </b><br>
                    <input type="date" name="dob" placeholder="Enter date of birth"><br>
                    <b>Pancard No : </b>
                    <input type="text" name="pan" placeholder="Enter pancard number"><br>
                    <b>Mobile Number : </b><br>
                    <input type="tel" name="mbn" placeholder="Enter mobile number"><br>
                    <b>Address : </b>
                    <input type="text" name="addr" placeholder="Enter address"><br>
                    <b>Guardian Name : </b>
                    <input type="text" name="gn" placeholder="Enter guardian name"><br>
                    <button class="form-button" type="button" onclick="nextTab(0)">Next</button>
                </form>
            </div>
            <div class="form-part" style="display: none;">
                <h2>Loan Details</h2>
                <form id="form-part-2">
                    <b>Loan Type : </b>
                    <input type="text" name="ltype" placeholder="Enter Loan Type"><br>
                    <b>Loan Amount : </b>
                    <input type="number" name="lamt" placeholder="Enter Loan Amount"><br>
                    <b>Minimum EMI amount : </b>
                    <input type="number" name="lbemi" placeholder="Enter minimum EMI Amount"><br>
                    <b>Maximum EMI amount : </b>
                    <input type="number" name="lhemi" placeholder="Enter maximum EMI Amount"><br>
                    <b>Number Of Nominee : </b>
                    <input type="number" name="ln" placeholder="Enter nominee count"><br>
                    <button type="button" onclick="nextTab(1)">Next</button>
                    <button type="button" onclick="prevTab(1)">Previous</button>
                </form>
            </div>
            <div class="form-part" style="display: none;">
                <h2>Nominee Details</h2>
                <form id="form-part-3">
                    <input type="text" name="field5" placeholder="Field 5"><br>
                    <input type="text" name="field6" placeholder="Field 6"><br>
                    <button class="form-button" type="button" onclick="prevTab(2)">Previous</button>
                    <button class="form-button" type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
