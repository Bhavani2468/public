<%@ page language="java" import="java.util.*,com.models.LoanApplication" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
        width: 7.14%; /* 100% divided by 14 columns for equal width */
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
    .edit-button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 2px;
        cursor: pointer;
        border-radius: 5px;
    }
     .save-button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        margin: 2px;
        cursor: pointer;
        border-radius: 5px;
    }
    .filter {
    margin-bottom: 10px;
}

/* Style the filter labels */
.filter label {
    display: inline-block;
    width: 150px;
    font-weight: bold;
}

/* Style the filter input fields */
.filter input[type="number"] {
    width: 150px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
}
    
</style>
</head>
<body>
<center>
<h1>Loan Details</h1>
    <!-- Add input field for amount filter -->
 <div class="filter">
    <label for="amountFilter">Search by Amount:</label>
    <input type="number" id="amountFilter" placeholder="Enter Amount">
</div>
<div class="filter">
    <label for="emiFilter">Search by EMI:</label>
    <input type="number" id="emiFilter" placeholder="Enter EMI">
</div>
<div class="filter">
    <label for="cibilFilter">Search by Cibil Score:</label>
    <input type="number" id="cibilFilter" placeholder="Enter Cibil Score">
</div>
    <table border="1px" id="myTable">
        <thead>
            <tr>
                <th>lnap_id</th>
                <th>lnap_cust_id</th>
                <th>lnap_apdate</th>
                <th>lnty_id</th>
                <th>l_amt</th>
                <th>Emi</th>
                <th>nom req</th>
                <th>cibil score</th>
                <th>status</th>
                <th>conclu rem</th>
                <th>proce user</th>
                <th>p date</th>
                
            </tr>
        </thead>
        <tbody>
        <% ArrayList<LoanApplication> al=(ArrayList<LoanApplication>)request.getAttribute("ld");
            for (LoanApplication l : al) {
            	if(l.getLnap_status()!=null){
            	if(l.getLnap_status().equals("RJCD")){
        %>
            <tr>
                <td><%= l.getLnap_id() %></td>
                <td><%= l.getLnap_cust_id() %></td>
                <td><%= l.getLnap_apdate() %></td>
                <td><%= l.getLnap_lnty_id() %></td>
                <td><%= l.getLnap_amount() %></td>
                <td><%= l.getLnap_emi() %></td>
                <td><%= l.getLnap_nom_requested() %></td>
                <td><%= l.getLnap_cibil_Score() %></td>
                <td>RJCD</td>
                <td><%= l.getLnap_conclusion_remarks() %></td>
                <td><%= l.getLnap_processed_user() %></td>
                <td><%= l.getLnap_processed_Date() %></td>
                
            </tr>
        <% }} }%>
        </tbody>
    </table>
</center>
<script>
 var lAmtInput;
 var nomReqInput; 

 $(document).ready(function () {
	    // Add event listener to the amount filter input field
	    $("#amountFilter").on("input", function () {
	        var amount = parseFloat($(this).val());
	        if (!isNaN(amount)) {
	            filterByAmount(amount);
	        }
	    });
	});

	function filterByAmount(amount) {
	    $("#myTable tbody tr").each(function () {
	        var cellValue = $(this).find("td").eq(4).text(); // Amount column index is 4
	        var numericValue = parseFloat(cellValue.replace(/[^0-9.-]+/g, '')); // Remove non-numeric characters
	        if (!isNaN(numericValue)) {
	            if (numericValue >= amount) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        }
	    });
	}
	$(document).ready(function () {
	    // Add event listeners to the filter input fields
	    $("#emiFilter, #cibilFilter").on("input", function () {
	        filterTable();
	    });
	});

	function filterTable() {
	    var emiFilter = parseFloat($("#emiFilter").val()) || 0;
	    var cibilFilter = parseFloat($("#cibilFilter").val()) || 0;

	    $("#myTable tbody tr").each(function () {
	        var emiCellValue = parseFloat($(this).find("td").eq(5).text().replace(/[^0-9.-]+/g, '')); // EMI column index is 5
	        var cibilCellValue = parseFloat($(this).find("td").eq(7).text().replace(/[^0-9.-]+/g, '')); // Cibil Score column index is 7

	        if ((!emiFilter || emiCellValue >= emiFilter) && (!cibilFilter || cibilCellValue >= cibilFilter)) {
	            $(this).show();
	        } else {
	            $(this).hide();
	        }
	    });
	}

function toggleEditSave(row) {
    var tableRow = row.parentNode.parentNode;
    var lAmtCell = tableRow.cells[6]; // Amount column
    var status = tableRow.cells[8]; 
    var remarks = tableRow.cells[9]; 
    var cs = tableRow.cells[7];
    var cur_date = tableRow.cells[11];

    if (row.textContent === "Edit") {
        // Switch to edit mode
        lAmtInput = document.createElement("input");
        lAmtInput.value = lAmtCell.innerText;
        lAmtCell.innerHTML = '';
        lAmtCell.appendChild(lAmtInput);

        if (parseInt(cs.innerText) > 700) {
            status.innerText = "APRV";
            remarks.innerText = "Perfect";
        } else {
            status.innerText = "RJCD";
            remarks.innerText = "Bad Cibil Score";
        }

        var currentDate = new Date();
        var year = currentDate.getFullYear();
        var month = currentDate.getMonth() + 1;
        var day = currentDate.getDate();

        cur_date.innerText = year + "-" + month + "-" + day;

        row.textContent = "Save";
    } else if (row.textContent === "Save") {
        row.textContent = "Edit";
        // Save changes and switch back to edit mode
        lAmtCell.innerText = lAmtCell.querySelector("input").value;

        var statusInput = tableRow.querySelector(".status-input");
        var remarksInput = tableRow.querySelector(".remarks-input");
        var lAmtCellInput = tableRow.querySelector(".lAmtCell-input");
        var dd = tableRow.querySelector(".date-input");

        statusInput.value = status.innerText;
        remarksInput.value = remarks.innerText;
        lAmtCellInput.value = lAmtCell.innerText;
        dd.value = cur_date.innerText;

        lAmtCell.removeChild(lAmtCell.querySelector("input"));
    }
}
</script>
</body>
</html>
