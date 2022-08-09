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

/**
 *
 * @author ADMIN
 */
public class ProductDAO {

    private static final String SEARCH_V2 = "SELECT productID, productName, price, quantity, categoryID, format(importDate, 'yyyy-MM-dd') as importDate, format(usingDate, 'yyyy-MM-dd') as usingDate, image, status FROM tblProduct WHERE productName like ? AND status = N'1' ";
    private static final String SEARCH_V3 = "SELECT productID, productName, price, quantity, categoryID, format(importDate, 'yyyy-MM-dd') as importDate, format(usingDate, 'yyyy-MM-dd') as usingDate, image, status FROM tblProduct WHERE productName like ? AND status = N'1' ";
    private static final String DELETE = "DELETE tblProduct WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProduct SET productName=?, price=?, quantity=?, categoryID=?, importDate=?, usingDate=?, image=? WHERE productID=? ";
    private static final String CREATE_PRODUCT = "INSERT INTO tblProduct(productID, productName, price, quantity, categoryID, importDate, usingDate, image, status) VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String CREATE_PRODUCTV2 = "INSERT INTO tblProduct(productID, productName, price, quantity, categoryID, importDate, usingDate, image) VALUES(?,?,?,?,?,format(CAST(? AS DATE), 'dd/MM/yyyy'),format(CAST(? AS DATE), 'dd/MM/yyyy'),?)";

    //Hàm hiện thị sản phẩm khi search bên ADMIN
    public List<ProductDTO> getListProduct(String search_V2) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_V2);
                ptm.setString(1, "%" + search_V2 + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    float price = Float.parseFloat(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String image = rs.getString("image");
                    String status = "1";                  
                    listProduct.add(new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image,status));
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
        return listProduct;
    }

    // Hiển thị product từ findcontroller của bên phía user hiển thị ra
    public List<ProductDTO> getListProductInUser(String searchPro) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_V3);
                ptm.setString(1, "%" + searchPro + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    float price = Float.parseFloat(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String image = rs.getString("image");
                    String status = "1";
                    listProduct.add(new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image,status));
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
        return listProduct;
    }

    public boolean create(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_PRODUCT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getProductName());
                ptm.setFloat(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());             
                ptm.setString(5, product.getCategoryID());
                ptm.setString(6, product.getImportDate());
                ptm.setString(7, product.getUsingDate());
                ptm.setString(8, product.getImage());
                ptm.setString(9, product.getStatus());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setFloat(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getCategoryID());
                ptm.setString(5, product.getImportDate());
                ptm.setString(6, product.getUsingDate());
                ptm.setString(7, product.getImage());
                ptm.setString(8, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                ptm.close();
            }
        }
        return check;
    }

    

//     public static void main(String[] args) throws SQLException {
//        ProductDAO dao = new ProductDAO();
//        ArrayList<ProductDTO> list = dao.getListProduct();
//        for (ProductDTO productDTO : list) {
//            System.out.println(productDTO);
//        }
//        
//    }
}
