<%-- 
    Document   : createUser
    Created on : Mar 1, 2022, 11:57:58 PM
    Author     : ADMIN
--%>

<%@page import="sample.users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./cssV3/resgisterUser.css"/>
        <title>Create User Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Create New User!!</h1>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <div class="wrapper">
            <div class="login-box">
                <h3 class="info-text">User Registration</h3>
                <form class="form-container" action="MainController" method="POST">
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="User ID" type="text" name="userID" required=""/> 
                    </div>
                    <%= userError.getUserIDError()%></br>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Full Name" type="text" name="fullName" required=""/>          
                    </div>
                    <%= userError.getFullNameError()%></br>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Role ID" type="text" name="roleID" value="1" readonly=""/>                       
                    </div>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Address" type="text" name="address" required=""/>
                    </div>
                    <%= userError.getAddressError()%></br>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Birthday" type="text" name="birthday" required=""/>

                    </div>
                    <%= userError.getBirthDayError()%></br>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Phone" type="text" name="phone" required=""/>

                    </div>
                    <%= userError.getPhoneError()%></br>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Email" type="text" name="email" required=""/>                       
                    </div>
                    <%= userError.getEmailError()%></br>
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Password" type="password" name="password" required=""/>
                    </div>                   
                    <div class="input-addon">
                        <input class="form-element input-field" placeholder="Confirm" type="password" name="confirm" required=""/>                       
                    </div>
                    <%= userError.getConfirmError()%></br>
                    <input class="form-element is-submit" type="submit" name="action" value="createUser">
                    <input class="form-element is-submit" type="reset"  value="Reset">                   
                </form>
                <p>Or if you already have an user <a href="login.jsp">login here.</a></p>
            </div>
        </div>
    </body>
</html>
