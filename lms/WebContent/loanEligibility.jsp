<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        #disposableAmount {
            font-weight: bold;
        }
        
        #loanAmountNote {
            color: #FF0000;
        }

        #emiRange {
            font-weight: bold;
            font-size: 18px;
        }
    </style>
    <title>Loan Eligibility Form</title>
    <script>
        // Function to populate the "Number of Years" or "Number of Months" dropdown dynamically
        function populateNumberOfYearsOrMonthsDropdown(yearsOrMonths, isYears) {
            var numberOfYearsDropdown = document.getElementById("numberOfYears");

            // Clear existing options
            numberOfYearsDropdown.innerHTML = '';

            // Add options dynamically
            for (var i = 1; i <= yearsOrMonths; i++) {
                var option = document.createElement("option");
                option.value = i;
                option.text = isYears ? i + " Year" : i + " Month";
                numberOfYearsDropdown.appendChild(option);
            }
        }
        function calculateDisposableAmount() {
            var annualIncomeInput = document.getElementById("annualIncome");
            var disposableAmountDiv = document.getElementById("disposableAmount");

            var annualIncome = parseFloat(annualIncomeInput.value);

            var disposableAmount = annualIncome * 0.3;
            var loanLimit = annualIncome * 240;

            disposableAmountDiv.textContent = disposableAmount.toFixed(2);
            
            // Set the max attribute for the loanAmount input field
            document.getElementById("loanAmount").max = loanLimit;

            document.getElementById("loanAmountNote").textContent = "Note: Loan amount should not exceed Rs." + loanLimit;
        }

        function validateLoanAmount() {
            var loanAmountInput = document.getElementById("loanAmount");
            var loanLimit = parseFloat(loanAmountInput.max);
            var loanAmount = parseFloat(loanAmountInput.value);
            
            if (loanAmount > loanLimit) {
                alert("Loan amount exceeds the maximum limit of Rs." + loanLimit);
                loanAmountInput.value = ""; 
                populateNumberOfYearsOrMonthsDropdown(10, true); // Default to years
            }
        }

        
        function setYears() {
            var loanAmtInput = document.getElementById("loanAmount");
            var loanAmt = parseFloat(loanAmtInput.value);
            
            var annualIncomeInput = document.getElementById("annualIncome");
            var annualIncome = parseFloat(annualIncomeInput.value);
            
            var disposableAmount = annualIncome * 0.3;
            var years = parseInt(loanAmt / (disposableAmount * 12));
            var months = parseInt(loanAmt / disposableAmount);
            
            console.log("years and months..."+years+" "+months);
            
            if(years>0 && months%12!=0)
            	years=years+1;
            
            console.log("modified years and months..."+years+" "+months);
            if (years > 0) {
                populateNumberOfYearsOrMonthsDropdown(years, true);
                console.log("entered here years");// Generate years dropdown
            } else {
                populateNumberOfYearsOrMonthsDropdown(months, false);
                console.log("entered here months");// Generate months dropdown
            }
        }

        function calculateEMI() {
            var loanAmtInput = document.getElementById("loanAmount");
            var loanAmt = parseFloat(loanAmtInput.value);
            
            var numberOfYearsInput = document.getElementById("numberOfYears");
            var numberOfYears = parseFloat(numberOfYearsInput.value);
            
            var annualIncomeInput = document.getElementById("annualIncome");
            var annualIncome = parseFloat(annualIncomeInput.value);
            
            var disposableAmount = annualIncome * 0.3;
            var years = parseInt(loanAmt / (disposableAmount * 12));
            
            var emiRangeDiv = document.getElementById("emiRange");
                        
            if (years > 0 ) {
                var months = numberOfYears * 12; 
                document.getElementById("months").value=months;
                var emiAmount = (loanAmt*0.13*(1+0.13)**(months))/((1.13)**(months-1));
                document.getElementById("emiAmt").value=emiAmount;
                emiRangeDiv.textContent = "Rs. " + emiAmount + " per month for " + numberOfYears + " years";
            } else {
                var emiAmount = (loanAmt / numberOfYears).toFixed(2);
                document.getElementById("months").value=numberOfYears;
                document.getElementById("emiAmt").value=emiAmount;
                emiRangeDiv.textContent = "Rs. " + emiAmount + " per month for " + numberOfYears + " months";
            }
        }
        

        window.onload = function() {
            var maxYears = 10; 
            populateNumberOfYearsOrMonthsDropdown(maxYears, true); // Default to years
        }
    </script>
</head>
<body>
<center>
    <h1>Loan Eligibility Form</h1>
    <form action="personaldetails.jsp" method="get" >
        <table>
            <tr>
                <td><label for="annualIncome">Annual Income:</label></td>
                <td><input type="text" id="annualIncome" name="annualIncome" required onchange="calculateDisposableAmount()"></td>
            </tr>
            <tr>
                <td>Disposable Amount:</td>
                <td><div id="disposableAmount" name="disposableAmount" ></div></td>
            </tr>
            <tr>
                <td colspan="2"><div id="loanAmountNote" name="loanAmountNote" ></div></td>
            </tr>
            <tr>
                <td><label for="loanAmount">Loan Amount:</label></td>
                <td><input type="number" id="loanAmount" name="loanAmount" onblur="validateLoanAmount()" onchange="setYears()" required></td>
            </tr>
            <tr>
                <td><label for="numberOfYears">Number of Years/Months:</label></td>
                <td>
                    <select id="numberOfYears" name="numberOfYears" onchange="calculateEMI()" required>
                        <!-- Options will be populated dynamically via JavaScript -->
                    </select>
                </td>
            </tr>
            <tr>
            	<td>EMI Range : </td>
                <td colspan="2"><div id="emiRange" name="emiRange"></div></td>
            </tr>
        </table>
        <input type="hidden" id="emiAmt" name="emiAmount" >
         <input type="hidden" id="months" name="months" >
        <input type="submit" value="Submit">
    </form>
</center>
</body>
</html>