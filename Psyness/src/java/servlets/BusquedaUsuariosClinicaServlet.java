/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "BusquedaUsuariosClinicaServlet", urlPatterns = {"/BusquedaUsuariosClinicaServlet"})
public class BusquedaUsuariosClinicaServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        response.setContentType("text/html;charset=UTF-8");

        String searchTerm = request.getParameter("teerm"); // Asegúrate de corregir "teerm" a "term" si fue un error tipográfico.
        InterUsersService service = new InterUsersService();
        List<InterUsers> users = service.getInterUsersListByTerm(searchTerm);

        try (PrintWriter out = response.getWriter()) {
            if (users != null && !users.isEmpty()) {
                for (InterUsers user : users) {
                    out.println("<li class='flex justify-between gap-x-6 py-5'>");
                    out.println("<div class='flex min-w-0 gap-x-4' id='busquedas_users'>");
                    out.println("<img class='h-12 w-12 flex-none rounded-full bg-gray-50' src='../images/" + user.getIImgNum() + "' alt=''>");
                    out.println("<div class='min-w-0 flex-auto'>");
                    out.println("<p class='text-sm font-semibold leading-6 text-gray-900' id='texto_busqeuda_user'>" + user.getIUser() + "</p>");
                    out.println("<p class='mt-1 truncate text-xs leading-5 text-gray-500'>" + user.getIAge() + "</p>");
                    out.println("</div></div>");
                    out.println("<div class='select-menusito'>");
                    out.println("<form id='opcion1' accept-charset='UTF-8'>");
                    out.println("<select id='miSelect' class='select-menu'>");
                    out.println("<option id='opnada' value='opcion1'>Selecciona</option>");
                    out.println("<option id='oppacien' value='opcion2'>Paciente</option>");
                    out.println("<option id='oppsi' value='opcion3'>Psicologo</option>");
                    out.println("</select>");
                    out.println("<button type='submit' class='boton-select-menusito'>Dar de Alta</button>");
                    out.println("</form></div></li>");
                }
            } else {
                // Mensaje de no resultados encontrados
                out.println("<p>No se encontraron usuarios.</p>");
            }
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
