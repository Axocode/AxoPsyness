/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        response.setContentType("application/json; charset=UTF-8");
        
       
        
        String iuser = request.getParameter("iuser");
        String ipassword = request.getParameter("ipassword");
        String apipassword = request.getParameter("apipassword");
        if (iuser == null || iuser.isEmpty() || ipassword == null || ipassword.isEmpty() || apipassword == null || apipassword.isEmpty()) {
            response.setContentType("application/json; charset=UTF-8");
            ErrorResponse errorResponse = new ErrorResponse("Valores vacios.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
        }
        
        try {
            if (apipassword.equals("wawawawaAxolloros")) {
                InterUsers user = new InterUsers();
                InterUsersService userService = new InterUsersService();
                boolean flag = userService.validarCredenciales(iuser, ipassword);
                if (flag) {
                    user = userService.getUserByInterUsers(iuser);
                    
                    Gson gson = new Gson();
                    String json = gson.toJson(user);
                    try (PrintWriter out = response.getWriter()) {
                        out.println(json);
                    }
                } else {
                    ErrorResponse errorResponse = new ErrorResponse("Contraseña o usuario incorrectos.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
                    }
            } else {
                ErrorResponse errorResponse = new ErrorResponse("Error de contraseña de api.");
                String errorJson = new Gson().toJson(errorResponse);
                response.getWriter().write(errorJson);
                }
        } catch (NumberFormatException e) {
            ErrorResponse errorResponse = new ErrorResponse("Formato incorrecto.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
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
