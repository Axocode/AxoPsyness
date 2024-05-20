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
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "ServletSeguidosSeguidores", urlPatterns = {"/ServletSeguidosSeguidores"})
public class ServletSeguidosSeguidores extends HttpServlet {

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
            try (PrintWriter out = response.getWriter()) {
                String id = request.getParameter("id");
                InterUsersService userService = new InterUsersService();
                InterUsers user = userService.getUserByInterUsersNum(Integer.parseInt(id));
                int seguidores = user.getIUserSeguidores();
                int seguidos = user.getIUserSeguidos();

                out.println("<ion-icon name=\"home-sharp\" class=\"rounded-full bg-gray-200 text-xl p-1 mr-3\"></ion-icon>");
                out.println("Seguidores: <strong>" + seguidores + "</strong>");
                out.println("<ion-icon name=\"home-sharp\" class=\"rounded-full bg-gray-200 text-xl p-1 mr-3\"></ion-icon>");
                out.println("Seguidos: <strong>" + seguidos + "</strong>");
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
