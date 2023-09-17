<%@page import="model.Classes"%>
    <%@page import="java.util.List"%>
        <%@page import="Functionality.ClassDataFetch"%>
            <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@page errorPage="ErrorPage.jsp" %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                margin: 0;
                                padding: 0;
                                background: linear-gradient(to right, #81e6dc, white, #800080);
                            }
                            
                            .header {
                                background-color: transparent;
                                padding: 25px 0;
                                text-align: center;
                            }
                            
                            .section-title {
                                font-size: 24px;
                                font-weight: bold;
                                color: #333;
                                margin: 0;
                            }
                            
                            .container {
                                max-width: 1200px;
                                margin: 0 auto;
                                padding: 20px;
                                display: flex;
                                flex-wrap: wrap;
                            }
                            
                            .class-card {
                                flex: 1;
                                min-width: 300px;
                                background-color: transparent;
                                border-radius: 10px;
                                padding: 20px;
                                margin: 20px;
                                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                display: flex;
                                align-items: center;
                                text-decoration: none;
                                color: #000;
                            }
                            
                            .class-logo {
                                width: 80px;
                                height: 80px;
                                margin-right: 20px;
                                border-radius: 50%;
                                object-fit: cover;
                            }
                            
                            .class-details {
                                flex: 1;
                            }
                            
                            .class-name {
                                font-size: 20px;
                                font-weight: bold;
                                margin-bottom: 5px;
                            }
                            
                            .teacher-name {
                                font-size: 16px;
                                color: #555;
                            }
                            /* Media Queries */
                            
                            @media (max-width: 768px) {
                                .class-card {
                                    min-width: calc(50% - 40px);
                                }
                            }
                            
                            @media (max-width: 480px) {
                                .class-card {
                                    min-width: 100%;
                                }
                            }
                        </style>
                        <title>Student Classroom</title>
                    </head>
                    <%
ClassDataFetch combinedDataFetch = new ClassDataFetch();
List<Classes> l = combinedDataFetch.DataClass();
%>

                        <body>
                            <div class="header">
                                <h2 class="section-title">All Active Classroom</h2>
                            </div>
                            <div class="container">
                                <%
        int i = 0;
        for(Classes c : l){
        	i++;
        %>
                                    <a href="class1.html" class="class-card">
                                        <img class="class-logo" src="class1_logo.jpg" alt="Class 1 Logo">
                                        <div class="class-details">
                                            <div class="class-name">Class
                                                <%=i %>
                                            </div>
                                            <div class="teacher-name">Teacher:
                                                <%=c.getTeacherId() %>
                                            </div>
                                            <div class="course-name">Course:
                                                <%=c.getCourseName() %>
                                            </div>
                                        </div>
                                    </a>
                                    <%
        }
        %>



                                        <!-- Add more class cards here -->

                            </div>
                        </body>

                    </html>