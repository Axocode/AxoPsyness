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
@WebServlet(name = "signin", urlPatterns = {"/signin"})
public class signin extends HttpServlet {

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
        int iage;
        if (iageParam != null && !iageParam.isEmpty()) {
            try {
                iage = Integer.parseInt(iageParam);
                if (iage < 13) {
                    ErrorResponse errorResponse = new ErrorResponse("Debes de tener 13 años o más para usar Psyness.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
                }
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
        
        String iemail = request.getParameter("iemail");
        String ipassword = request.getParameter("ipassword");
        String apipassword = request.getParameter("apipassword");
        
        if (iuser == null || iuser.isEmpty() || ipassword == null || ipassword.isEmpty() || apipassword == null || apipassword.isEmpty() || iemail == null || iemail.isEmpty()) {
            ErrorResponse errorResponse = new ErrorResponse("Valores vacios.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }
        
        try {
            if (apipassword.equals("wawawawaAxolloros")) {
                InterUsers user = new InterUsers();
                InterUsersService userService = new InterUsersService();
                
                ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
                ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
                String horaFormateada = horaCiudadMexico.format(formatter);
                String[] partes =horaFormateada.split(" ");
                String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                String hora12 = partes[5];
                
                user.setIUser(iuser);
                user.setIAge(iage);
                user.setIEmail(iemail);
                user.setIPassword(ipassword);
                user.setIRol("Movil");
                user.setIUserDate(fecha12);
                user.setIUserHour(hora12);
                
                boolean correo = userService.verificarCorreoExistente(iemail);
                boolean usuario = userService.verificarUserExistente(iuser);
                
                if (usuario) {
                    ErrorResponse errorResponse = new ErrorResponse("El apodo de usuario ya esta en uso.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
                } else if (correo) {
                    ErrorResponse errorResponse = new ErrorResponse("El correo ya esta en uso.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
                } else {
                
                boolean flag = userService.addInterUsers(user);
                
                if (flag) {
                    
                    user = userService.getUserByInterUsers(iuser);
                    InterTagUsersService tag = new InterTagUsersService();
                    InterTagUsers tagUser = new InterTagUsers();
                    tagUser.setTagUser(user.getIUserNum());
                    tag.addInterTagUsers(tagUser);
                    
                    
                    InterLocation location = new InterLocation();
                    InterLocationService locationService = new InterLocationService();
     
                    
                    String userToken = request.getParameter("userToken");
                    double latitude = Double.parseDouble(request.getParameter("latitude"));
                    double longitude = Double.parseDouble(request.getParameter("longitude"));
                    String mensaje = request.getParameter("mensaje");
                    
                    location.setLocationUser(user.getIUserNum());
                    location.setLocationToken(userToken);
                    location.setLocationLatitud(longitude);
                    location.setLocationLongitud(longitude);
                    if (mensaje != null) {
                        location.setLocationMessage(mensaje);
                    }else {location.setLocationMessage("Hola, ¡lindo día!");}
                    locationService.updateLocationInDatabase(location);

                    Gson gson = new Gson();
                    String json = gson.toJson(user);
                    try (PrintWriter out = response.getWriter()) {
                        out.println(json);
                    }
                } else {
                    ErrorResponse errorResponse = new ErrorResponse("Error al agregar usuario.");
                    String errorJson = new Gson().toJson(errorResponse);
                    response.getWriter().write(errorJson);
                    }}
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
