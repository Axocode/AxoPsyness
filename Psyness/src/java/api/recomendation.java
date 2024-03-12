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
import org.axocode.dao.InterTagUsers;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterTagUsersService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "recomendation", urlPatterns = {"/recomendation"})
public class recomendation extends HttpServlet {

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

        // Recibir los datos del formulario enviado desde Android
        String tagUserStr = request.getParameter("User");
        String tagUserSensibleStr = request.getParameter("Sensible");
        String tagUserAutoestimaStr = request.getParameter("Autoestima");
        String tagUserRelacionesStr = request.getParameter("Relaciones");
        String tagUserAnsiedadStr = request.getParameter("Ansiedad");
        String tagUserDepresionStr = request.getParameter("Depresion");
        String tagUserConflictosStr = request.getParameter("Conflictos");
        String tagUserBienestarStr = request.getParameter("Bienestar");
        String tagUserCrecimientoStr = request.getParameter("Crecimiento");
        String tagUserSaludStr = request.getParameter("Salud");
        String tagUserTranstornosStr = request.getParameter("Transtornos");
        String tagUserRecaidasStr = request.getParameter("Recaidas");
        String tagUserSuenoStr = request.getParameter("Sueno");

        // Verificar si algún parámetro es nulo o vacío
        if ( tagUserStr == null || tagUserStr.isEmpty() || 
            tagUserSensibleStr == null || tagUserSensibleStr.isEmpty() || tagUserAutoestimaStr == null || tagUserAutoestimaStr.isEmpty() ||
            tagUserRelacionesStr == null || tagUserRelacionesStr.isEmpty() || tagUserAnsiedadStr == null || tagUserAnsiedadStr.isEmpty() ||
            tagUserDepresionStr == null || tagUserDepresionStr.isEmpty() || tagUserConflictosStr == null || tagUserConflictosStr.isEmpty() ||
            tagUserBienestarStr == null || tagUserBienestarStr.isEmpty() || tagUserCrecimientoStr == null || tagUserCrecimientoStr.isEmpty() ||
            tagUserSaludStr == null || tagUserSaludStr.isEmpty() || tagUserTranstornosStr == null || tagUserTranstornosStr.isEmpty() ||
            tagUserRecaidasStr == null || tagUserRecaidasStr.isEmpty() || tagUserSuenoStr == null || tagUserSuenoStr.isEmpty()) {

            // Responder con un mensaje de error si algún parámetro está vacío
            ErrorResponse errorResponse = new ErrorResponse("Valores vacíos.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            return;
        }

        // Convertir los parámetros de cadena a tipos de datos adecuados
        int tagUser = Integer.parseInt(tagUserStr);
        int tagUserSensible = Integer.parseInt(tagUserSensibleStr);
        int tagUserAutoestima = Integer.parseInt(tagUserAutoestimaStr);
        int tagUserRelaciones = Integer.parseInt(tagUserRelacionesStr);
        int tagUserAnsiedad = Integer.parseInt(tagUserAnsiedadStr);
        int tagUserDepresion = Integer.parseInt(tagUserDepresionStr);
        int tagUserConflictos = Integer.parseInt(tagUserConflictosStr);
        int tagUserBienestar = Integer.parseInt(tagUserBienestarStr);
        int tagUserCrecimiento = Integer.parseInt(tagUserCrecimientoStr);
        int tagUserSalud = Integer.parseInt(tagUserSaludStr);
        int tagUserTranstornos = Integer.parseInt(tagUserTranstornosStr);
        int tagUserRecaidas = Integer.parseInt(tagUserRecaidasStr);
        int tagUserSueno = Integer.parseInt(tagUserSuenoStr);

        // Crear un objeto InterTagUsers con los datos recibidos
        InterTagUsers usuario = new InterTagUsers();
        usuario.setTagUser(tagUser);
        usuario.setTagUserSensible(tagUserSensible);
        usuario.setTagUserAutoestima(tagUserAutoestima);
        usuario.setTagUserRelaciones(tagUserRelaciones);
        usuario.setTagUserAnsiedad(tagUserAnsiedad);
        usuario.setTagUserbDepresion(tagUserDepresion);
        usuario.setTagUserConflictos(tagUserConflictos);
        usuario.setTagUserBienestar(tagUserBienestar);
        usuario.setTagUserCrecimiento(tagUserCrecimiento);
        usuario.setTagUserSalud(tagUserSalud);
        usuario.setTagUserTranstornos(tagUserTranstornos);
        usuario.setTagUserRecaidas(tagUserRecaidas);
        usuario.setTagUserSueno(tagUserSueno);

        InterTagUsersService modificar = new InterTagUsersService();
        boolean success = modificar.modificarTagUsuario(usuario);

        // Responder con el resultado de la operación
        if (success) {
            ErrorResponse successResponse = new ErrorResponse("exitoso");
            String successJson = new Gson().toJson(successResponse);
            response.getWriter().write(successJson);
        } else {
            ErrorResponse errorResponse = new ErrorResponse("error");
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
            throws ServletException, IOException {}


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
