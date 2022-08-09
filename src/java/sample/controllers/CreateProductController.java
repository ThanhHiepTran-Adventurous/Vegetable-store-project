/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import sample.regex.ValidateAnDate;
import sample.users.ProductDAO;
import sample.users.ProductDTO;
import sample.users.ProductError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "createProduct.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        ValidateAnDate validDate = new ValidateAnDate();

        try {

            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String status = request.getParameter("status");
            String categoryID = request.getParameter("categoryID");
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            String image = request.getParameter("image");          
            ProductDAO proDAO = new ProductDAO();           
            boolean checkValidation = true;
            if (productID.length() < 1) {
                checkValidation = false;
                productError.setProductIDError("ProductID should not be less than one!!");
            }
            if (productName.length() < 3 || productName.length() > 20) {
                checkValidation = false;
                productError.setProductNameError("ProductName must be in [3,20]");
            }
            if (categoryID.length() < 1) {
                checkValidation = false;
                productError.setCategoryIDError("CategoryID should not be less than one!!");
            }
          
            if (image.isEmpty()) {
                checkValidation = false;
                productError.setImageError("Image cannot be blank!!");
            }
            if (checkValidation) {
                ProductDTO product = new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image,status);
                boolean checkCreateProduct = proDAO.create(product);
                if (checkCreateProduct) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                productError.setProductIDError("The duplicate ProductID Please type again!!");
                request.setAttribute("PRODUCT_ERROR", productError);
            }
            log("Error at CreateProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Date getDate() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
