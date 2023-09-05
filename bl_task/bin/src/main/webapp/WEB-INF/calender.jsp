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
    var slotString=[];
    var i=0;
    var endYear;
    var endMonth;
    <% ArrayList<DoctorSlot> al=null;
	if(request.getAttribute("slots")!=null)
	{
		al = (ArrayList<DoctorSlot>)request.getAttribute("slots");
		
		
		for(DoctorSlot d:al)
		{
	%>
			slotString[i]="<%=d.getSlotDate()%>";
			i++;
	<%	}
		
	}
	
	
	%>
	var m='<%=al.get(al.size()-1).getSlotDate()%>';
	var z=new Date(m);
	endMonth=z.getMonth();
	endYear=z.getFullYear();
	console.log("endMonth "+endMonth);
	console.log(slotString);
        document.addEventListener("DOMContentLoaded", function () {
            const calendarBody = document.getElementById("calendar-body");
            const monthYear = document.getElementById("month-year");
            const prevBtn = document.getElementById("prev");
            const nextBtn = document.getElementById("next");

            const currentDate = new Date();
            console.log("date "+currentDate);
            let currentMonth = currentDate.getMonth();
            let currentYear = currentDate.getFullYear();
            
            console.log(" current month is "+currentMonth);

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
                        	var k=month+1;
                        	var formattedMonth = (k < 10 ? '0' : '') + k;
                        	var formattedDay = (dayCounter < 10 ? '0' : '') + dayCounter;

                        	var d = year + '-' + formattedMonth + '-' + formattedDay;
                        	console.log(d);
                        	
                        	for(let i=0;i<slotString.length;i++)
                       		{
                       			if(d===slotString[i])
                   				{
                   					but.style.backgroundColor="green";
                   					but.onclick = function() {
                   						
                   						window.location.href="slots?slotdate="+slotString[i];};
                   					
                   				}
                       			else if(but.style.backgroundColor!="green")
                       				{
                       					but.style.backgroundColor="gray";
                       				}
                       		}
                        	
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

            function updateButtons() {
                const today = new Date();
                const isCurrentMonth = currentYear === today.getFullYear() && currentMonth === today.getMonth();
                prevBtn.disabled = isCurrentMonth;
                console.log("end month..year"+endMonth+" "+endYear);
                const isEndMonth = currentYear === endYear && currentMonth === endMonth;
                nextBtn.disabled = isEndMonth;
            }
            renderCalendar(currentMonth, currentYear);
			updateButtons();
            
            prevBtn.addEventListener("click", () => {
                currentMonth--;
                if (currentMonth < 0) {
                    currentMonth = 11;
                    currentYear--;
                }
                renderCalendar(currentMonth, currentYear);
                updateButtons();
            });

            nextBtn.addEventListener("click", () => {
                currentMonth++;
                if (currentMonth > 11) {
                    currentMonth = 0;
                    currentYear++;
                }
                renderCalendar(currentMonth, currentYear);
                updateButtons();
            });
        });
    </script>
</body>
</html>
