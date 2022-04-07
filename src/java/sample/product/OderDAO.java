/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Mai
 */
public class OderDAO {
    public boolean insertOder(Oder oder) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblOrders(orderID, userID, email, address, phone, total, orderDate, statusID, paymentStatus)"
                        + " VALUES(?,?,?,?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, oder.getOderID());
                stm.setString(2, oder.getUserID());
                stm.setString(3, oder.getEmail());
                stm.setString(4, oder.getAddress());
                stm.setString(5, oder.getPhone());
                stm.setDouble(6, oder.getTotal());
                stm.setDate(7, oder.getOderDate());
                stm.setString(8, oder.getStatusID());
                stm.setString(9, oder.getPaymentStatus());
                check = stm.executeUpdate() > 0;
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
        return check;
    }
    public boolean insertOderDetail(OderDetail oder) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblOrderDetail (detailID, orderID, productID, quantity, price, statusID)"
                        + " VALUES(?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, oder.getDetailID());
                stm.setInt(2, oder.getOderID());
                stm.setString(3, oder.getProductID());
                stm.setInt(4, oder.getQuantity());
                stm.setDouble(5, oder.getPrice());
                stm.setInt(6, oder.getStatusID());
                check = stm.executeUpdate() > 0;
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
        return check;
    }
    public int getMaxDetailID() throws SQLException{
        int oderdetail = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!= null){
                String sql = " SELECT MAX(detailID) AS MAXDETAILID "
                        + " FROM tblOrderDetail ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    oderdetail = rs.getInt("MAXDETAILID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return oderdetail;
        
    }
    
    public int getMaxOderID() throws SQLException{
        int oderID = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn!= null){
                String sql = " SELECT MAX(orderID) AS  MAXID " 
                        + " FROM tblOrders "; 
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    oderID = rs.getInt("MAXID"); 
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return oderID; 
        
        
    }
    
}
