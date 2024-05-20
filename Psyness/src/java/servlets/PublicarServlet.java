/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.axocode.dao.InterPub;
import org.axocode.dao.InterTagPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.InterUsersPub;
import org.axocode.dao.service.InterFavService;
import org.axocode.dao.service.InterLoveService;
import org.axocode.dao.service.InterPubService;
import org.axocode.dao.service.InterTagPubService;
import org.axocode.dao.service.InterUsersPubService;
import org.axocode.dao.service.InterUsersService;
import org.axocode.helper.Helpers;
import org.axocode.helper.InterPubHelper;

/**
 *
 * @author chump
 */
@WebServlet(name = "PublicarServlet", urlPatterns = {"/PublicarServlet"})
public class PublicarServlet extends HttpServlet {

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
        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");          
        HttpSession sesion = request.getSession();
                    
                Helpers helpers;
                boolean flag;
                String guardar = request.getParameter("guardar");
                int PubNumIdefinitivo;
                helpers = new InterPubHelper( ).addRequest( request );
                ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
                ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
                String resultado = "error";
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
                String horaFormateada2 = horaCiudadMexico.format(formatter2);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
            String horaFormateada = horaCiudadMexico.format(formatter);
            
            String[] partes =horaFormateada.split(" ");
            String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
            String hora12 = partes[5]; 
                if(  "Submit".equals( guardar ) ){
                    if (sesion.getAttribute("SILastPub") == null) {
                        sesion.setAttribute("SILastPub", horaCiudadMexico.format(formatter2));
                        flag = helpers.addT( );
                        if (flag) {
                            int IUserNum = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                            InterPubService metododefinitivo = new InterPubService();
                            InterPub objetodefinivo = metododefinitivo.getLastPub();
                            if (objetodefinivo != null && objetodefinivo.getPubNumId() != null) {
                                PubNumIdefinitivo = Integer.parseInt(objetodefinivo.getPubNumId().toString());
                                } else {
                                PubNumIdefinitivo = 1;}
                            
                            InterUsersPub contextInterses = new InterUsersPub();
                            contextInterses.setPubNumId(new InterPub(PubNumIdefinitivo));
                            contextInterses.setiUserNum(new InterUsers(IUserNum));
                            InterUsersPubService interUsersPubService = new InterUsersPubService();
                            if(interUsersPubService.addUsersPub(contextInterses)){
                                    InterTagPub t = new InterTagPub();
                                    InterTagPubService tagService = new InterTagPubService();
                                    String tag1 = request.getParameter("TagPubAutoestima");
                                    String tag2 = request.getParameter("TagPubRelaciones");
                                    String tag3 = request.getParameter("TagPubAnsiedad");
                                    String tag4 = request.getParameter("TagPubDepresion");
                                    String tag5 = request.getParameter("TagPubConflictos");
                                    String tag6 = request.getParameter("TagPubBienestar");
                                    String tag7 = request.getParameter("TagPubCrecimiento");
                                    String tag8 = request.getParameter("TagPubSalud");
                                    String tag9 = request.getParameter("TagPubTranstornos");
                                    String tag10 = request.getParameter("TagPubRecaidas");
                                    String tag11 = request.getParameter("TagPubSueno");
                                    String tag12 = request.getParameter("TagPubSensible");
                                    
                                    t.setTagPub(PubNumIdefinitivo);
                                    t.setTagPubSensible(Integer.parseInt(tag12));
                                    t.setTagPubAutoestima(Integer.parseInt(tag1));
                                    t.setTagPubRelaciones(Integer.parseInt(tag2));
                                    t.setTagPubAnsiedad(Integer.parseInt(tag3));
                                    t.setTagPubDepresion(Integer.parseInt(tag4));
                                    t.setTagPubConflictos(Integer.parseInt(tag5));
                                    t.setTagPubBienestar(Integer.parseInt(tag6));
                                    t.setTagPubCrecimiento(Integer.parseInt(tag7));
                                    t.setTagPubSalud(Integer.parseInt(tag8));
                                    t.setTagPubTranstornos(Integer.parseInt(tag9));
                                    t.setTagPubRecaidas(Integer.parseInt(tag10));
                                    t.setTagPubSueno(Integer.parseInt(tag11));
                                    resultado = objetodefinivo.getPubNumId().toString();
                                    tagService.addInterTagPub(t);
                                }
                            }
                        }else{
                            LocalDateTime horaAct = LocalDateTime.parse(horaFormateada2, formatter2);
                            String horaLastPubliString = (String) sesion.getAttribute("SILastPub");
                            LocalDateTime horaLastPubli = LocalDateTime.parse(horaLastPubliString, formatter2);
                            long totalToAccesss = ChronoUnit.SECONDS.between(horaLastPubli, horaAct);
                            if (totalToAccesss > 10) {
                                sesion.setAttribute("SILastPub", horaCiudadMexico.format(formatter2));
                                flag = helpers.addT( );
                                if (flag) {
                                int IUserNum = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                                InterPubService metododefinitivo = new InterPubService();
                                InterPub objetodefinivo = metododefinitivo.getLastPub();
                                if (objetodefinivo != null && objetodefinivo.getPubNumId() != null) {
                                    PubNumIdefinitivo = Integer.parseInt(objetodefinivo.getPubNumId().toString());
                                    } else {
                                        PubNumIdefinitivo = 1;}

                                        InterUsersPub contextInterses = new InterUsersPub();
                                        contextInterses.setPubNumId(new InterPub(PubNumIdefinitivo));
                                        contextInterses.setiUserNum(new InterUsers(IUserNum));
                                        InterUsersPubService interUsersPubService = new InterUsersPubService();
                                        if(interUsersPubService.addUsersPub(contextInterses)){

                                        InterTagPub t = new InterTagPub();
                                        InterTagPubService tagService = new InterTagPubService();

                                        t.setTagPub(PubNumIdefinitivo);
                                        t.setTagPubSensible(Integer.parseInt(request.getParameter("TagPubSensible")));
                                        t.setTagPubAutoestima(Integer.parseInt(request.getParameter("TagPubAutoestima")));
                                        t.setTagPubRelaciones(Integer.parseInt(request.getParameter("TagPubRelaciones")));
                                        t.setTagPubAnsiedad(Integer.parseInt(request.getParameter("TagPubAnsiedad")));
                                        t.setTagPubDepresion(Integer.parseInt(request.getParameter("TagPubDepresion")));
                                        t.setTagPubConflictos(Integer.parseInt(request.getParameter("TagPubConflictos")));
                                        t.setTagPubBienestar(Integer.parseInt(request.getParameter("TagPubBienestar")));
                                        t.setTagPubCrecimiento(Integer.parseInt(request.getParameter("TagPubCrecimiento")));
                                        t.setTagPubSalud(Integer.parseInt(request.getParameter("TagPubSalud")));
                                        t.setTagPubTranstornos(Integer.parseInt(request.getParameter("TagPubTranstornos")));
                                        t.setTagPubRecaidas(Integer.parseInt(request.getParameter("TagPubRecaidas")));
                                        t.setTagPubSueno(Integer.parseInt(request.getParameter("TagPubSueno")));
                                        resultado = objetodefinivo.getPubNumId().toString();
                                        tagService.addInterTagPub(t);
                                    }
                                }} else {
                                /*
                                
                                AQUI DEBERIA DE IR MODAL DE CULDAUN
                                <script>
                                         var valor = '<%= 10 - totalToAccesss %>';
                                         if (valor === 1) {alert('Espera '+ valor +' segundo volver a publicar');
                                         window.location.href = "feed-new.jsp";}else 
                                         alert('Espera '+ valor +' segundos volver a publicar'); window.location.href = "zd-new.jsp"; 
                                </script>
                                */
                            }
                        }
                    int TotalCiclos2 = Integer.parseInt(request.getParameter("key3"));
                    System.out.println(TotalCiclos2);
                    if (resultado.equals("error")) {
                        try (PrintWriter out = response.getWriter()){
                        out.println("<div hidden id=\"resultadoPublicacion"+(TotalCiclos2+1)+"\">" + resultado + "</div>");
                        }
                    }else 
                    {int IUserNum = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                    InterPubService metododefinitivo = new InterPubService();
                    InterPub trowss = metododefinitivo.getLastPub();
                    int rest = trowss.getPubNumId();
                    InterPub trows =  metododefinitivo.getPubByInterPub(rest);
                    
                    try (PrintWriter out = response.getWriter()){
                    
                       InterUsersService dao = new InterUsersService();
                       InterUsers interUsers = dao.getInterUsersByPubNumId(trows.getPubNumId());

                        if (interUsers != null) {
                        String data1 = interUsers.getIImgNum();

                        if (data1 != null) {}
                            else{data1 = "perfilsidebar.png";}
                        
                            String horita = trows.getPubHour().substring(0, 5);
                            String escapedUser = HtmlEscape.escapeHtml(interUsers.getIUser());
                            String escapedCont = HtmlEscape.escapeHtml((trows.getPubCont()));
                    out.println("<div id=\"hiAxogg" + (TotalCiclos2 + 1) + "\">");
                    out.println("<div hidden id=\"resultadoPublicacion"+(TotalCiclos2+1)+"\">" + resultado + "</div>");
                    out.println("</div>");
                    
                    String numpub = trows.getPubNumId().toString();
                    out.print("<div id=\"publiTotal"+numpub+"\">");
                    out.print("<div class=\"card lg:mx-0 uk-animation-slide-bottom-small\" id=\"posts_feed\">");
                    out.print("<div class=\"flex justify-between items-center lg:p-4 p-2.5\">");
                    out.print("<div class=\"flex flex-1 items-center space-x-4\">");
                    out.print("<a href=\"profile-new.jsp?id=" + interUsers.getIUserNum() + "\">");
                    out.print("<img src=\"../assets/images/avatars/" + data1 + "\" class=\"bg-gray-200 border border-white rounded-full w-10 h-10\">");
                    out.print("</a>");
                    out.print("<div class=\"flex-1 font-semibold capitalize\">");
                    out.print("<a href=\"profile-new.jsp?id=" + interUsers.getIUserNum() + "\" class=\"text-black dark:text-white\" id=\"name_user_feed\">");
                    out.print(escapedUser);
                    out.print("<span class=\"text-gray-700\"> " + horita + "hrs</span>");
                    out.print("</a>");

                    if (trows.getPubDate().equals(fecha12)) {
                        out.print("<div class=\"text-gray-700 flex items-center space-x-2\"> hoy <ion-icon name=\"people\"></ion-icon></div>");
                    } else {
                        out.print("<div class=\"text-gray-700 flex items-center space-x-2\"> "+trows.getPubDate()+"<ion-icon name=\"people\"></ion-icon></div>");
                    }

                    out.print("</div>");
                    out.print("</div>");
                    out.print("<div>");
                    out.print("<a href=\"\"> <i class=\"icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700\"></i></a>");
                    out.print("<div class=\"bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700\" uk-drop=\"mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small\">");
                    out.print("<ul class=\"space-y-0\">");

                    if (sesion.getAttribute("SIUser").equals(interUsers.getIUser()) || sesion.getAttribute("SIRol").equals("Administrador")) {
                        out.print("<li>");
                        out.print("<button onclick=\"eliminarPub(" + trows.getPubNumId() + ", " + interUsers.getIUserNum() + ", 0)\" class=\"flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600\">");
                        out.print("<i class=\"uil-trash-alt mr-1\"></i> Eliminar");
                        out.print("</button>");
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
                    out.print("<div id=\"pub"+numpub+"\" class=\"flex space-x-4 lg:font-bold\">");

                InterLoveService lovee = new InterLoveService();
                int LoveID = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                boolean seguirLove = lovee.isUserLove(trows.getPubNumId(), LoveID);
                
                if (seguirLove) {
                    out.println("<form class=\"love-form\" onsubmit=\"enviarAmor('" + numpub + "', 'Lovent'); actualizarPub('" + numpub + "'); return false;\">");
                    out.println("    <button type=\"submit\" class=\"flex items-center space-x-2 love-button\" style=\"color: #787DF1; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                    out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                    out.println("            <span style=\"color: #787DF1;\">" + trows.getPubMg() + "</span>");
                    out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\" style=\"fill: #787DF1;\">");
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
                    out.println("            <span>" + trows.getPubMg() + "</span>");
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
                    boolean seguir = fav.isUserFav(trows.getPubNumId(), FlowSeguidorID);

                    if (seguir) {
                        out.println("<form class=\"fav-form\" onsubmit=\"agregarFav('" + numpub + "', 'Favoritont'); actualizarPub('" + numpub + "'); return false;\">");
                        out.println("    <button type=\"submit\" class=\"flex items-center space-x-2\" style=\"color: #F6CE2F; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <span style=\"color: #F6CE2F;\">" + trows.getPubFavs()+ "</span>");
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
                        out.println("            <span>" + trows.getPubFavs()+ "</span>");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" class=\"dark:text-gray-100\">");
                        out.println("                <path d=\"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>Favorito</div>");
                        out.println("    </button>");
                        out.println("</form>");
                    }
                }    
                
                        out.println("<button onclick=\"guardarPosicionEnHistorial(); window.location.href='post.jsp?id=" + numpub + "'\" class=\"flex items-center space-x-2 flex-1 justify-end\" style=\"color: #99D1FF; cursor: pointer; background-color: transparent; border: none; outline: none;\">");
                        out.println("        <div class=\"flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600\">");
                        out.println("            <span style=\"color: #99D1FF;\">" + trows.getPubComent()+ "</span>");
                        out.println("            <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\" width=\"22\" height=\"22\" style=\"fill: #99D1FF;\" class=\"dark:text-gray-100\">");
                        out.println("                <path fill-rule=\"evenodd\" d=\"M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z\" clip-rule=\"evenodd\"></path>");
                        out.println("            </svg>");
                        out.println("        </div>");
                        out.println("        <div>Ver</div>");
                        out.println("    </button>");
                        
                    out.print("</div>");


                // Agregar comentario
                out.print("</div>");
                out.print("</div>");                 
                out.print("</div>");
                out.print("</div>");
    }
                    out.println("</div>");
                }
    }}
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
