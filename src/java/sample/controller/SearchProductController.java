/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDTO;

/**
 *
 * @author Mai
 */
@WebServlet(name = "SearchProductController", urlPatterns = {"/SearchProductController"})

public class SearchProductController extends HttpServlet {
    private static final String ERROR= "page.jsp";
    private static final String SUCCESS= "page.jsp";
    private static final String MANAGE= "manageProduct.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {              
            String searchP= request.getParameter("searchP");
            ProductDAO dao = new ProductDAO();           
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || "US".equals(loginUser.getRoleID())) { 
                List<ProductDTO> listP= dao.getListProduct(searchP);
                request.setAttribute("LIST_PRODUCT", listP);
                url=SUCCESS;            
            }
            if ("AD".equals(loginUser.getRoleID())) {  
                int searchStatus = Integer.parseInt(request.getParameter("searchStatus"));
                if(searchStatus == 1){
                    List<ProductDTO> listP= dao.getListProduct(searchP);
                    request.setAttribute("LIST_PRODUCT", listP);
                    url = MANAGE;
                }else if (searchStatus == 0) {
                    List<ProductDTO> listInvalid= dao.getListInvalidProduct(searchP);
                    request.setAttribute("LIST_PRODUCT", listInvalid);
                    url = MANAGE;
                }
                
            }
        } catch (Exception e) {
            log("Error at SearchProductController"+e.toString());
        }finally{
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
