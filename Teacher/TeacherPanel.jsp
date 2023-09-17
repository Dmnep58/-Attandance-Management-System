<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: Arial, sans-serif;
            }
            
            .main-wrapper {
                display: flex;
                height: 94.5vh;
                overflow: hidden;
            }
            
            .side-section {
                width: 16%;
                background-color: #333;
                color: #fff;
            }
            
            .side-section .profile {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 10px;
            }
            
            .side-section .profile img {
                border-radius: 50%;
            }
            
            .side-section ul {
                list-style: none;
            }
            
            .side-section h3 {
                text-align: center;
                margin-bottom: 10px;
            }
            
            .side-section ul li a {
                color: #fff;
                text-decoration: none;
                display: block;
                font-family: monospace;
                font-size: large;
                text-align: center;
                padding: 6px;
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                margin-bottom: 15px;
            }
            
            .side-section ul li a img {
                height: 27px;
                width: 30px;
                margin-right: 3px;
            }
            
            .content-section {
                flex: 1;
                overflow: inherit;
            }
            
            #content-frame {
                width: 100%;
                height: 100%;
                border: none;
            }
            
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                justify-content: center;
                padding: 10px 20px;
                background-color: #333;
                color: #fff;
            }
            
            .left-section,
            .right-section {
                display: flex;
                align-items: center;
            }
            
            .left-section img,
            .right-section img {
                width: 30px;
                height: 30px;
                margin-right: 10px;
            }
            
            .right-section span {
                margin-left: 5px;
            }
            /* Navigation menu */
            
            .nav {
                display: none;
                background-color: #444;
            }
            
            .nav ul {
                list-style: none;
                padding: 20px;
            }
            
            .nav ul li {
                margin-bottom: 10px;
            }
            
            .nav ul li a {
                color: #fff;
                text-decoration: none;
            }
            /* Media query for responsive menu */
            
            @media screen and (max-width: 768px) {
                .header {
                    flex-direction: row;
                    align-items: flex-start;
                }
                .right-section {
                    margin-top: 10px;
                }
                .toggle-menu {
                    display: block;
                }
                .nav {
                    display: none;
                    width: 100%;
                }
                .nav.active {
                    display: block;
                }
            }
        </style>
    </head>

    <body>

        <div class="head">
            <header class="header">
                <div class="left-section">
                    <h5>Attandace Management System</h5>
                </div>
            </header>
        </div>


        <div class="main-wrapper">
            <section class="side-section">
                <ul>
                    <div class="profile">
                        <img src="./Images/admin2.png" alt="image" width="80px" height="80px">
                    </div>
                    <h3><span>Devi Prasad Mishra</span></h3>

                    <br>
                    <li>
                        <a href="Teacherdashboard.jsp" target="content"><img src="./Images/frontIcon/dashboard.png">Dashboard</a>
                    </li>
                    <hr>

                    <br>
                    <li>
                        <a href="CheckStudentDetails.html" target="content"><img src="./Images/frontIcon/Teacher.png">CheckStudentDetails</a>
                    </li>
                    <hr>

                    <br>
                    <li>
                        <a href="MarkAttendance.jsp" target="content"><img src="./Images/frontIcon/class.png">MarkAttendence</a>
                    </li>
                    <hr>

                    <br>
                    <li>
                        <a href="Curriculum.html" target="content"><img src="./Images/icons/curriculum.png">Curriculum</a>
                    </li>
                    <hr>

                    <br>
                    <li>
                        <a href="UpdatePassword.html" target="content"><img src="./Images/frontIcon/password.png">UpdatePassword</a>
                    </li>
                    <hr><br>
                    <li>
                        <a href=""><img alt="logout" src="./Images/frontIcon/logoutB.png">Logout</a>
                    </li>
                </ul>
            </section>
            <section class="content-section">
                <iframe name="content" id="content-frame" src="Teacherdashboard.jsp" frameborder="0"></iframe>
            </section>
        </div>
    </body>

    </html>