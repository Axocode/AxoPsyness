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
import org.axocode.dao.InterPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterFavService;
import org.axocode.dao.service.InterLoveService;
import org.axocode.dao.service.InterPubService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "ServletPublicacionIndividual", urlPatterns = {"/ServletPublicacionIndividual"})
public class ServletPublicacionIndividual extends HttpServlet {

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
        {
        
        request.setCharacterEncoding("UTF-8");       
        response.setContentType("text/html;charset=UTF-8");
        
        int NumPubToAct = Integer.parseInt(request.getParameter("key2"));
             
          HttpSession sesion = request.getSession();
          

                
        
        InterPubService pubService = new InterPubService();
        InterPub pub;
        pub = pubService.getPubByInterPub(NumPubToAct);
        
                    try (PrintWriter out = response.getWriter()){
                    
                       InterUsersService dao = new InterUsersService();
                       InterUsers interUsers = dao.getInterUsersByPubNumId(NumPubToAct);

                InterLoveService lovee = new InterLoveService();
                int LoveID = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                boolean seguirLove = lovee.isUserLove(pub.getPubNumId(), LoveID);
                String numpub = pub.getPubNumId().toString();
                
                                            
                if (seguirLove) {
                    out.println("<form class=\"love-form\" onsubmit=\"enviarAmor('" + numpub + "', 'Lovent'); actualizarPub('" + numpub + "'); return false;\">");
                    out.println("    <button type=\"submit\" class=\"flex items-center space-x-2 love-button\" style=\"color: #787DF1; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                    out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                    out.println("            <span style=\"color: #787DF1;\">" + pub.getPubMg() + "</span>");
                    out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\" style=\"fill: #6B64F4;\">");
                    out.println("                <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>");
                    out.println("            </svg>");
                    out.println("        </div>");
                    out.println("        <div>Amor</div>");
                    out.println("    </button>");
                    out.println("</form>");
                } else {
                    out.println("<form class=\"love-form\" onsubmit=\"enviarAmor('" + numpub + "', 'Love'); actualizarPub('" + numpub + "'); return false;\">");
                    out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" onmouseover=\"handleButtonHover1(this, true)\" onmouseout=\"handleButtonHover1(this, false)\" style=\"color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                    out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                    out.println("            <span>" + pub.getPubMg() + "</span>");
                    out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\">");
                    out.println("                <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>");
                    out.println("            </svg>");
                    out.println("        </div>");
                    out.println("        <div>Amor</div>");
                    out.println("    </button>");
                    out.println("</form>");
                }
                if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                    InterFavService fav = new InterFavService();
                    int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                    boolean seguir = fav.isUserFav(pub.getPubNumId(), FlowSeguidorID);

                    if (seguir) {
                        out.println("<form class=\"fav-form\" onsubmit=\"agregarFav('" + numpub + "', 'Favoritont'); actualizarPub('" + numpub + "'); return false;\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" style=\"color: #F6CE2F; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <span style=\"color: #F6CE2F;\">" + pub.getPubFavs()+ "</span>");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\" style=\"fill: #F6CE2F;\">");
                        out.println("                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.810l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.810h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>Favorito</div>");
                        out.println("    </button>");
                        out.println("</form>");
                    } else {
                        out.println("<form class=\"fav-form\" onsubmit=\"agregarFav('" + numpub + "', 'Favorito'); actualizarPub('" + numpub + "'); return false;\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" onmouseover=\"handleButtonHover(this, true)\" onmouseout=\"handleButtonHover(this, false)\" style=\"color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <span>" + pub.getPubFavs()+ "</span>");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\">");
                        out.println("                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>Favorito</div>");
                        out.println("    </button>");
                        out.println("</form>");
                    }
                }    
                
                        out.println("<button onclick=\"openModal()\" class=\"flex items-center space-x-2 flex-1 justify-end\" style=\"color: #99D1FF; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <span style=\"color: #99D1FF;\">" + pub.getPubComent()+ "</span>");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" style=\"fill: #99D1FF;\" class=\"dark:text-gray-100\">");
                        out.println("                <path fill-rule=\"evenodd\" d=\"M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z\" clip-rule=\"evenodd\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>Opinar</div>");
                        out.println("    </button>");
                
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
