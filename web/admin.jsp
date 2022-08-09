<%-- 

    Document   : admin
    Created on : Feb 20, 2022, 5:31:10 PM
    Author     : ADMIN
--%>

<%@page import="sample.users.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/ht ml; charset=UTF-8">
        <title>ADMIN Page Vegetables</title>
    </head>
    <body>
        <h1>WELLCOME TO ADMIN VEGETABLES</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("2")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1><%= loginUser.getFullName()%></h1>    
        
        <a style="text-decoration: none" href="createProduct.jsp">Create new product</a>
        
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form></br>
        <button>
            <a style="text-decoration: none;color: black" href="MainController?action=Search&search=">Get ALL Product</a>
        </button></br>
        
        
        <!--SEARCH PRODUCT-->
        <form action="MainController">
            Search Product <input type="text" name="search" required="" value="<%= search%>"/>
            <input type="submit" name="action" value="Search"/>
        </form>

        <%
            List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>

        <table border="1" >
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category ID</th>
                    <th>Import Date</th>
                    <th>Using Date</th>
                    <th>Image</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>     
            <tbody>
                <%
                    int count = 1;
                    for (ProductDTO product : listProduct) {
                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="productName" value="<%= product.getProductName()%>" required=""/>
                    </td>
                    <td>
                        <input type="number" name="price" value="<%= product.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity()%>" required="" min="1" />
                    </td>
                    <td>
                        <input type="number" name="categoryID" value="<%= product.getCategoryID()%>" min="1" max="4" required="" />
                    </td>
                    <td>
                        <input type="date" name="importDate" value="<%= product.getImportDate()%>" required=""/>
                    </td>
                    <td>
                        <input type="date" name="usingDate" value="<%= product.getUsingDate()%>" required=""/>
                    </td>  
                    <td>
                        <input type="text" name="image" value="<%= product.getImage()%>" required=""/>
                        <img  src="<%= product.getImage()%>" alt="Girl in a jacket" width="30" height="30"/>
                    </td>  

                    <td>
                        <a href="MainController?action=Delete&productID=<%= product.getProductID()%>&search=<%= search%>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>    
        </tbody>
    </table>

    <%
        }
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>   
    <%= error%>
    <%
        }
    %>

</body>
</html>
