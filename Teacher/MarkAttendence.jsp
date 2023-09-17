<%@page import="com.Attandance.Functionality.Enrollments"%>
    <%@page import="java.util.ArrayList"%>
        <%@page import="com.Attandance.Functionality.CourseDataFetch"%>
            <%@page import="com.Attandance.Functionality.AttendanceManagement"%>
                <%@page import="java.util.List" %>
                    <%@page import="com.Attandance.model.Attendance" %>

                        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                            <!DOCTYPE html>
                            <html lang="en">

                            <head>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <style>
                                    body {
                                        background: linear-gradient(to right, #81e6dc, white, #800080);
                                        font-family: Arial, sans-serif;
                                    }
                                    
                                    .select-container,
                                    .date {
                                        display: flex;
                                        justify-content: center;
                                        margin: 20px;
                                        height: 40px;
                                        align-items: center;
                                        padding: 10px;
                                    }
                                    
                                    select,
                                    h2 {
                                        padding: 10px;
                                        font-size: 16px;
                                        margin: 5px;
                                    }
                                    /* Style for the table */
                                    
                                    .tablesdata {
                                        box-sizing: border-box;
                                        border-radius: 0px;
                                        box-shadow: 0 8px 16px rgba(13, 12, 12, 0.1);
                                        justify-content: center;
                                        max-height: 40vh;
                                        overflow-y: auto;
                                    }
                                    /* Style for the scrollbar */
                                    
                                    .tablesdata::-webkit-scrollbar {
                                        width: 1px;
                                        /* Adjust the width of the scrollbar */
                                    }
                                    /* Style for the scrollbar track */
                                    
                                    .tablesdata::-webkit-scrollbar-track {
                                        background: #f1f1f1;
                                        /* Color of the scrollbar track */
                                    }
                                    /* Style for the scrollbar thumb */
                                    
                                    .tablesdata::-webkit-scrollbar-thumb {
                                        background: #888;
                                        /* Color of the scrollbar thumb */
                                    }
                                    /* Style for the scrollbar thumb on hover */
                                    
                                    .tablesdata::-webkit-scrollbar-thumb:hover {
                                        background: #555;
                                        /* Color of the scrollbar thumb on hover */
                                    }
                                    
                                    table {
                                        border-collapse: collapse;
                                        width: 100%;
                                        max-width: 800px;
                                        margin: 20px auto;
                                    }
                                    
                                    th,
                                    td {
                                        border: 1px solid black;
                                        text-align: left;
                                        padding: 8px;
                                    }
                                    
                                    .button {
                                        padding: 10px;
                                        background-color: #007bff;
                                        color: white;
                                        border: none;
                                        cursor: pointer;
                                        margin-right: 5px;
                                        border-radius: 15%;
                                    }
                                    
                                    .submitbutton {
                                        padding: 10px;
                                        background-color: #007bff;
                                        color: white;
                                        border: none;
                                        cursor: pointer;
                                        margin-left: 85%;
                                        margin-top: 20px;
                                        margin-right: 15px;
                                        border-radius: 15%;
                                        text-align: center;
                                    }
                                    
                                    .mark {
                                        text-align: center;
                                        justify-content: center;
                                        font-size: 20px;
                                        font-family: Arial, sans-serif;
                                    }
                                </style>
                            </head>

                            <body>
                                <div class="mark">
                                    <h3>Mark Attendance</h3>
                                </div>
                                <form action="search" method="post">
                                    <div class="select-container">

                                        <label for="batchDropdown"><h2>Select Batch</h2></label>
                                        <select id="batchDropdown" name="batch">
        <option value ="null">Select Batch</option>
        <%
        Enrollments e = new Enrollments();
        String facultyid = (String) session.getAttribute("aid");
        String selectedBatch = request.getParameter("batch"); // Fetching the submitted batch value
        List<String> b = e.allBranches(Long.parseLong(facultyid));
        		
        		for(String s : b){
        					
        %> 
         <option value="<%=s%>" <%= (selectedBatch != null && selectedBatch.equals(s)) ? "selected" : "" %> ><%=s%></option>
        <%
        }
        %>
    </select>

                                        <input type="hidden" name="facultyid" value="<%=facultyid%>">
                                        <div class="submit">
                                            <button class="button">submit</button>
                                        </div>

                                    </div>
                                </form>
                                <div class="date">
                                    <h2>Select Date</h2>
                                    <input type="date" name="date" id="date">
                                </div>


                                <div class="tablesdata">
                                    <table id="studentTable">
                                        <thead>
                                            <tr>
                                                <th>S.N</th>
                                                <th>Student Roll</th>
                                                <th>Mark Attendance</th>
                                                <th>Present Days</th>
                                                <th>Absent Days</th>
                                                <th>Total Days</th>
                                                <th>Percentage</th>
                                            </tr>
                                        </thead>


                                        <tbody>
                                            <%
        List<Attendance> l = (ArrayList<Attendance>) request.getAttribute("studentlist");
       
        
        if(l==null || l.isEmpty()){
        	AttendanceManagement a = new AttendanceManagement();
        	l = a.BatchFacultystudents(selectedBatch,Long.parseLong(facultyid));
        }
        
        
        // store the value to pass in the attendance table
        List<Attendance> mark = new ArrayList<Attendance>();
        
        
        		for(Attendance am : l){
        			long presentDays = am.getPresentDays();
        			long totalDays = am.getTotalDays();
        			long absent = totalDays - presentDays;
        			long percent=0;
        			
        			if (totalDays != 0) {
        			    percent = (presentDays * 100) / totalDays;
        			}
        			
        			// create a attendance object
        			Attendance m = new Attendance();
        			m.setStudentid(am.getStudentid());
        			m.setFacultyid(am.getFacultyid());
        			
        			
        %>
                                                <tr>
                                                    <td>
                                                        <%=am.getId() %>
                                                    </td>
                                                    <td>
                                                        <%=am.getStudentid() %>
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" class="student-checkbox" checked></td>
                                                    <input type="hidden" name="facultyid" value="<%=facultyid%>">
                                                    <td>
                                                        <%=presentDays%>
                                                    </td>
                                                    <td>
                                                        <%=absent%>
                                                    </td>
                                                    <td>
                                                        <%=totalDays%>
                                                    </td>
                                                    <td>
                                                        <%=percent %>%</td>
                                                </tr>
                                                <%
        		}
          %>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="subutton">
                                    <button type="submit" onclick="sendSelectedIds()" class="submitbutton">Mark Attendance</button>
                                </div>
                                <script>
                                    function sendSelectedIds() {
                                        var checkboxes = document.querySelectorAll('.student-checkbox');
                                        var selectedIds = [];
                                        var mark = [];

                                        // Fetch facultyId from server-side JSP
                                        var facultyId = "<%=facultyid%>";

                                        // Fetch batch from dropdown
                                        var batchDropdown = document.getElementById('batchDropdown');
                                        var selectedBatch = batchDropdown.options[batchDropdown.selectedIndex].value;

                                        checkboxes.forEach(function(checkbox, index) {
                                            if (checkbox.checked) {
                                                var studentId = checkbox.closest('tr').children[1].textContent;
                                                selectedIds.push(studentId);
                                                mark.push(1);
                                            } else {
                                                var studentId = checkbox.closest('tr').children[1].textContent;
                                                selectedIds.push(studentId);
                                                mark.push(0);
                                            }
                                        });

                                        var xhr = new XMLHttpRequest();
                                        xhr.open('POST', 'markpresent', true);
                                        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
                                        xhr.onreadystatechange = function() {
                                            if (xhr.readyState === 4 && xhr.status === 200) {
                                                alert(xhr.responseText);
                                            }
                                        };

                                        // Send facultyId, selectedBatch, and studentIds in the JSON payload
                                        xhr.send(JSON.stringify({
                                            facultyid: facultyId,
                                            batch: selectedBatch,
                                            studentIds: selectedIds,
                                            markvalue: mark
                                        }));
                                    }
                                </script>


                            </body>

                            </html>