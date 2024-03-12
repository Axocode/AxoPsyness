/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
import org.axocode.dao.service.InterPubService;
import org.axocode.dao.service.InterTagPubService;
import org.axocode.dao.service.InterUsersPubService;
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
                
                
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
                String horaFormateada2 = horaCiudadMexico.format(formatter2);
                
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
