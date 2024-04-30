/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.axocode.dao.InterPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterPubService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "feed", urlPatterns = {"/feed"})
public class feed extends HttpServlet {

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
         request.setCharacterEncoding("UTF-8");  
        String numeroCiclo = request.getParameter("ciclo"); 
        String apipassword = request.getParameter("apipassword");
        
        if ( apipassword == null || apipassword.isEmpty() || numeroCiclo == null ) {
            response.setContentType("application/json; charset=UTF-8");
            ErrorResponse errorResponse = new ErrorResponse("Valores vacios.");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
        }
        try {
            if (apipassword.equals("Gael")) {
                int num = Integer.parseInt(numeroCiclo);
                InterPubService pubService = new InterPubService();
                List<InterPub> pub = pubService.getInterPubList(5, 5*num);
                if (pub != null) {
                    List<Map<String, Object>> enrichedPubs = new ArrayList<>();
                    for (int i = 0; i < pub.size(); i++) {
                        Map<String, Object> pubData = new HashMap<>();
                        InterPub pubs = pub.get(i);
                        InterUsers user = new InterUsers();
                        InterUsersService userService = new InterUsersService();
                        user = userService.getInterUsersByPubNumId(pub.get(i).getPubNumId());

                        pubData.put("PubNumId", pub.get(i).getPubNumId());
                        pubData.put("PubCont", pub.get(i).getPubCont());
                        pubData.put("PubDate", pub.get(i).getPubDate());
                        pubData.put("PubHour", pub.get(i).getPubHour());

                        // Agregar datos de la persona
                        pubData.put("IUser", user.getIUser());
                        pubData.put("IUserNum", user.getIUserNum());
                        pubData.put("IImgNum", user.getIImgNum());

                        enrichedPubs.add(pubData);
                    }
                    Gson gson = new Gson();
                        String json = gson.toJson(enrichedPubs);
                        try (PrintWriter out = response.getWriter()) {
                            out.println(json);
                        }
            }
            
        }else {
            ErrorResponse errorResponse = new ErrorResponse("Contraseña incorrecta");
            String errorJson = new Gson().toJson(errorResponse);
            response.getWriter().write(errorJson);
            }}  catch (NumberFormatException e) {
            ErrorResponse errorResponse = new ErrorResponse("Formato incorrecto.");
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