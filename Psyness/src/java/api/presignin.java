/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
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
@WebServlet(name = "presignin", urlPatterns = {"/presignin"})
public class presignin extends HttpServlet {
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
        response.setContentType("application/json; charset=UTF-8");

        String iuser = request.getParameter("iuser");
        String iageParam = request.getParameter("iage");
        int iage = 0; // Inicializado a 0 para manejo de control
        String apipassword = request.getParameter("apipassword");

        if (iuser == null || iuser.isEmpty() || apipassword == null || apipassword.isEmpty()) {
            ErrorResponse errorResponse = new ErrorResponse("Valores vacios.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }

        if (iageParam != null && !iageParam.isEmpty()) {
            try {
                iage = Integer.parseInt(iageParam);
            } catch (NumberFormatException e) {
                ErrorResponse errorResponse = new ErrorResponse("Formato de edad invalido.");
                String errorJson = new Gson().toJson(errorResponse);
                response.getWriter().write(errorJson);
                return;
            }
        } else {
            ErrorResponse errorResponse = new ErrorResponse("Edad requerida.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }

        if (iage < 13) {
            ErrorResponse errorResponse = new ErrorResponse("Debes tener 13 años o más para usar Psyness.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }

        if (!apipassword.equals("wawawawaAxolloros")) {
            ErrorResponse errorResponse = new ErrorResponse("Contraseña de API incorrecta.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }

                InterUsers user = new InterUsers();
                InterUsersService userService = new InterUsersService();
                user.setIUser(iuser);
                user.setIAge(iage);

                boolean usuario = userService.verificarUserExistente(iuser);
                
                if (usuario) {
                    ErrorResponse errorResponse = new ErrorResponse("El apodo de usuario ya esta en uso.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
                } else{
                    ErrorResponse errorResponse = new ErrorResponse("Correcto.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
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
