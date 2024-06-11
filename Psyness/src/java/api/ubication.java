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
import org.axocode.dao.InterLocation;
import org.axocode.dao.InterTagUsers;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterLocationService;
import org.axocode.dao.service.InterTagUsersService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "ubication", urlPatterns = {"/ubication"})
public class ubication extends HttpServlet {

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
            
        String userId = request.getParameter("userId");
        String userToken = request.getParameter("userToken");
        int userIdInt = Integer.parseInt(userId);
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));
        String apipassword = request.getParameter("apipassword");
        String mensaje = request.getParameter("mensaje");
        
        if (userId == null || userId.isEmpty() || userToken == null || userToken.isEmpty() || apipassword == null || apipassword.isEmpty()) {
            ErrorResponse errorResponse = new ErrorResponse("Valores vacios.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }
        
        try {
            if (apipassword.equals("wawawawaAxolloros")) {
                InterLocation location = new InterLocation();
                InterLocationService locationService = new InterLocationService();
     
                
                location.setLocationUser(userIdInt);
                location.setLocationToken(userToken);
                location.setLocationLatitud(longitude);
                location.setLocationLongitud(longitude);
                if (mensaje != null) {
                    location.setLocationMessage(mensaje);
                }else {location.setLocationMessage("Hola, ¡lindo día!");}
                locationService.updateLocationInDatabase(location);
            } else {
                ErrorResponse errorResponse = new ErrorResponse("Error de api.");
                String errorJson = new Gson().toJson(errorResponse);
                response.getWriter().write(errorJson);
                }
        } catch (NumberFormatException e) {
                ErrorResponse errorResponse = new ErrorResponse("Error al agregar.");
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
