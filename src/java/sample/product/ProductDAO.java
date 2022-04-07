/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Mai
 */
public class ProductDAO {

    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, productPrice, quantity, categoryID, status, image "
                        + " FROM tblProduct "
                        + " WHERE [productName] like ? AND [status]=1 ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, productPrice, quantity, categoryID, status, image));
                }
            }
        } catch (Exception e) {

            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
        public List<ProductDTO> getListInvalidProduct(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, productPrice, quantity, categoryID, status, image "
                        + " FROM tblProduct "
                        + " WHERE [productName] like ? AND [status]=0 ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, productPrice, quantity, categoryID, status, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public ProductDTO searchByProductID(String ID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, productPrice, quantity, categoryID, status, image "
                        + " FROM tblProduct "
                        + " WHERE productID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1,  ID );
                rs = stm.executeQuery();
                while (rs.next()) {
                //    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    product = new ProductDTO(ID, productName, productPrice, quantity, categoryID, status, image);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;

    }

    public List<ProductDTO> getListAllProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, productPrice, quantity, categoryID, status, image "
                        + "FROM tblProduct "
                        + " WHERE [status]=1 ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, productPrice, quantity, categoryID, status, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListProductV2(String ID) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, productPrice, quantity, categoryID, status, image "
                        + " FROM tblProduct "
                        + " WHERE categoryID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + ID + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double productPrice = rs.getDouble("productPrice");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, productPrice, quantity, categoryID, status, image));
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Category> getListAllCategory() throws SQLException {
        List<Category> listCateID = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT categoryID, categoryName "
                        + " FROM tblCategory ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    listCateID.add(new Category(categoryID, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listCateID;
    }

    public boolean insertProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblProduct(productID, productName, productPrice, quantity, categoryID, status, image)"
                        + " VALUES(?,?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getProductName());
                stm.setDouble(3, product.getProductPrice());
                stm.setInt(4, product.getQuantity());
                stm.setString(5, product.getCategoryID());
                stm.setInt(6, product.getStatus());
                stm.setString(7, product.getImage());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicatePro(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID "
                        + " FROM tblProduct "
                        + " WHERE productID =? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicateProName(String productName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productName "
                        + " FROM tblProduct "
                        + " WHERE productName =? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productName);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateQuantity(ProductDTO pro) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblProduct set quantity=? "
                        + " WHERE productID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, pro.getQuantity());
                stm.setString(2, pro.getProductID());
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean updateProduct(ProductDTO pro) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblProduct set productPrice=?, quantity=?,  status=? "
                        + " WHERE productID=? ";
                stm = conn.prepareStatement(sql);
                stm.setDouble(1, pro.getProductPrice());
                stm.setInt(2, pro.getQuantity());
                stm.setInt(3, pro.getStatus());
                stm.setString(4, pro.getProductID());
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
    public boolean deleteProductStatusTrue(String productID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblProduct set status=0 "
                        + " WHERE productID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
    
    public boolean deleteProduct(String productID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE tblProduct "
                        + " WHERE productID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
