<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@page isErrorPage="true" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Error 404 - Page Not Found</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f5f5f5;
                    text-align: center;
                    padding: 20px;
                }
                
                .error-image {
                    max-width: 100%;
                    height: 300px;
                    display: block;
                    margin: 0 auto;
                }
                
                .error-message {
                    font-size: 24px;
                    margin-top: 20px;
                }
            </style>
        </head>

        <body>
            <img class="error-image" src="./Images/error/error.png" alt="Error Image">
            <div class="error-message">
                <h1>Error - Something went Wrong</h1>
                <p>Sorry, the page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
                <a href="Login.jsp" target="_parent">Go back to the Login Page</a>
            </div>
        </body>

        </html>