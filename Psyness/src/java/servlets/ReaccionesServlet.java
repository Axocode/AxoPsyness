/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.axocode.dao.InterComent;
import org.axocode.dao.InterPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterComentService;
import org.axocode.dao.service.InterFavService;
import org.axocode.dao.service.InterFlowService;
import org.axocode.dao.service.InterLoveService;
import org.axocode.dao.service.InterPubService;
import org.axocode.dao.service.InterUsersService;
import org.axocode.helper.Helpers;
import org.axocode.helper.InterComentHelper;
import org.axocode.helper.InterPubHelper;
import org.axocode.helper.InterUsersHelper;

/**
 *
 * @author chump
 */
@WebServlet(name = "ReaccionesServlet", urlPatterns = {"/ReaccionesServlet"})
public class ReaccionesServlet extends HttpServlet {

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
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        
        
        request.setCharacterEncoding("UTF-8");          
          HttpSession sesion = request.getSession();
          
                String data = (String) sesion.getAttribute("SIImgNum");
                Helpers helpers = null;
                Helpers helperss = null;
                InterPub user = null;
                
                
                int seguidores = 0;
                int seguidos = 0;
                int PubNumIdefinitivo;
                helpers = new InterPubHelper( ).addRequest( request );
                helperss = new InterComentHelper( ).addRequest( request );
                ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
                ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
                String horaFormateada = horaCiudadMexico.format(formatter);
                
                
                
                user = new InterPub(); 
                user.setPubCont(""); 
                InterUsersHelper userHelper = new InterUsersHelper();
        List<InterUsers>listita = userHelper.getListT();
        
                    if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           InterUsersService dao = new InterUsersService();
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
            
           if ((sesion.getAttribute("SIUserNum").toString()).equals(interUsers.getIUserNum().toString())) {
            
            seguidores = interUsers.getIUserSeguidores();
            seguidos = interUsers.getIUserSeguidos();
                
            
    }}}}
                           
                                        String[] partes =horaFormateada.split(" ");
                                        String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                                        String hora12 = partes[5];
        
        
        
        
        InterPubService pubService = new InterPubService();
        int totalPub = pubService.getTotalPub();
        int TotalCiclos = Integer.parseInt(request.getParameter("key1"));

        int startIdx = 5 + (5* TotalCiclos);
        
        

        List<InterPub> list = pubService.getInterPubList(startIdx);
                    int Cantidad = 0;
                    int tamano = list.size();
                    
                    try (PrintWriter out = response.getWriter()){
                    if( list != null && list.size() > 0)
                    {
                    for(InterPub trows : list)
                    {       
                       Cantidad++;
                       InterUsersService dao = new InterUsersService();
                       InterUsers interUsers = dao.getInterUsersByPubNumId(trows.getPubNumId());

                        if (interUsers != null) {
                        String data1 = interUsers.getIImgNum();

                        if (data1 != null) {}
                            else{data1 = "perfilsidebar.png";}
                        
                            String horita = trows.getPubHour().substring(0, 5);
                            String escapedUser = HtmlEscape.escapeHtml(interUsers.getIUser());
                            String escapedCont = HtmlEscape.escapeHtml((trows.getPubCont()));
                            


                InterLoveService lovee = new InterLoveService();
                int LoveID = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                boolean seguirLove = lovee.isUserLove(trows.getPubNumId(), LoveID);
                String numpub = trows.getPubNumId().toString();
                                            String numid = interUsers.getIUserNum().toString();

                if (seguirLove) {
                    out.println("<form class=\"love-form\" action=\"/Psyness/MeGustaServlet\" method=\"get\" data-pub=\"" + trows.getPubNumId() + "\" onsubmit=\"return enviarAmor('" + numpub + "', 'Lovent');\">");
                    out.println("    <button type=\"submit\" class=\"flex items-center space-x-2 love-button\" style=\"color: #6B64F4; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                    out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                    out.println("            <span style=\"color: #6B64F4;\">" + trows.getPubMg() + "</span>");
                    out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\" style=\"fill: #6B64F4;\">");
                    out.println("                <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>");
                    out.println("            </svg>");
                    out.println("        </div>");
                    out.println("        <div> - Amor</div>");
                    out.println("    </button>");
                    out.println("</form>");
                } else {
                    out.println("<form class=\"love-form\" action=\"/Psyness/MeGustaServlet\" method=\"get\" data-pub=\"" + trows.getPubNumId() + "\" onsubmit=\"return enviarAmor('" + numpub + "', 'Love');\">");
                    out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" onmouseover=\"handleButtonHover1(this, true)\" onmouseout=\"handleButtonHover1(this, false)\" style=\"color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                    out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                    out.println("            <span>" + trows.getPubMg() + "</span>");
                    out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\">");
                    out.println("                <path fill-rule=\"evenodd\" d=\"M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z\" clip-rule=\"evenodd\"></path>");
                    out.println("            </svg>");
                    out.println("        </div>");
                    out.println("        <div> + Amor</div>");
                    out.println("    </button>");
                    out.println("</form>");
                }
                if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                    InterFavService fav = new InterFavService();
                    int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                    boolean seguir = fav.isUserFav(trows.getPubNumId(), FlowSeguidorID);

                    if (seguir) {
                        out.println("<form class=\"fav-form\" action=\"/Psyness/FavoritoServlet\" method=\"get\" data-pub=\"" + trows.getPubNumId() + "\" onsubmit=\"return agregarFav('" + numpub + "', 'Favoritont');\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" style=\"color: #F6CE2F; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\" style=\"fill: #F6CE2F;\">");
                        out.println("                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.810l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.810h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>- Favorito</div>");
                        out.println("    </button>");
                        out.println("</form>");
                    } else {
                        out.println("<form class=\"fav-form\" action=\"/Psyness/FavoritoServlet\" method=\"get\" data-pub=\"" + trows.getPubNumId() + "\" onsubmit=\"return agregarFav('" + numpub + "', 'Favorito');\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" onmouseover=\"handleButtonHover(this, true)\" onmouseout=\"handleButtonHover(this, false)\" style=\"color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\">");
                        out.println("                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>+ Favorito</div>");
                        out.println("    </button>");
                        out.println("</form>");
                    }
                }
      
                if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                    InterFlowService flowww = new InterFlowService();
                    int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                    boolean seguir = flowww.isUserFollowing(interUsers.getIUserNum(), FlowSeguidorID);

                    if (seguir) {
                        out.println("<form class=\"follow-form\" action=\"/Psyness/SeguidoresServlet\" method=\"get\" data-pub=\"" + interUsers.getIUserNum() + "\" onsubmit=\"return agregarSeguido('" + numid + "', 'seguirnt');\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2 flex-1 justify-end\" style=\"color: #EB74DB; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" style=\"fill: #EB74DB;\" class=\"dark:text-gray-100\">");
                        out.println("                <path fill-rule=\"evenodd\" d=\"M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z\" clip-rule=\"evenodd\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div> - Seguir </div>");
                        out.println("    </button>");
                        out.println("</form>");
                    } else {
                        out.println("<form class=\"follow-form\" action=\"/Psyness/SeguidoresServlet\" method=\"get\" data-pub=\"" + interUsers.getIUserNum() + "\" onsubmit=\"return agregarSeguido('" + numid + "', 'seguir');\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2 flex-1 justify-end\" onmouseover=\"handleButtonHover2(this, true)\" onmouseout=\"handleButtonHover2(this, false)\" style=\"color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\">");
                        out.println("                <path fill-rule=\"evenodd\" d=\"M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z\" clip-rule=\"evenodd\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div> + Seguir </div>");
                        out.println("    </button>");
                        out.println("</form>");
                    }
                }
                
                
    }}}}}

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
