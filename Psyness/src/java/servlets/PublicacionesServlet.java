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
import java.util.Collections;
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
@WebServlet(name = "PublicacionesServlet", urlPatterns = {"/PublicacionesServlet"})
public class PublicacionesServlet extends HttpServlet {

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
                            


                    out.print("<div class=\"card lg:mx-0 uk-animation-slide-bottom-small\" id=\"posts_feed\">");
                    out.print("<div class=\"flex justify-between items-center lg:p-4 p-2.5\" id=\"" + trows.getPubNumId() + "\">");
                    out.print("<div class=\"flex flex-1 items-center space-x-4\">");
                    out.print("<a href=\"profile-new.jsp?id=" + interUsers.getIUserNum() + "\">");
                    out.print("<img src=\"../assets/images/avatars/" + data1 + "\" class=\"bg-gray-200 border border-white rounded-full w-10 h-10\">");
                    out.print("</a>");
                    out.print("<div class=\"flex-1 font-semibold capitalize\">");
                    out.print("<a href=\"profile-new.jsp?id=" + interUsers.getIUserNum() + "\" class=\"text-black dark:text-white\" id=\"name_user_feed\">");
                    out.print(escapedUser+" "+totalPub);
                    out.print(" <span class=\"text-gray-700\">" + horita + "hrs</span>");
                    out.print("</a>");

                    if (trows.getPubDate().equals(fecha12)) {
                        out.print("<div class=\"text-gray-700 flex items-center space-x-2\">hoy <ion-icon name=\"people\"></ion-icon></div>");
                    } else {
                        out.print("<div class=\"text-gray-700 flex items-center space-x-2\">"+trows.getPubDate()+"<ion-icon name=\"people\"></ion-icon></div>");
                    }

                    out.print("</div>");
                    out.print("</div>");
                    out.print("<div>");
                    out.print("<a href=\"\"> <i class=\"icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700\"></i></a>");
                    out.print("<div class=\"bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700\" uk-drop=\"mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small\">");
                    out.print("<ul class=\"space-y-0\">");

                    if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {
                        out.print("<li uk-toggle=\"target: #create-post-modal-edit\" >");
                        out.print("<a href=\"#\" class=\"flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800\">");
                        out.print("<i class=\"uil-edit-alt mr-1\"></i>  Editar publicacion");
                        out.print("</a>");
                        out.print("</li>");
                        out.print("<li>");
                        out.print("<a href=\"#\" class=\"flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800\">");
                        out.print("<i class=\"uil-comment-slash mr-1\"></i>  Desactivar");
                        out.print("</a>");
                        out.print("</li>");
                        out.print("<li>");
                        out.print("<hr class=\"-mx-2 my-2 dark:border-gray-800\">");
                        out.print("</li>");
                    }

                    if (sesion.getAttribute("SIUser").equals(interUsers.getIUser()) || sesion.getAttribute("SIRol").equals("Administrador")) {
                        out.print("<li>");
                        out.print("<a href=\"../zProcesos/eliminarPub.jsp?eliminar=" + trows.getPubNumId() + "&per=" + interUsers.getIUserNum() + "&direct=0\" class=\"flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600\">");
                        out.print("<i class=\"uil-trash-alt mr-1\"></i>  Eliminar");
                        out.print("</a>");
                        out.print("</li>");
                    }

                    if (!sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {
                        out.print("<li>");
                        out.print("<a href=\"#\" class=\"flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600\">");
                        out.print("<i class=\"icon-feather-alert-circle mr-1\"></i>  Reportar");
                        out.print("</a>");
                        out.print("</li>");
                    }

                    out.print("</ul>");
                    out.print("</div>");
                    out.print("</div>");
                    out.print("</div>");
                    out.print("<div class=\"p-4 pt-0 border-b dark:border-gray-700\">");
                    out.print("<p class=\"post-text\">" + escapedCont + "</p>");
                    out.print("</div>");
                    out.print("<div class=\"p-4 space-y-3\">");
                    out.print("<div id=\""+trows.getPubNumId()+"\" class=\"flex space-x-4 lg:font-bold\">");

                //-------------------------------------------------------------------------------------------reacciones 
                
                    out.print("</div>");
                    out.print("<div id=\"main-container\" class=\"container-comentarios border-b cursor-pointer py-2\">");
                    out.print("<p class=\"px-4 sm:flex sm:flex-row-reverse hover:text-blue-600\" onclick=\"toggleContainer(" + trows.getPubNumId() + ")\">Ver Comentarios </p>");
                    out.print("<div id=\"inner-container-" + trows.getPubNumId() + "\" class=\"inner-container\">");
                    out.print("<div class=\"border-t py-4 space-y-4 dark:border-gray-600\">");

                InterComentService coment = new InterComentService();
                List<InterComent> comentarios = coment.getInterComentListWithNum(trows.getPubNumId().toString());

                if (comentarios != null && comentarios.size() > 0) {
                    for (InterComent comentarito : comentarios) {

                        InterUsersService servicio = new InterUsersService();
                        InterUsers persona = servicio.getUserByInterUsersNum(comentarito.getComentIUserNum());

                        out.print("<div class=\"flex\">");
                        out.print("<div class=\"w-10 h-10 rounded-full relative flex-shrink-0\">");
                        out.print("<img src=\"../assets/images/avatars/" + persona.getIImgNum() + "\" alt=\"\" class=\"absolute h-full rounded-full\">");
                        out.print("</div>");
                        out.print("<div>");
                        out.print("<div class=\"flex-1 font-semibold capitalize px-4\">");
                        String escapedComentUser = HtmlEscape.escapeHtml(persona.getIUser());
                        out.print("<a href=\"profile-new.jsp?id=" + comentarito.getComentIUserNum() + "\" class=\"text-black dark:text-white\" id=\"name_user_feed\">" + escapedComentUser + "</a>");
                        out.print("</div>");
                        out.print("<div class=\"text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100\">");
                        String escapedComent = HtmlEscape.escapeHtml(comentarito.getComentCont());
                        out.print("<p class=\"leading-6\">" + escapedComent + "</p>");
                        out.print("<div class=\"absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800\"></div>");
                        out.print("</div>");
                        out.print("</div>");
                        out.print("</div>");
                    }
                }

                out.print("</div>");
                out.print("</div>");
                out.print("</div>");

                // Agregar comentario
                out.print("<div id=\"card_posting\">");
                out.print("<div class=\"bg-gray-100 rounded-full relative dark:bg-gray-800 border-t\">");
                out.print("<div onclick=\"location.href='feed-new.jsp?coment=" + trows.getPubNumId() + "#"+ trows.getPubNumId() + "'\" class=\"bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full\" style=\"display: flex; align-items: center; color: #b0b0b0; height: 40px; border: none; font-size: 15px;\">Agregar comentario</div>");
                out.print("</div>");
                out.print("</div>");
                out.print("</div>");
                out.print("</div>");                 
                out.print("</div>");
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
