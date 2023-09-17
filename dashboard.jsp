<%@page import="Functionality.ClassDataFetch"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="Functionality.AdminDataFetch"%>
            <%@page import="Functionality.TeacherStudentDetails"%>
                <%@page import="Functionality.CourseDataFetch"%>
                    <%@page errorPage="ErrorPage.jsp" %>
                        <%
  //number of user Teacher and student 
  		TeacherStudentDetails t = new TeacherStudentDetails();
  		    long a = t.StudentsNumber();
  		    long b = t.TeachersNumber();
  		    long users = a+b;
  		
  		// number of admin
  		    AdminDataFetch ad = new AdminDataFetch();
  		    long adm = ad.AdminNumber();
  		 
  		    // number of courses
  		    CourseDataFetch courseDataFetch = new CourseDataFetch();
  		    long course = courseDataFetch.NumberOfCourse();
  		    
  		    //number of calsses
  		    ClassDataFetch classDataFetch = new ClassDataFetch();
  		    int classes = classDataFetch.countClass();
 %>

                            <!DOCTYPE html>
                            <html lang="en">

                            <head>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

                                <script type="text/javascript">
                                    google.charts.load("current", {
                                        packages: ["corechart"]
                                    });
                                    google.charts.setOnLoadCallback(drawChart);

                                    function drawChart() {
                                        var a1 = <%=a%>;
                                        var b1 = <%=b%>;
                                        var adm1 = <%=adm%>;

                                        var data = google.visualization.arrayToDataTable([
                                            ['Roles', 'No of People'],
                                            ['Student', a1],
                                            ['Faculty', b1],
                                            ['Admins', adm1],
                                        ]);

                                        var options = {
                                            title: 'Ratio of People in Organization',
                                            is3D: true,
                                        };

                                        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                                        chart.draw(data, options);
                                    }
                                </script>

                                <script type="text/javascript">
                                    google.charts.load('current', {
                                        'packages': ['bar']
                                    });
                                    google.charts.setOnLoadCallback(drawChart);

                                    function drawChart() {
                                        var data = google.visualization.arrayToDataTable([
                                            ['Course', 'Java', 'C++', 'Python'],
                                            ['2014', 1000, 400, 200],
                                            ['2015', 1170, 460, 250],
                                            ['2016', 660, 1120, 300]
                                        ]);

                                        var options = {
                                            chart: {
                                                title: 'Students & Courses',
                                                subtitle: 'Students opting for courses',
                                            },
                                            bars: 'Vertical' // direction
                                        };

                                        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

                                        chart.draw(data, google.charts.Bar.convertOptions(options));
                                    }
                                </script>

                                <style>
                                    body {
                                        font-family: Arial, sans-serif;
                                        margin: 0;
                                        padding: 0;
                                        justify-content: center;
                                        align-items: center;
                                        min-height: 100vh;
                                        background: linear-gradient(to right, #81e6dc, white, #800080);
                                    }
                                    
                                    .dashboard {
                                        display: flex;
                                        flex-wrap: wrap;
                                        align-items: center;
                                        gap: 20px;
                                        padding: 20px;
                                    }
                                    
                                    .dashboard-card {
                                        text-align: center;
                                        padding: 10px 20px;
                                        border-radius: 8px;
                                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                                    }
                                    
                                    h1 {
                                        justify-content: center;
                                        text-align: center;
                                    }
                                    
                                    .Graphs {
                                        padding: 15px;
                                    }
                                    
                                    .chart {
                                        display: flex;
                                        margin-top: 20px;
                                    }
                                    
                                    .chart>div {
                                        flex: 1;
                                    }
                                </style>
                            </head>

                            <body>
                                <section class="record">
                                    <h1>Real time Records</h1>
                                    <div class="dashboard">
                                        <div class="dashboard-card" id="studentCard">
                                            <h2>Total Students</h2>
                                            <p id="studentCount">
                                                <%=a %>
                                            </p>
                                        </div>


                                        <div class="dashboard-card" id="teacherCard">
                                            <h2>Total Teachers</h2>
                                            <p id="teacherCount">
                                                <%=b %>
                                            </p>
                                        </div>


                                        <div class="dashboard-card" id="courseCard">
                                            <h2>Total Courses</h2>
                                            <p id="courseCount">
                                                <%=course %>
                                            </p>
                                        </div>


                                        <div class="dashboard-card" id="studentCard">
                                            <h2>Total Branches</h2>
                                            <p id="studentCount">0</p>
                                        </div>


                                        <div class="dashboard-card" id="teacherCard">
                                            <h2>Total Users</h2>
                                            <p id="teacherCount">
                                                <%=users %>
                                            </p>
                                        </div>


                                        <div class="dashboard-card" id="courseCard">
                                            <h2>Total classes</h2>
                                            <p id="courseCount">
                                                <%=classes %>
                                            </p>
                                        </div>


                                    </div>
                                </section>

                                <section class="Graphs">
                                    <h1>Graphical Representation</h1>
                                    <div class="chart">
                                        <div id="piechart_3d" style="width: 400px; height: 250px;"></div>
                                        <div id="barchart_material" style="width: 400px; height: 250px;"></div>
                                    </div>
                                </section>

                            </body>

                            </html>