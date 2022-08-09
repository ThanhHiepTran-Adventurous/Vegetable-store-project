<%-- 
    Document   : checkOut_1
    Created on : Mar 12, 2022, 10:22:43 AM
    Author     : ADMIN
--%>

<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out Page</title>
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("1")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <h1><%= loginUser.getFullName()%></h1>  
    </body>
</html>
