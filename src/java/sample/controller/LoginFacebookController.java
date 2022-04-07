package sample.controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Mai
 */
@WebServlet(name = "LoginFacebookController", urlPatterns = {"/LoginFacebookController"})

public class LoginFacebookController extends HttpServlet {

    public class UserData {

        private String id;
        private String email;
        private String name;

        public String getID() {
            return id;
        }

        public void setID(String id) {
            this.id = id;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String token = (String) request.getParameter("token");

        String facebookApiUrl = "https://graph.facebook.com/v12.0/me?access_token=" + token + "&fields=email,name";
        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(facebookApiUrl);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("HTTP GET Request Failed with Error code : "
                        + conn.getResponseCode());
            }
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String output = null;
            while ((output = reader.readLine()) != null) {
                strBuf.append(output).append("\n");
            }
            UserData userData = new Gson().fromJson(strBuf.toString(), UserData.class);
            String userID = userData.getID();
            String email = userData.getEmail();
            String fullName = userData.getName();
            String roleID = "US";
            String phone = "";
            String address = "";
            String password = "";

            UserDTO newUser = new UserDTO(userID, fullName, roleID, phone, address, password, email);
            UserDAO dao = new UserDAO();
            HttpSession session = request.getSession();
            UserDTO user = dao.checkLogin(userID, password);
            if (user == null) { 
                boolean check = dao.insert(newUser);
                if(check){
                    user = newUser;
                }                
            }
            session.setAttribute("LOGIN_USER", user);
            request.getRequestDispatcher("Home").forward(request, response);  
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(LoginFacebookController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                conn.disconnect();
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginFacebookController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginFacebookController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
