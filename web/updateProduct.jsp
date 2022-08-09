<%-- 
    Document   : updateProduct
    Created on : Mar 7, 2022, 12:03:05 AM
    Author     : ADMIN
--%>

<%@page import="sample.users.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ProductDTO product = (ProductDTO) session.getAttribute("UPDATE_PRODUCT");
        %>
        <form action="MainController">
            Product ID <input  type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/></br>

            Product Name<input type="text" name="productName" value="<%= product.getProductName()%>" required=""/></br>

            Price<input type="number" name="price" value="<%= product.getPrice()%>" required=""/></br>

            Quantity<input type="number" name="quantity" value="<%= product.getQuantity()%>" required="" min="1"/></br>

            Category ID<input type="text" name="categoryID" value="<%= product.getCategoryID()%>" required="" /></br>

            Import Date<input type="date" name="importDate" value="<%= product.getImportDate()%>" required="" /></br>

            Using Date<input type="date" name="usingDate" value="<%= product.getUsingDate()%>" required=""/></br>

            Image<input type="text" name="image" value="<%= product.getImage()%>" required=""/></br>
            <input type="submit" name="action" value="Update"/>

        </form>
        <a href="admin.jsp">Return Admin</a>

    </body>
</html>
