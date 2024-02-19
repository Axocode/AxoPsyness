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
import org.axocode.dao.InterComent;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterComentService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "ServletComentarios", urlPatterns = {"/ServletComentarios"})
public class ServletComentarios extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        int TotalCiclos = Integer.parseInt(request.getParameter("key1"));
        int num = Integer.parseInt(request.getParameter("id"));
        int startIdx = 5;
        int endIdx = 5 * TotalCiclos;
        
        InterComentService comentService = new InterComentService();
                
        List<InterComent> comentarios = comentService.getInterComentListWithNum(num, startIdx, endIdx);
        try (PrintWriter out = response.getWriter()){
            if (comentarios != null && !comentarios.isEmpty()){
                for(InterComent com : comentarios){
                    
                    int id = com.getComentIUserNum();
                    
                    InterUsersService serviceUsers = new InterUsersService();
                    InterUsers us = serviceUsers.getUserByInterUsersNum(id);
                    
                    String data1 = us.getIImgNum();
                    String username = HtmlEscape.escapeHtml(us.getIUser());
                    int numId = us.getIUserNum();
                    String horita = com.getComentHour().substring(0, 5);
                    String fecha = com.getComentDate();
                    String contenido = HtmlEscape.escapeHtml(com.getComentCont());
                    
                    out.println("<div class=\"flex\">");
                    out.println("    <div class=\"w-10 h-10 rounded-full relative flex-shrink-0\">");
                    out.println("        <img src=\"../assets/images/avatars/" + data1 + "\" alt=\"\" class=\"absolute h-full rounded-full w-full\">");
                    out.println("    </div>");
                    out.println("    <div>");
                    out.println("        <div class=\"text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12  dark:bg-gray-800 dark:text-gray-100\">");
                    out.println("            <p class=\"leading-6\">"+ contenido +"<urna class=\"i uil-heart\"></urna> <i class=\"uil-grin-tongue-wink\"> </i> </p>");
                    out.println("            <div class=\"absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800\"></div>");
                    out.println("        </div>");
                    out.println("        <div class=\"text-sm flex items-center space-x-3 mt-2 ml-5\">");
                    out.println("            <a href=\"profile-new.jsp?id="+numId+"\"> "+ username +" </a>");
                    out.println("            <span>"+ fecha +" "+horita+"</span>");
                    out.println("        </div>");
                    out.println("    </div>");
                    out.println("</div>");                    
                }
                    out.println("<div id=\"comentarios" + (TotalCiclos + 1) + "\">");
                    out.println("</div>");
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
