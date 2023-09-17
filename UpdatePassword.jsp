<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@page errorPage="ErrorPage.jsp" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>changepassword Page</title>
            <link rel="stylesheet" type="text/css" href="./CSS/updatepassword.css">

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        </head>

        <body>

            <div class="log">
                <div class="changepassword-container">
                    <div>
                        <h2>Change Password</h2>
                    </div>
                    <div class="image-container"></div>
                    <form id="passwordForm">
                        <div class="input-group">
                            <input type="password" id="oldpassword" name="oldpassword" placeholder="Old Password">
                        </div>
                        <div class="input-group">
                            <input type="password" id="newpassword" name="newpassword" placeholder="New Password">
                        </div>
                        <div class="input-group">
                            <input type="password" id="confirmnewpassword" name="confirmnewpassword" placeholder="Confirm New Password">
                        </div>
                        <div class="buttons">
                            <button type="button" class="but" id="send-button">Update Password</button>
                        </div>
                        <div id="message" style="color: green; font-weight: bold;"></div>
                    </form>

                    <script>
                        $(document).ready(function() {
                            $("#send-button").click(function() {
                                var formData = {
                                    oldpassword: $("#oldpassword").val(),
                                    newpassword: $("#newpassword").val(),
                                    confirmnewpassword: $("#confirmnewpassword").val(),
                                    admin_id: <%= session.getAttribute("aid") %>
                                };

                                $.ajax({
                                    type: "POST",
                                    url: "updatepassword",
                                    data: formData,
                                    success: function(response) {
                                        if (response.status === "success") {
                                            // Set the success message
                                            showMessage("Password updated successfully.", "green", 2000); // 2 seconds
                                        } else {
                                            // Set the error message
                                            showMessage("Password update failed. Please check your inputs.", "red");
                                        }


                                    },
                                    error: function(xhr, status, error) {
                                        // Handle errors here
                                        console.error(error);
                                    }
                                });
                            });
                        });

                        function showMessage(message, color, duration) {
                            $("#message").css("color", color).html(message);
                            // Hide the message after the specified duration
                            setTimeout(function() {
                                $("#message").fadeOut(function() {
                                    // Reload the page after message is hidden
                                    location.reload();
                                });
                            }, duration || 3000); // Default to 3 seconds if duration is not provided
                        }
                    </script>

                </div>
            </div>
        </body>

        </html>