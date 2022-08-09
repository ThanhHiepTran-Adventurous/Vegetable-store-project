/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

public class UserDAO {
    private static final String LOGIN = "SELECT fullName,roleID,address,birthday,phone,email FROM tblUsers WHERE userID=? AND password=? ";
    private static final String CREATE_USER = "INSERT INTO tblUsers(userID, fullName, roleID, address, birthday, phone, email, password) VALUES(?,?,?,?,?,?,?,?)";
    private static final String SHOW_PRODUCT_IN_USER = "SELECT productID, productName, price, quantity, categoryID, format(importDate, 'dd-MM-yyyy') as importDate, format(usingDate, 'dd-MM-yyyy') as usingDate, image FROM tblProduct";
    private static final String SHOW_PRODUCT_IN_USERV2 = "SELECT productID, productName, price, quantity, categoryID, importDate, usingDate, image FROM tblProduct WHERE status = N'1' " ;
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");                    
                    user = new UserDTO(userID, fullName, roleID, address, "", birthday, phone, email);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    
     public boolean create(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_USER);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getAddress());
                ptm.setString(5, user.getBirthday());
                ptm.setString(6, user.getPhone());
                ptm.setString(7, user.getEmail());
                ptm.setString(8, user.getPassword());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        }finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

      public List<ProductDTO> getListProductInUser() throws SQLException {

        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_PRODUCT_IN_USERV2);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String status = rs.getString("1");
                    list.add(new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
     
}
