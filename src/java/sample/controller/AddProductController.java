/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductError;

/**
 *
 * @author Mai
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String SUCCESS = "manageProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            boolean check = true;
            ProductError error = new ProductError();
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (!isMultiPart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(new ServletRequestContext(request));
                } catch (FileUploadException e) {
                    log("AddProductController_FileUploadException " + e.getMessage());
                }

                Iterator iter = items.iterator();
                // Get para pass to control in form (except file)
                Hashtable params = new Hashtable();
                String filename = null;

                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        // Get para pass to control in form (except file)
                        params.put(item.getFieldName(), item.getString());
                    } else {
                        try {
                            // Get name of file, create path and save to image file
                            String itemName = item.getName();
                            filename = itemName.substring(itemName.lastIndexOf("\\") + 1);
                            if (filename.trim().equals("")) {
                                error.setImageError("Image is requied");
                                check = false;
                            } else {
                                if (!filename.contains(".jpg") && !filename.contains(".png")) {
                                    error.setImageError("Invalid extension");
                                    check = false;
                                }
                            }

                            if (check) {
                                String realPath = getServletContext().getRealPath("/");
                                int index = realPath.indexOf("\\build");
                                String buildPath = realPath.substring(0, index) + realPath.substring(index + 6) + "images\\" + filename;
                                File savedFile = new File(buildPath);
                                item.write(savedFile);
                            }

                        } catch (Exception e) {
                            log("AddNewItemServlet_Exception " + e.getMessage());
                        }
                    }
                }
                String productID = (String) params.get("productID");
                String productName = (String) params.get("productName");
                double productPrice = Double.parseDouble((String) params.get("productPrice"));
                int quantity = Integer.parseInt((String) params.get("quantity"));
                String categoryID = (String) params.get(("categoryID"));
                String image = filename;
                ProductDAO dao = new ProductDAO();
                boolean checkProID = dao.checkDuplicatePro(productID);
                boolean checkProName = dao.checkDuplicateProName(productName);
                if (checkProID) {
                    error.setProductIDError("Duplicate ID of product: ");
                    request.setAttribute("PRODUCT_ERROR", error);
                    check = false;
                }
                if (checkProName) {
                    error.setProductNameError("Duplicate Name of product: ");
                    request.setAttribute("PRODUCT_ERROR", error);
                    check = false;
                }
                if (image.trim().equals("")) {
                    error.setImageError("Image is requied");
                    check = false;
                } else {
                    if (!image.contains(".jpg") && !image.contains(".png")) {
                        error.setImageError("Invalid extension");
                        check = false;
                    }
                }
                if (check) {
                    ProductDTO newProduct = new ProductDTO(productID, productName, productPrice, quantity, categoryID, 1, image);
                    boolean checkInsert = dao.insertProduct(newProduct);
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        error.setProductMessage("Cannot insert, unknow error");
                        request.setAttribute("PRODUCT_ERROR", error);
                    }
                } else {
                    request.setAttribute("PRODUCT_ERROR", error);
                }
            }
        } catch (Exception e) {
            log("Error at AddProductController: " + e.toString());
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
