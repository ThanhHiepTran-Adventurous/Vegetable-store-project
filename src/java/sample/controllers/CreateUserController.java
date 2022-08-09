/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.regex.ValidateAnEmail;
import sample.users.UserDAO;
import sample.users.UserDTO;
import sample.users.UserError;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        ValidateAnEmail regex = new ValidateAnEmail();
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String address = request.getParameter("address");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            UserDAO dao = new UserDAO();
            boolean checkValidation = true;
            if (userID.length() < 2 || userID.length() > 10) {
                checkValidation = false;
                userError.setUserIDError("UserID must be in [2,10] <3");
            }
            if (fullName.length() < 3 || fullName.length() > 20) {
                checkValidation = false;
                userError.setFullNameError("FullName must be in [3,20]!!!");
            }
            if (address.isEmpty()) {
                checkValidation = false;
                userError.setAddressError("Address must be in [3,20]!!!");
            }        
            if (birthday.length() < 2 || birthday.length() > 10) {
                checkValidation = false;
                userError.setBirthDayError("Birthday must be in [2,10]!!!");
            }
            if (phone.length() < 10) {
                checkValidation = false;
                userError.setPhoneError("Address must equal 10 number!!!");
            }
            if(regex.valEmail(email)==false){
                  checkValidation = false;
                  userError.setEmailError("Email need to type format Ex:ThanhTran@gmail.com");
            }
            if(!password.equals(confirm)){
                checkValidation = false;
                userError.setConfirmError("Two passwords are not the same!!");
            }
            if(checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, address, password, birthday, phone, email);
                boolean checkCreate = dao.create(user);
                if(checkCreate){
                    url = SUCCESS;
                }
            }else {
                request.setAttribute("USER_ERROR", userError); 
            }
        } catch (Exception e) {
            if(e.toString().contains("duplicate")){
                userError.setUserIDError("The duplicate UserID Please type again!!");
                request.setAttribute("USER_ERROR", userError);
            }
            log("Error at CreateUserController: " + e.toString());
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

}
