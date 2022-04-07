/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mai
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String LOGOUT = "LogoutController";
    private static final String DELETE = "DeleteController";
    private static final String DELETE_PRO = "DeleteProductController";
    private static final String UPDATE = "UpdateController";
    private static final String UPDATE_PRODUCT = "UpdateProductController";
    private static final String CREATE = "CreateController";
    private static final String FB = "LoginFacebookController";
    private static final String SEARCH_PRODUCT = "SearchProductController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String GET_LIST_PRODUCT = "GetListProductController";
    private static final String ADD_PRODUCT = "AddProductController";
    private static final String REMOVE = "DeleteCartController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String CHECK_OUT = "CheckOutController";
    private static final String USER_UPDATE = "UpdateUserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;  
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "AddProduct";
            }
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Delete".equals(action)) {
                url = DELETE;
            } else if ("DeleteP".equals(action)) {
                url = DELETE_PRO;
            } else if ("Update".equals(action)) {
                url = UPDATE;
            } else if ("UpdateP".equals(action)) {
                url = UPDATE_PRODUCT;
            } else if ("Create".equals(action)) {
                url = CREATE;
            } else if ("FB".equals(action)) {
                url = FB;
            } else if ("SearchP".equals(action)) {
                url = SEARCH_PRODUCT;
            } else if ("Add to Cart".equals(action)) {
                url = ADD_TO_CART;
            } else if ("GetListProduct".equals(action)) {
                url = GET_LIST_PRODUCT;
            } else if ("AddProduct".equals(action)) {
                url = ADD_PRODUCT;
            } else if ("Remove".equals(action)) {
                url = REMOVE;
            } else if ("UpdateCart".equals(action)) {
                url = UPDATE_CART;
            } else if ("CheckOut".equals(action)) {
                url = CHECK_OUT;
            } else if ("UpdateUser".equals(action)) {
                url = USER_UPDATE;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("ERRORS", "Fuction is not avaiable");
            }

        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
