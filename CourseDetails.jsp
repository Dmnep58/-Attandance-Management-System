<%@page import="java.util.ArrayList"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        <%@page import="model.Course"%>
            <%@page import="Functionality.CourseDataFetch"%>
                <%@page import="java.util.List"%>

                    <%@page errorPage="ErrorPage.jsp" %>


                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <link rel="stylesheet" href="./CSS/regCss.css">

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
                                    <h1>List of Courses</h1>
                                </div>
                                <%
CourseDataFetch courseDataFetch = new CourseDataFetch();
List<Course> l = courseDataFetch.FetchAllCourseData();
      int i =0;
%>
                                    <div id="data-table">
                                        <table>
                                            <tr>
                                                <th>S.N</th>
                                                <th>Course Id</th>
                                                <th>Course Name</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Action</th>
                                            </tr>
                                            <tbody>
                                                <%
                for (Course c : l){ 
              %>
                                                    <tr>
                                                        <td>
                                                            <%=++i %>
                                                        </td>
                                                        <td>
                                                            <%=c.getCourseId() %>
                                                        </td>
                                                        <td>
                                                            <%=c.getCourseName() %>
                                                        </td>
                                                        <td>
                                                            <%=c.getStartDate() %>
                                                        </td>
                                                        <td>
                                                            <%=c.getEndDate() %>
                                                        </td>
                                                        <td>
                                                            <button>Edit</button>
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

                        </html>