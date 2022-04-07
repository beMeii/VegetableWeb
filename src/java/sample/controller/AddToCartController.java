/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.Cart;
import sample.product.ProductDAO;
import sample.product.ProductDTO;

/**
 *
 * @author Mai
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})

public class AddToCartController extends HttpServlet {

    private static final String SUCCESS = "Home";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int quantityPro = Integer.parseInt(request.getParameter("quantityPro"));
            String categoryID = request.getParameter("categoryID");
            int status = Integer.parseInt(request.getParameter("status"));
            String image = request.getParameter("image");
            int check= quantityPro - quantity;
            if(quantityPro==0){
                request.setAttribute("MESSAGE", "Product is invalid in store. Please choose another one!");
                url=ERROR;
            }else if (check<=0){
                request.setAttribute("MESSAGE", "Your choose is"+ quantity +" too much. We only have "+ quantityPro +" in store");
                url=ERROR;
            }
            ProductDTO product = new ProductDTO(productID, productName, productPrice, quantity, categoryID, status, image);
            Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                } 
                cart.add(product);
                session.setAttribute("CART", cart);
                request.setAttribute("MESSAGE", " You choose " + quantity + " product "+ productName);
                url = SUCCESS;
            
        } catch (Exception e) {
            log("Error at AddToCartController" + e.toString());
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
