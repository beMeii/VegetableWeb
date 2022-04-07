/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.Cart;
import sample.product.Oder;
import sample.product.OderDAO;
import sample.product.OderDetail;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Mai
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    public static final String LOGIN = "login.jsp";
    public static final String SUCCESS = "checkOut.jsp";
    public static final String HOME = "Home";
    public static final String VIEW = "invoice.jsp";
    public static final String ERROR = "error.jsp";
    public static final String UPDATE = "userUpdate.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Double total = Double.parseDouble(request.getParameter("total"));
            java.util.Date utilDate = new java.util.Date();
            Date oderDate = new java.sql.Date(utilDate.getTime());
            ProductDAO dao = new ProductDAO();
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            // chạy lên sesion Login check có login hay chưa
            if (loginUser == null) {
                url = LOGIN;
            }
            String userID = loginUser.getUserID();
            String email = loginUser.getEmail();
            String address = loginUser.getAddress();
            String phone = loginUser.getPhone();
            if ("".equals(address) || "".equals(phone)) {
                url = UPDATE;
            } else {
                // ---------- CHECK QUANTITY ------------- //  
                boolean checkQuantity = true;
                for (ProductDTO pro : cart.getCart().values()) {
                    int quantity = pro.getQuantity();
                    String productName = pro.getProductName();
                    ProductDTO product1 = dao.searchByProductID(pro.getProductID());
                    int quantityPro = product1.getQuantity();
                    int finalQuantity = quantityPro - quantity;

                    if (finalQuantity < 0) {
                        request.setAttribute("MESSAGE", productName + " only have " + quantityPro + " Add lower than " + quantityPro);
                        url = VIEW;
                        checkQuantity =  false;
                    }
                }
                if (checkQuantity) {
                    // ---------- INSERT ODER -------------//            
                    OderDAO daoOder = new OderDAO();
                    //Xử lý checkout ở đây,
                    // 1 lấy OrderId
                    // ------ insert vô order ----
                    int oderID = daoOder.getMaxOderID() + 1;
                    String statusOderID = "Cash";
                    String paymentStatus = "Completed";
                    Oder newOder = new Oder(oderID, userID, email, address, phone, total, oderDate, statusOderID, paymentStatus);
                    boolean checkOder = daoOder.insertOder(newOder);
                    if (checkOder) {
// ---------- INSERT ODERDETAILS -------------//
                        boolean flag = true;
                        for (ProductDTO pro : cart.getCart().values()) {
                            int detailID = daoOder.getMaxDetailID() + 1;
                            String productID = pro.getProductID();
                            int quantity = pro.getQuantity();
                            double price = pro.getProductPrice();
                            int statusID = pro.getStatus();
                            ProductDTO product1 = dao.searchByProductID(pro.getProductID());
                            int quantityPro = product1.getQuantity();
                            int finalQuantity = quantityPro - quantity;
                            if(finalQuantity==0){
                                statusID = 0;
                            }
                            product1.setQuantity(finalQuantity);
                            boolean updateQuantity = dao.updateQuantity(product1);
                            OderDetail oderDetail1 = new OderDetail(detailID, oderID, productID, quantity, price, statusID);
                            boolean checkOderDetail = daoOder.insertOderDetail(oderDetail1);
                            if (!updateQuantity || !checkOderDetail) {
                                flag = false;
                                break;

                            }
                        }
                        if (flag) {
                            request.setAttribute("CHECKOUT", "CHECK OUT SUCCESSFULLY !");
                            
                            url = SUCCESS;

                        }

                    }
                }

            }

        } catch (Exception e) {
            log("Error at CheckOutController" + e.toString());
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
