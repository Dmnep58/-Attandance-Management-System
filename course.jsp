<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="ErrorPage.jsp" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <style>
                body {
                    background: linear-gradient(to right, #81e6dc, white, #800080);
                    font-family: Arial, sans-serif;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 2px;
                }
                
                .sections-container {
                    display: flex;
                    width: 100%;
                    justify-content: space-between;
                    margin-top: 20px;
                }
                
                .section {
                    width: 100%;
                    border: 1px solid #ccc;
                    padding: 5px;
                    flex: 1;
                }
                
                .section.left {
                    flex: 0.3;
                }
                
                .section.right {
                    flex: 0.7;
                }
                
                .data {
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    justify-content: space-between;
                }
                
                .btn {
                    display: flex;
                    justify-content: flex-end;
                    align-items: flex-end;
                }
                
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.4);
                }
                /* Styles for the form  content for course addition */
                
                .modal-content {
                    background-color: #fefefe;
                    margin: 10% auto;
                    padding: 20px;
                    border: 1px solid #888;
                    width: 50%;
                }
                
                #closeModal:hover,
                #closeFacultyPopup:hover {
                    cursor: pointer;
                    color: red;
                }
                
                .input-group {
                    margin: 12px;
                }
                
                label {
                    display: block;
                    margin-bottom: 5px;
                }
                
                input[type="text"],
                input[type="Date"],
                input[type="number"] {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                }
                
                input[type="Date"] {
                    cursor: pointer;
                }
                /* Style for the buttons */
                
                .buttons {
                    text-align: right;
                }
                
                button[type="submit"] {
                    background-color: #4CAF50;
                    color: white;
                    padding: 10px 20px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }
                
                button[type="submit"]:hover {
                    background-color: #45a049;
                }
                /*add up portion   */
                
                .buttons {
                    display: flex;
                    gap: 10px;
                }
                
                .buttons button,
                .btn button {
                    padding: 10px 20px;
                    background-color: #3498db;
                    color: white;
                    border: none;
                    cursor: pointer;
                    margin: 5px;
                }
                
                .buttons .clear {
                    background-color: red;
                    height: 50%;
                    margin-left: 15px;
                    margin-top: 15px;
                }
                
                .summary {
                    background-color: transparent;
                    padding: 20px;
                    text-align: center;
                    text-decoration: underline;
                    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif
                }
                
                .container {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }
                
                .box {
                    flex: 1;
                    text-align: center;
                    padding: 10px 20px;
                    border-radius: 8px;
                    box-shadow: 0 8px 16px rgba(13, 12, 12, 0.1);
                }
                
                .box:first-child {
                    margin-right: 10px;
                }
                
                .box:last-child {
                    margin-left: 10px;
                }
            </style>
            <title>Admin</title>
        </head>

        <body>

            <div class="section">
                <div class="data">
                    <div class="heading">
                        <h2>ALL Courses Section</h2>
                    </div>
                    <div class="btn">
                        <button id="openModal">+ Add Course</button>

                        <!-- The Modal -->
                        <div id="courseModal" class="modal">
                            <div class="modal-content">
                                <span id="closeModal" style="float: right;">&times;</span>
                                <h2>Add a Course</h2>
                                <form id="courseForm">
                                    <div class="input-group">
                                        <label for="courseId">Course ID:</label>
                                        <input type="text" id="courseId" name="courseId" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="courseName">Course Name:</label>
                                        <input type="text" id="courseName" name="courseName" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="startDate">Start Date:</label>
                                        <input type="Date" id="startDate" name="startDate" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="EndDate">Course Name:</label>
                                        <input type="Date" id="endDate" name="endDate" required>
                                    </div>
                                    <input type="hidden" id="add" value="add">
                                    <div class="buttons">
                                        <button type="submit">Add Course</button>
                                    </div>
                                    <div id="message" style="color: green; font-weight: bold;"></div>
                                </form>
                                <script>
                                    // Get the modal element and buttons
                                    var modal = document.getElementById("courseModal");
                                    var openModalBtn = document.getElementById("openModal");
                                    var closeModalBtn = document.getElementById("closeModal");

                                    // Open the modal when the button is clicked
                                    openModalBtn.onclick = function() {
                                        modal.style.display = "block";
                                    }

                                    // Close the modal when the close button is clicked
                                    closeModalBtn.onclick = function() {
                                        modal.style.display = "none";
                                    }

                                    // Close the modal if the user clicks outside of it
                                    window.onclick = function(event) {
                                        if (event.target === modal) {
                                            modal.style.display = "none";
                                        }
                                    }



                                    // Handle form submission
                                    var courseForm = document.getElementById("courseForm");
                                    courseForm.onsubmit = function(event) {
                                        event.preventDefault();
                                        var formData = {
                                            courseId: $("#courseId").val(),
                                            courseName: $("#courseName").val(),
                                            startDate: $("#startDate").val(),
                                            endDate: $("#endDate").val(),
                                        };

                                        // Send an AJAX POST request to the Java Servlet
                                        $.ajax({
                                            type: "POST",
                                            url: "addcourses",
                                            data: formData,
                                            success: function(response) {
                                                if (response.status === "success") {
                                                    showMessage("course added successfully.", "green", 4000);
                                                } else {
                                                    showMessage("course addition failed. Please check your inputs.", "red", 3000);
                                                }
                                            },
                                            error: function(xhr, status, error) {

                                                console.error(error);
                                            }
                                        });
                                    }

                                    function showMessage(message, color, duration) {
                                        $("#message").css("color", color).html(message);

                                        setTimeout(function() {
                                            $("#message").fadeOut(function() {
                                                location.reload();
                                            });
                                        }, duration);
                                    }
                                </script>
                            </div>
                        </div>
                        <a href="CourseDetails.jsp"><button>Edit Course</button></a>
                    </div>
                </div>
            </div>


            <div class="sections-container">

                <div class="section left">

                    <div class="courses">
                        <h2 class="heading2">Course Handout</h2>
                        <ul class="courses">
                            <li>C/C++</li>
                            <li>Java</li>
                            <li>Data Structure</li>
                            <li>Python</li>
                            <li>DBMS</li>
                            <li>Computer Network</li>
                            <li>Operating System</li>
                        </ul>
                    </div>
                    <hr>
                    <div class="assign-faculty">
                        <h2 class="heading3">ASSIGN FACULTY</h2>
                        <div class="buttons">
                            <button id="openFacultyPopup">+ Assign a Faculty to courses</button>
                        </div>
                    </div>

                    <!-- The Faculty Assignment Pop-up -->
                    <div id="facultyPopup" class="modal">
                        <div class="modal-content">
                            <span id="closeFacultyPopup" style="float: right;">&times;</span>
                            <h2>Assign a Faculty</h2>
                            <form id="facultyForm">
                                <div class="input-group">
                                    <label for="facultyId">Faculty Id:</label>
                                    <input type="number" class="Id" id="Id" name="Id" required>
                                </div>
                                <div class="input-group">
                                    <label for="courseid">Course Id:</label>
                                    <input type="number" class="courseid" id="courseid" name="courseid" required>
                                </div>
                                <div class="input-group">
                                    <label for="Batch">Batch:</label>
                                    <input type="text" id="Batch" class="Batch" name="Batch" required>
                                </div>
                                <input type="hidden" id="assignFaculty" class="action" name="action" value="assignfaculty">
                                <div class="buttons">
                                    <button type="submit">Assign Faculty</button>
                                </div>
                            </form>
                            <div id="facultyMessage" style="color: green; font-weight: bold;"></div>

                        </div>
                    </div>

                    <script>
                        var facultyPopup = document.getElementById("facultyPopup");
                        var openFacultyPopupBtn = document.getElementById("openFacultyPopup");
                        var closeFacultyPopupBtn = document.getElementById("closeFacultyPopup");

                        // Open the faculty assignment pop-up when the button is clicked
                        openFacultyPopupBtn.onclick = function() {
                            facultyPopup.style.display = "block";
                        }

                        // Close the faculty assignment pop-up when the close button is clicked
                        closeFacultyPopupBtn.onclick = function() {
                            facultyPopup.style.display = "none";
                        }

                        // Close the faculty assignment pop-up if the user clicks outside of it
                        window.onclick = function(event) {
                            if (event.target === facultyPopup) {
                                facultyPopup.style.display = "none";
                            }
                        }

                        // Handle form submission
                        var facultyForm = document.getElementById("facultyForm");
                        facultyForm.onsubmit = function(event) {
                            event.preventDefault();
                            var formData = {
                                Id: $("#Id").val(),
                                courseid: $("#courseid").val(),
                                Batch: $("#Batch").val(),
                                action: $("#assignFaculty").val(),
                            };

                            // Send an AJAX POST request to handle faculty assignment
                            $.ajax({
                                type: "POST",
                                url: "enrollUser",
                                data: formData,
                                success: function(response) {
                                    if (response.status === "success") {
                                        showMessage("Faculty assigned successfully.", "green", 4000);
                                    } else {
                                        showMessage("Faculty assignment failed. Please check your inputs.", "red", 3000);
                                    }
                                },
                                error: function(xhr, status, error) {
                                    console.error(error);
                                }
                            });
                        }

                        function showMessage(message, color, duration) {
                            $("#facultyMessage").css("color", color).html(message);

                            setTimeout(function() {
                                $("#facultyMessage").fadeOut(function() {
                                    location.reload();
                                });
                            }, duration);
                        }
                    </script>




                    <hr>

                    <div class="buttons">
                        <h2 class="heading4">DELETE COURSE</h2>
                        <button class="clear">-</button>
                    </div>
                </div>

                <div class="section right">
                    <div class="summary">
                        <h2>Summary Of the Courses</h2>
                    </div>
                    <div class="container">
                        <div class="box">
                            <h2>Completed</h2>
                            <p>0</p>
                        </div>
                        <div class="box">
                            <h2>In Progress</h2>
                            <p>0</p>
                        </div>
                        <div class="box">
                            <h2>Not Started</h2>
                            <p>0</p>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>