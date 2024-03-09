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
import org.axocode.dao.InterFav;
import org.axocode.dao.service.InterFavService;
import org.axocode.dao.service.InterPubService;

/**
 *
 * @author chump
 */
@WebServlet(name = "FavoritoServlet", urlPatterns = {"/FavoritoServlet"})
public class FavoritoServlet extends HttpServlet {

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
        int pubInt = Integer.parseInt(request.getParameter("pub"));
        int IUserNum = (Integer) sesion.getAttribute("SIUserNum");
        String action = request.getParameter("action1");
        InterPubService verficado = new InterPubService();
        InterPubService pubService = new InterPubService();
        if (action.equals("Favorito")) {

            InterFavService favorite = new InterFavService();
            InterFav fav = new InterFav();
            fav.setFavIdPub(pubInt);
            fav.setFavIdUser(IUserNum); 
            if (!verficado.esPublicacionPropia(IUserNum, pubInt)) {
                boolean exist = favorite.checkIfFavExists(fav);
                if (!exist) {    
                    boolean successs = favorite.addInterFav(fav);
                    if (successs) {
                        pubService.actFav(pubInt);
                    }
                }   
            }
        }
        
        if (action.equals("Favoritont")) {
    
            InterFavService favorite = new InterFavService();
            InterFav fav = new InterFav();
            fav.setFavIdPub(pubInt);
            fav.setFavIdUser(IUserNum);     
            if (!verficado.esPublicacionPropia(IUserNum, pubInt)) {
                boolean exist = favorite.checkIfFavExists(fav);
                if (exist) { 
                    boolean successs = favorite.unfollowFav(fav);
                    if (successs) {
                        pubService.actFav(pubInt);
                    }
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
