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
import org.axocode.dao.InterFlow;
import org.axocode.dao.service.InterFlowService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "SeguidoresServlet", urlPatterns = {"/SeguidoresServlet"})
public class SeguidoresServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
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
        HttpSession sesion = request.getSession();
        
        int FlowSeguidoresID = Integer.parseInt(request.getParameter("id"));
        int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
        String action = request.getParameter("action1");
        
        if (action.equals("seguir")) {
            InterFlowService flower = new InterFlowService();
            InterFlow flow = new InterFlow();
            flow.setFlowSeguidoresID(FlowSeguidoresID);
            flow.setFlowSeguidorID(FlowSeguidorID);
            boolean exist = flower.isUserFollowing(flow);
            if (!exist) { 
                boolean successs = flower.addInterFlow(flow);
                if (successs) {
                    InterUsersService usersService = new InterUsersService();
                    usersService.actSeguidores(FlowSeguidoresID);
                    usersService.actSeguidos(FlowSeguidorID);
                }
            }
        }
        
        if (action.equals("seguirnt")) {
            InterFlowService flower = new InterFlowService();
            InterFlow flow = new InterFlow();
            flow.setFlowSeguidoresID(FlowSeguidoresID);
            flow.setFlowSeguidorID(FlowSeguidorID);
            boolean exist = flower.isUserFollowing(flow);
            if (exist) {
                boolean successs = flower.unfollowUser(flow);
                if (successs) {
                    InterUsersService usersService = new InterUsersService();
                    usersService.actSeguidores(FlowSeguidoresID);
                    usersService.actSeguidos(FlowSeguidorID);
                }
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
