<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMI Schedule</title>
<style>
/* Add CSS styles for borders */
.emi-schedule {
    border-collapse: collapse; /* Collapse borders to avoid spacing */
    width: 100%; /* Optional: Set the table width */
}

.emi-schedule th, .emi-schedule td {
    border: 1px solid #ddd; /* Add a 1px solid gray border to table cells */
    padding: 8px; /* Optional: Add padding to cells for spacing */
    text-align: left; /* Optional: Align text to the left */
}

.emi-schedule th {
    background-color: #f2f2f2; /* Optional: Add background color to header cells */
}
</style>
</head>
<body>
<center><h2>EMI Schedule</h2></center>
<div id="emi-schedule-container"></div>

<script>
function createEmiScheduleTable(startDate, numberOfMonths, emiAmount) {
    // Get the table container element
    const tableContainer = document.getElementById('emi-schedule-container');

    console.log("Method called with values as .."+startDate+" "+numberOfMonths+" "+emiAmount);

    // Create the table element
    const table = document.createElement('table');
    table.className = 'emi-schedule';

    // Create the table header
    const headerRow = table.insertRow();
    headerRow.innerHTML = '<th>Date</th><th>EMI Amount</th><th>Cumulative Amount</th>';

    // Initialize the cumulative amount
    let cumulativeAmount = 0;

    // Loop to generate rows for each month
    for (let i = 0; i < numberOfMonths; i++) {
        // Calculate the date for this month
        const currentMonth = new Date(startDate);
        currentMonth.setMonth(startDate.getMonth() + i);

        // Calculate the cumulative amount
        cumulativeAmount += emiAmount;

        // Create a row for this month
        const row = table.insertRow();
        const dateCell = row.insertCell(0);
        const emiCell = row.insertCell(1);
        const cumulativeCell = row.insertCell(2);

        dateCell.textContent = currentMonth.toLocaleDateString();
        emiCell.textContent = emiAmount.toFixed(2);
        cumulativeCell.textContent = cumulativeAmount.toFixed(2);
    }

    // Clear previous content and append the table to the container
    tableContainer.innerHTML = '';
    tableContainer.appendChild(table);
}

// Example usage:
const startDate = new Date(); // Current date
const numberOfMonths = 12;    // Number of months
createEmiScheduleTable(startDate, <%= request.getParameter("months")%>,<%= request.getParameter("emiAmt")%>);
</script>
</body>
</html>
