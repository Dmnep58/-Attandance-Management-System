<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Functionality.AdminDataFetch"%>
        <%@page import="java.util.ArrayList" %>
            <%@page import="java.util.List" %>
                <%@page import="Functionality.TeacherStudentDetails"%>
                    <%@page import="model.TeacherStudent"%>
                        <%@page errorPage="ErrorPage.jsp" %>
                            <%
AdminDataFetch a = new AdminDataFetch();
String id = (String) session.getAttribute("aid");
List<String> s = a.FetchData(id);

TeacherStudentDetails f = new TeacherStudentDetails();
List<TeacherStudent> li = f.FetchAllData();
%>

                                <!DOCTYPE html>
                                <html lang="en">

                                <head>
                                    <meta charset="UTF-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <style>
                                        body {
                                            background: linear-gradient(to right, #81e6dc, white, #800080);
                                            background-repeat: no-repeat;
                                            font-family: Arial, sans-serif;
                                            margin: 0;
                                            padding: 0;
                                            min-height: 100vh;
                                        }
                                        
                                        .section {
                                            display: flex;
                                            align-items: center;
                                            justify-content: space-between;
                                            padding: 20px;
                                            margin-bottom: 10px;
                                            border-radius: 8px;
                                            box-shadow: 0 8px 16px rgba(13, 12, 12, 0.1);
                                        }
                                        
                                        .title {
                                            font-size: 24px;
                                            font-weight: bold;
                                            margin-right: 20px;
                                        }
                                        
                                        .search-bar {
                                            display: flex;
                                            align-items: center;
                                        }
                                        
                                        .search-input {
                                            padding: 8px;
                                            border: 1px solid #ccc;
                                            border-radius: 4px;
                                        }
                                        
                                        .search-button {
                                            background-color: #3498db;
                                            color: white;
                                            border: none;
                                            border-radius: 4px;
                                            padding: 8px 15px;
                                            margin-left: 10px;
                                            cursor: pointer;
                                        }
                                        
                                        .layout {
                                            display: flex;
                                            height: 30vh;
                                        }
                                        
                                        .left-section,
                                        .right-section {
                                            height: 100%;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            box-sizing: border-box;
                                            border-radius: 8px;
                                            box-shadow: 0 8px 16px rgba(13, 12, 12, 0.1);
                                        }
                                        
                                        .left-section {
                                            width: 20%;
                                            flex-direction: column;
                                        }
                                        
                                        .right-section {
                                            width: 80%;
                                            flex-direction: column;
                                            margin-left: 10px;
                                        }
                                        
                                        .button {
                                            padding: 10px 20px;
                                            margin: 5px;
                                            background-color: #3498db;
                                            color: white;
                                            border: none;
                                            cursor: pointer;
                                            border-radius: 5px;
                                        }
                                        
                                        #deluser {
                                            background-color: red !important;
                                        }
                                        
                                        .image-container {
                                            display: flex;
                                            flex-direction: column;
                                            align-items: center;
                                            width: 100%;
                                        }
                                        
                                        .image {
                                            max-width: 100%;
                                            height: auto;
                                        }
                                        
                                        .caption {
                                            margin-top: 15px;
                                            font-style: italic;
                                            color: #777;
                                        }
                                        
                                        .link-list {
                                            display: flex;
                                            justify-content: space-between;
                                            align-items: center;
                                        }
                                        
                                        .placed-left {
                                            margin-right: 50px;
                                        }
                                        
                                        .placed-right {
                                            margin-left: 50px;
                                        }
                                        
                                        .link {
                                            margin: 5px;
                                            color: #333;
                                            text-decoration: none;
                                            display: flex;
                                            justify-content: center;
                                            align-items: center;
                                            width: 100%;
                                        }
                                        
                                        .link img {
                                            margin: 4px;
                                        }
                                        
                                        .action {
                                            font-family: Arial, sans-serif;
                                            margin-top: 10px;
                                            margin-bottom: 10px;
                                            display: flex;
                                            flex-wrap: wrap;
                                        }
                                        /* left section with the table */
                                        
                                        .activities-section {
                                            flex: 0.17;
                                            padding: 20px;
                                        }
                                        /* Right section with the table */
                                        
                                        .table-section {
                                            flex: 0.83;
                                            padding: 20px;
                                            margin-left: 14px;
                                        }
                                        
                                        .table-section h3 {
                                            text-align: center;
                                        }
                                        /*Both section styling*/
                                        
                                        .activities-section,
                                        .table-section {
                                            box-sizing: border-box;
                                            border-radius: 8px;
                                            box-shadow: 0 8px 16px rgba(13, 12, 12, 0.1);
                                            justify-content: center;
                                            max-height: 50vh;
                                            overflow-y: auto;
                                        }
                                        /* Base styles for the table */
                                        
                                        .users {
                                            width: 100%;
                                            border-collapse: collapse;
                                        }
                                        /* Style for the table header */
                                        
                                        .users th {
                                            border: 1px solid #ddd;
                                            padding: 8px;
                                            text-align: left;
                                        }
                                        /* Style for the table rows */
                                        
                                        .users tr {
                                            border: 1px solid #ddd;
                                        }
                                        /* Alternating row background colors */
                                        
                                        .users tr:nth-child(even) {
                                            background-color: #f2f2f2;
                                        }
                                        /* Style for the table cells */
                                        
                                        .users td {
                                            padding: 8px;
                                            border: 1px solid #ddd;
                                        }
                                        /* Responsive styles */
                                        
                                        @media (max-width: 768px) {
                                            .search-bar {
                                                flex-direction: column;
                                                align-items: stretch;
                                            }
                                            .search-input,
                                            .search-button {
                                                width: 100%;
                                                margin: 5px 0;
                                            }
                                            .layout {
                                                flex-direction: column;
                                                height: auto;
                                            }
                                            .left-section,
                                            .right-section {
                                                width: 100%;
                                                margin: 10px 0;
                                            }
                                            .right-section {
                                                height: auto;
                                            }
                                            .link-list {
                                                flex-direction: column;
                                                margin: 0;
                                            }
                                            .activities-section,
                                            .table-section {
                                                flex: 100%;
                                                padding: 10px;
                                            }
                                            .table-section {
                                                margin-top: 20px;
                                            }
                                            .users {
                                                font-size: 14px;
                                            }
                                            .users th,
                                            .users td {
                                                padding: 6px;
                                            }
                                        }
                                    </style>
                                </head>

                                <body>
                                    <!-- section containing the title and the search bar -->
                                    <div class="section">
                                        <div class="title">Users Profile</div>
                                        <div class="search-bar">
                                            <input class="search-input" type="text" placeholder="Search user...">
                                            <button class="search-button">Search</button>
                                        </div>
                                    </div>

                                    <!-- section containing the admin data and the button to customize the user -->
                                    <div class="layout">
                                        <div class="left-section">
                                            <button class="button">Edit Profile</button>
                                            <button class="button" id="deluser">Delete User</button>
                                            <button class="button">Logout</button>
                                        </div>
                                        <div class="right-section">
                                            <div class="image-container">
                                                <img class="image" src="./Images/<%=s.get(3) %>" alt="Image" height="45px" width="50px">
                                                <p class="caption">
                                                    <%=s.get(0) %> (Admin)</p>
                                                <div class="link-list">
                                                    <div class="placed-left">
                                                        <p class="link"><img src="./Images/frontIcon/location.svg" alt="location">
                                                            <%=s.get(2) %>
                                                        </p>
                                                    </div>
                                                    <div class="placed-center">
                                                        <p class="link"><img src="./Images/frontIcon/mail.svg" alt="Email">
                                                            <%=s.get(1) %>
                                                        </p>
                                                    </div>
                                                    <div class="placed-right">
                                                        <p class="link"><img src="./Images/frontIcon/phone_black_24dp.svg" alt="Phone">
                                                            <%=s.get(4) %>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="action">
                                        <div class="activities-section">
                                            <h2>Last Activities</h2>
                                            <ul>
                                                <li>Profile name updated</li>
                                            </ul>
                                        </div>

                                        <div class="table-section">
                                            <h3>User Data</h3>
                                            <table class="users">
                                                <thead>
                                                    <tr>
                                                        <th>S.N</th>
                                                        <th>User Name</th>
                                                        <th>User Id</th>
                                                        <th>Reg. No</th>
                                                        <th>User Contact</th>
                                                        <th>User Email</th>
                                                        <th>User Address</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                 int i = 0;
                           for(TeacherStudent ts : li){
                        	   i++;
                        	 %>
                                                        <tr>
                                                            <td scope="col">
                                                                <%=i %>
                                                            </td>
                                                            <td scope="col">
                                                                <%=ts.getName() %>
                                                            </td>
                                                            <td scope="col">
                                                                <%=ts.getUid() %>
                                                            </td>
                                                            <td scope="col">
                                                                <%=ts.getRegno() %>
                                                            </td>
                                                            <td scope="col">
                                                                <%=ts.getPhno() %>
                                                            </td>
                                                            <td scope="col">
                                                                <%=ts.getEmail() %>
                                                            </td>
                                                            <td scope="col">
                                                                <%=ts.getAddres() %>
                                                            </td>


                                                        </tr>

                                                        <% 
                           }
                           %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </body>

                                </html>