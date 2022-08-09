<%-- 
    Document   : createProduct
    Created on : Mar 1, 2022, 11:28:52 PM
    Author     : ADMIN
--%>

<%@page import="sample.users.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <h1 style="color: red">Create New Product</h1>
        <%
            ProductError productError = (ProductError)request.getAttribute("PRODUCT_ERROR");
            if(productError == null){
                productError = new ProductError();
            }
        %>
        <form action="MainController">
            Product ID<input type="text" name="productID" required=""/>
            <%= productError.getProductIDError() %> </br>
            Product Name<input type="text" name="productName" required=""/>
            <%= productError.getProductNameError() %> </br>
            Price<input type="number" name="price" required="" min="1"/></br>
            Quantity<input type="number" name="quantity" required="" min="1"/></br>           
            Category ID<input type="number" name="categoryID" min="1" max="4" required=""/>
            <%= productError.getCategoryIDError() %> </br>
            Import Date<input type="date" name="importDate" required=""/>
            <%= productError.getImportDateError() %> </br>
            Using Date<input type="date" name="usingDate" required=""/>
            <%= productError.getUsingDateError() %> </br>
            Image<input type="text" name="image" required=""/>
            <%= productError.getImageError() %> </br>
            Status<input type="text" name="status" value="1" readonly=""/></br>
            <input class="form-element is-submit" type="submit" name="action" value="createProduct">
            <input class="form-element is-submit" type="reset"  value="Reset">      
        </form>
            <a href="admin.jsp">Back</a>
    </body>
</html>
