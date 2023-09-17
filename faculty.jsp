<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@page import="Functionality.TeacherStudentDetails"%>
        <%@page import="model.TeacherStudent"%>
            <%@page import="java.util.List"%>
                <%@page errorPage="ErrorPage.jsp" %>


                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link rel="stylesheet" href="./CSS/regCss.css">
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                        <script>
                            // Function to handle the delete operation
                            function deleteRecord(uid) {
                                $.ajax({
                                    type: "POST",
                                    url: "edAdmin",
                                    data: {
                                        uid: uid
                                    },
                                    success: function(response) {
                                        if (response.success) {
                                            location.reload();
                                        } else {
                                            alert("Operation failed.");
                                        }
                                    },
                                    error: function() {
                                        alert("AJAX request failed.");
                                    }
                                });
                            }
                        </script>



                        <style>
                            body {
                                background: linear-gradient(to right, #81e6dc, white, #800080);
                                min-height: 100vh;
                                margin: 0;
                                padding: 0;
                                font-family: Arial, sans-serif;
                            }
                            
                            .container1 {
                                margin: 10px;
                            }
                            
                            .heading {
                                display: flex;
                                font-size: 24px;
                                margin-bottom: 10px;
                                align-items: center;
                            }
                            
                            .heading h1 {
                                flex: 1;
                                /* Take up remaining space */
                                text-align: center;
                                margin: 0;
                            }
                            
                            .button {
                                padding: 10px;
                                background-color: #007bff;
                                color: white;
                                border: none;
                                cursor: pointer;
                                margin-right: 5px;
                                border-radius: 25%;
                            }
                            
                            .popup {
                                display: none;
                                position: fixed;
                                top: 0;
                                left: 0;
                                width: 100%;
                                height: 100%;
                                background-color: rgba(0, 0, 0, 0.5);
                                justify-content: center;
                                align-items: center;
                                z-index: 9999;
                            }
                            
                            .popup-content {
                                position: relative;
                                background-color: white;
                                padding: 20px;
                                border-radius: 10px;
                                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                                width: 75%;
                                max-width: 400px;
                                max-height: 75%;
                                overflow-y: auto;
                            }
                            
                            .popup-content::-webkit-scrollbar {
                                width: 0px;
                            }
                            
                            .popup-content:-webkit-scrollbar-thumb {
                                background-color: #888;
                                border-radius: 6px;
                            }
                            
                            .popup-content::-webkit-scrollbar-track {
                                background-color: #f1f1f1;
                                border-radius: 6px;
                            }
                            
                            .close-button {
                                position: absolute;
                                top: 10px;
                                right: 10px;
                                font-size: 24px;
                                cursor: pointer;
                            }
                            
                            .close-button:hover {
                                color: red;
                            }
                            
                            #data-table {
                                max-height: 85vh;
                                overflow-y: auto;
                            }
                            
                            table {
                                border-collapse: collapse;
                                width: 100%;
                                margin-top: 20px;
                            }
                            
                            th,
                            td {
                                border: 1px solid black;
                                padding: 8px;
                                text-align: center;
                            }
                            
                            .table-button1,
                            .table-button2 {
                                display: inline-block;
                                padding: 10px;
                                border: none;
                                cursor: pointer;
                                margin-right: 5px;
                                border-radius: 10px;
                                font-size: 14px;
                            }
                            
                            .table-button1 {
                                background-color: white;
                                color: black;
                            }
                            
                            .table-button2 {
                                background-color: red;
                                color: white;
                            }
                        </style>

                    </head>

                    <body>
                        <section class="container1">
                            <div class="heading">
                                <h1>List of Teachers</h1>
                                <div> <button class="button" id="openPopupButton">+ Add Teacher</button>

                                    <div id="registrationPopup" class="popup">
                                        <div class="popup-content">
                                            <span class="close-button" id="closePopupButton">&times;</span>


                                            <form action="register" method="post" enctype="multipart/form-data">
                                                <h2>Registration Form</h2>
                                                <div class="input-container">
                                                    <label for="uid">Faculty Id:</label>
                                                    <input type="text" id="uid" name="uid" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="password">Password:</label>
                                                    <input type="password" id="password" name="password" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="regno">Faculty Registration Number:</label>
                                                    <input type="text" id="regno" name="regno" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="phnno">Phone Number:</label>
                                                    <input type="tel" id="phnno" name="phnno" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="name">Name:</label>
                                                    <input type="text" id="name" name="name" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="email">Email:</label>
                                                    <input type="email" id="email" name="email" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="address">Address:</label>
                                                    <input type="text" id="address" name="address" required>
                                                </div>
                                                <div class="input-container">
                                                    <label for="image">Select Image:</label>
                                                    <input type="file" id="image" name="image" accept=".png, .jpg, .jpeg">
                                                </div>
                                                <input type="hidden" id="role" name="role" value="Teacher">
                                                <div class="input-container">
                                                    <button type="submit">Register</button>
                                                </div>
                                                <div>
                                                    <h2>${message}</h2>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
TeacherStudentDetails f = new TeacherStudentDetails();
List<TeacherStudent> li = f.FetchTeacherData();
%>
                                <div id="data-table">
                                    <table>
                                        <tr>
                                            <th>S.N</th>
                                            <th>Faculty Roll</th>
                                            <th>Name</th>
                                            <th>Registration No.</th>
                                            <th>Email</th>
                                            <th>Class</th>
                                            <th>Phno</th>
                                            <th>Action</th>
                                        </tr>
                                        <tbody>
                                            <%
                 int i = 0;
                           for(TeacherStudent s : li){
                        	   i++;
                        	 %>
                                                <tr>
                                                    <td scope="col">
                                                        <%=i %>
                                                    </td>
                                                    <td scope="col">
                                                        <%=s.getUid() %>
                                                    </td>
                                                    <td scope="col">
                                                        <%=s.getName() %>
                                                    </td>
                                                    <td scope="col">
                                                        <%=s.getRegno() %>
                                                    </td>
                                                    <td scope="col">
                                                        <%=s.getEmail() %>
                                                    </td>
                                                    <td scope="col">none</td>
                                                    <td scope="col">
                                                        <%=s.getPhno() %>
                                                    </td>
                                                    <td>
                                                        <a class="table-button1">Edit</a>
                                                        <a class="table-button2" onclick="deleteRecord('<%=s.getUid()%>')">Delete</a>
                                                    </td>
                                                </tr>

                                                <% 
                           }
                           %>
                                        </tbody>
                                    </table>
                                </div>
                        </section>
                    </body>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            const openPopupButton = document.getElementById("openPopupButton");
                            const registrationPopup = document.getElementById("registrationPopup");

                            openPopupButton.addEventListener("click", function() {
                                registrationPopup.style.display = "block";
                            });

                            registrationPopup.addEventListener("click", function(event) {
                                if (event.target === registrationPopup) {
                                    registrationPopup.style.display = "none";
                                }
                            });
                        });
                    </script>



                    </html>