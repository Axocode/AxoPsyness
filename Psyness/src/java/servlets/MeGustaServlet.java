/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.axocode.dao.InterLove;
import org.axocode.dao.service.InterLoveService;
import org.axocode.dao.service.InterPubService;

/**
 *
 * @author chump
 */
@WebServlet(name = "MeGustaServlet", urlPatterns = {"/MeGustaServlet"})
public class MeGustaServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
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

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();

        try {
            int pubInt = Integer.parseInt(request.getParameter("pub"));
            int IUserNum = (Integer) sesion.getAttribute("SIUserNum");
            String action1 = request.getParameter("action1");

            InterLoveService loveService = new InterLoveService();
            InterLove lov = new InterLove();
            lov.setLoveIdPub(pubInt);
            lov.setLoveIdUser(IUserNum);

            InterPubService pubService = new InterPubService();

            if ("Love".equalsIgnoreCase(action1)) {
                boolean exist = loveService.checkIfLoveExists(lov);
                if (!exist) {
                    boolean success = loveService.addInterLove(lov);
                    if (success) {
                        pubService.actLove(pubInt);
                    }
                }
            } else if ("Lovent".equalsIgnoreCase(action1)) {
                boolean exist = loveService.checkIfLoveExists(lov);
                if (exist) {
                    boolean success = loveService.unfollowLove(lov);
                    if (success) {
                        pubService.actLove(pubInt);
                    }
                }
            }
        } catch (NumberFormatException e) {
    // Manejar la excepción si 'pub' no es un número válido
    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    response.getWriter().println("Error: 'pub' no es un número válido.");
} catch (Exception e) {
    // Manejar otras excepciones
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    response.getWriter().println("Error interno del servidor.");
    e.printStackTrace(); // Imprimir la pila de llamadas para el registro del servidor
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
