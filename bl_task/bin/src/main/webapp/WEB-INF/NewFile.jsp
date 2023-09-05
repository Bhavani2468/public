<%@ page language="java" import="java.util.*, task.model.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monthly Calendar</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Define your CSS styles for the calendar here */
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div id="calendar">
        <div class="header">
            <button id="prev">Previous</button><h2 id="month-year"></h2><button id="next">Next</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
            </thead>
            <tbody id="calendar-body"></tbody>
        </table>
    </div>
    <script>
    <% ArrayList<DoctorSlot> al=null;
	if(request.getAttribute("slots")!=null)
	{
		al = (ArrayList<DoctorSlot>)request.getAttribute("slots");
	}
	System.out.println(al);
	
	%>
        document.addEventListener("DOMContentLoaded", function () {
            const calendarBody = document.getElementById("calendar-body");
            const monthYear = document.getElementById("month-year");
            const prevBtn = document.getElementById("prev");
            const nextBtn = document.getElementById("next");

            const currentDate = new Date();
            let currentMonth = currentDate.getMonth();
            let currentYear = currentDate.getFullYear();

            function renderCalendar(month, year) {
                calendarBody.innerHTML = "";
                monthYear.textContent = new Date(year, month).toLocaleString('default', { month: 'long' }) + " " + year;

                const firstDay = new Date(year, month, 1);
                const lastDay = new Date(year, month + 1, 0);
                const daysInMonth = lastDay.getDate();

                let dayCounter = 1;

                for (let i = 0; i < 6; i++) {
                    const row = document.createElement("tr");

                    for (let j = 0; j < 7; j++) {
                        const cell = document.createElement("td");
                        if (i === 0 && j < firstDay.getDay()) {
                            // Blank cells before the 1st day
                            cell.textContent = "";
                        } else if (dayCounter <= daysInMonth) {
                        	var but=document.createElement("button");
                            but.textContent =dayCounter;
                            dayCounter++;
                            cell.appendChild(but);
                        } else {
                            // Blank cells after the last day
                            cell.textContent = "";
                        }

                        row.appendChild(cell);
                    }

                    calendarBody.appendChild(row);
                }
            }

            renderCalendar(currentMonth, currentYear);

            prevBtn.addEventListener("click", () => {
                currentMonth--;
                if (currentMonth < 0) {
                    currentMonth = 11;
                    currentYear--;
                }
                renderCalendar(currentMonth, currentYear);
            });

            nextBtn.addEventListener("click", () => {
                currentMonth++;
                if (currentMonth > 11) {
                    currentMonth = 0;
                    currentYear++;
                }
                renderCalendar(currentMonth, currentYear);
            });
        });
    </script>
</body>
</html>
