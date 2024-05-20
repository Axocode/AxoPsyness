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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        
        int FlowSeguidoresID = Integer.parseInt(request.getParameter("id"));
        int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
        String action = request.getParameter("action1");

        InterFlowService flower = new InterFlowService();
        InterFlow flow = new InterFlow();
        flow.setFlowSeguidoresID(FlowSeguidoresID);
        flow.setFlowSeguidorID(FlowSeguidorID);

        try (PrintWriter out = response.getWriter()) {
            if ("seguir".equals(action)) {
                boolean exist = flower.isUserFollowing(flow);
                if (!exist) {
                    boolean successs = flower.addInterFlow(flow);
                    if (successs) {
                        InterUsersService usersService = new InterUsersService();
                        usersService.actSeguidores(FlowSeguidoresID);
                        usersService.actSeguidos(FlowSeguidorID);
                        out.println("<button onclick=\"agregarSeguido(" + FlowSeguidoresID + ", 'seguirnt')\" type=\"submit\" class=\"button bg-blue-700\" style=\"background-color: #DCDCDC; color: black;\">Dejar de Seguir</button>");
                    }
                }
            } else if ("seguirnt".equals(action)) {
                boolean exist = flower.isUserFollowing(flow);
                if (exist) {
                    boolean successs = flower.unfollowUser(flow);
                    if (successs) {
                        InterUsersService usersService = new InterUsersService();
                        usersService.actSeguidores(FlowSeguidoresID);
                        usersService.actSeguidos(FlowSeguidorID);
                        out.println("<button onclick=\"agregarSeguido(" + FlowSeguidoresID + ", 'seguir')\" type=\"submit\" class=\"button bg-blue-700\">Seguir</button>");
                    }
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
