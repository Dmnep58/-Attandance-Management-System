<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="ErrorPage.jsp" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                /* Base styles */
                
                body {
                    background: linear-gradient(to right, #81e6dc, white, #800080);
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }
                /* First section styles */
                
                .section1 {
                    padding: 20px;
                }
                
                .title {
                    font-size: 24px;
                    font-weight: bold;
                    margin-bottom: 10px;
                    text-align: center;
                }
                
                .custom-select {
                    position: relative;
                    display: inline-block;
                    width: 200px;
                }
                
                .select-button,
                .select-button2 {
                    appearance: none;
                    -webkit-appearance: none;
                    -moz-appearance: none;
                    width: 100%;
                    padding: 10px;
                    margin-top: 10px;
                    border: 2px solid #4a90e2;
                    border-radius: 8px;
                    background-color: white;
                    cursor: pointer;
                    outline: none;
                    text-align: center;
                }
                
                .select-button::after,
                .select-button2::after {
                    content: '\25BC';
                    position: absolute;
                    top: 50%;
                    right: 10px;
                    transform: translateY(-50%);
                }
                
                .select-list {
                    position: absolute;
                    top: 100%;
                    left: 0;
                    width: 100%;
                    background-color: white;
                    border: 2px solid #4a90e2;
                    border-top: none;
                    border-radius: 0 0 8px 8px;
                    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                    display: none;
                    z-index: 1;
                }
                
                .custom-select:hover .select-list {
                    display: block;
                }
                
                .select-item {
                    padding: 10px;
                    cursor: pointer;
                }
                
                .select-item:hover {
                    background-color: #f2f2f2;
                }
                
                .button-container {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    justify-content: space-around;
                }
                
                .button {
                    display: inline-block;
                    padding: 10px 20px;
                    background: linear-gradient(to bottom, #4a90e2, #357bd8);
                    border: none;
                    border-radius: 8px;
                    margin-top: 10px;
                    color: white;
                    font-size: 16px;
                    text-align: center;
                    text-decoration: none;
                    cursor: pointer;
                    box-shadow: 0px 2px 1px rgba(0, 0, 0, 0.2), 0px 4px 6px rgba(0, 0, 0, 0.1), 0px 10px 20px rgba(0, 0, 0, 0.1);
                }
                
                .in {
                    display: inline-block;
                    padding: 10px 20px;
                    background: white;
                    border: none;
                    border-radius: 8px;
                    margin-top: 10px;
                    color: black;
                    font-size: 16px;
                    text-align: center;
                    text-decoration: none;
                    cursor: text;
                    box-shadow: 0px 2px 1px rgba(0, 0, 0, 0.2), 0px 4px 6px rgba(0, 0, 0, 0.1), 0px 10px 20px rgba(0, 0, 0, 0.1);
                }
                /* Second section styles */
                
                .section2 {
                    padding: 20px;
                    max-height: 75vh;
                    overflow-y: auto;
                }
                
                .section2 h2 {
                    text-align: center;
                }
                /*Both section*/
                
                .section1,
                .section2 {
                    border-radius: 8px;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2), 0px 4px 6px rgba(0, 0, 0, 0.1), 0px 10px 20px rgba(0, 0, 0, 0.1);
                    margin: 10px;
                }
                /* Base styles for the table */
                
                .users {
                    width: 100%;
                    border-collapse: collapse;
                    border: 1px solid #ddd;
                    margin-top: 10px;
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
                    .button-container {
                        flex-direction: column;
                        align-items: stretch;
                    }
                    .button {
                        margin-top: 5px;
                        width: 100%;
                    }
                    .button-container input {
                        width: 94% !important;
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
            <!-- Header  section -->
            <div class="section1">
                <div class="title">Attandance Details</div>
                <div class="button-container">
                    <div class="custom-select">
                        <button class="select-button">Select an Option</button>
                        <div class="select-list">
                            <div class="select-item" onclick="selectOption('Option 1')">Option 1</div>
                            <div class="select-item" onclick="selectOption('Option 2')">Option 2</div>
                            <div class="select-item" onclick="selectOption('Option 3')">Option 3</div>
                        </div>
                    </div>

                    <div class="custom-select">
                        <button class="select-button2">Select an Option</button>
                        <div class="select-list">
                            <div class="select-item" onclick="selectOption2('Option 1')">Option 1</div>
                            <div class="select-item" onclick="selectOption2('Option 2')">Option 2</div>
                            <div class="select-item" onclick="selectOption2('Option 3')">Option 3</div>
                        </div>
                    </div>

                    <input type="number" class="in" name="rollnumber" id="roll" placeholder="Enter RollNumber">
                    <button class="button ">Search Student</button>
                </div>
            </div>

            <!-- Table section -->
            <div class="section2 ">
                <h2>Table Section</h2>
                <table class="users ">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Subject</th>
                            <th>Total Classes</th>
                            <th>Present</th>
                            <th>Absent</th>
                            <th>Faculty</th>
                            <th>Percentage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>John Doe</td>
                            <td>JD123</td>
                            <td>john@example.com</td>
                            <td>10</td>
                            <td>3</td>
                            <td>Devi</td>
                            <td>33.33</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </body>
        <script>
            function selectOption(option) {
                const selectButton = document.querySelector('.select-button');
                selectButton.textContent = option;
            }

            function selectOption2(option) {
                const selectButton = document.querySelector('.select-button2');
                selectButton.textContent = option;
            }
        </script>

        </html>