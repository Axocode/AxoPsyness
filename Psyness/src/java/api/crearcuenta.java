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
import javax.servlet.http.HttpSession;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "crearcuenta", urlPatterns = {"/crearcuenta"})
public class crearcuenta extends HttpServlet {

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
        response.setContentType("application/json");
        
            HttpSession sesion = request.getSession();
            ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
            ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
            String horaFormateada = horaCiudadMexico.format(formatter);
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
            String horaFormateada2 = horaCiudadMexico.format(formatter2);
            String[] partes =horaFormateada.split(" ");
            String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
            String hora12 = partes[5];
            
            
        String iuser = request.getParameter("iuser");
        int iage = Integer.parseInt(request.getParameter("iuser"));
        String iemail = request.getParameter("iemail");
        String ipassword = request.getParameter("ipassword");
        String apipassword = request.getParameter("apipassword");
        if (iuser == null || iuser.isEmpty() || ipassword == null || ipassword.isEmpty() || apipassword == null || apipassword.isEmpty() || iage <= 13 || iemail == null || iemail.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        
        try {
            if (apipassword.equals("wawawawaAxolloros")) {
                InterUsers user = new InterUsers();
                InterUsersService userService = new InterUsersService();
                
                user.setIUser(iuser);
                user.setIAge(iage);
                user.setIEmail(iemail);
                user.setIPassword(ipassword);
                user.setIRol("Movil");
                user.setIUserDate(fecha12);
                user.setIUserHour(hora12);
                
                boolean flag = userService.addInterUsers(user);
                
                if (flag) {
                    user = userService.getUserByInterUsers(iuser);
                    
                    Gson gson = new Gson();
                    String json = gson.toJson(user);
                    try (PrintWriter out = response.getWriter()) {
                        out.println(json);
                    }
                }
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
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
