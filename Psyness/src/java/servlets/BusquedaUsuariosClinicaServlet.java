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
import javax.servlet.http.HttpSession;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterClinicService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "BusquedaUsuariosClinicaServlet", urlPatterns = {"/BusquedaUsuariosClinicaServlet"})
public class BusquedaUsuariosClinicaServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();    
        int numero = 0;
        String searchTerm = request.getParameter("teerm");
        InterUsersService service = new InterUsersService();
        List<InterUsers> users = service.getInterUsersListByTerm(searchTerm);
        InterClinicService clinicService = new InterClinicService();
        int numeroClinica = clinicService.getkClinicNumByUserId(1);

        try (PrintWriter out = response.getWriter()) {
            if (users != null && !users.isEmpty()) {
                for (InterUsers user : users) {
                    if (!user.getIUserNum().equals(sesion.getAttribute("SIUserNum"))) {
                        numero++;
                        String selectId = "miSelect" + numero;
                        String botonId = "submitButton" + numero;
                        String resultado = clinicService.checkUserRol(user.getIUserNum(), numeroClinica);
                        String paciente = null;
                        String clinica = null;
                        String nulo = "selected"; 
                        if (resultado != null) {
                            if (resultado.equals("Paciente")) {
                                paciente = "selected";
                                nulo = null;
                            } else if (resultado.equals("Psicologo")) {
                                clinica = "selected";
                                nulo = null;
                            } 
                        }
                        
                        
                        out.println("<li class='flex justify-between gap-x-6 py-5'>");
                        out.println("<div class='flex min-w-0 gap-x-4' id='busquedas_users'>");
                        out.println("<img class='h-12 w-12 flex-none rounded-full bg-gray-50' src='../images/" + user.getIImgNum() + "' alt=''>");
                        out.println("<div class='min-w-0 flex-auto'>");
                        out.println("<p class='text-sm font-semibold leading-6 text-gray-900' id='texto_busqueda_user'>" + user.getIUser() + "</p>");
                        out.println("<p class='mt-1 truncate text-xs leading-5 text-gray-500'>" + user.getIAge() + "</p>");
                        out.println("</div></div>");
                        out.println("<div class='select-menusito'>");

                        // Asegúrate de que este formulario apunte a tu servlet o endpoint correcto
                        out.println("<form id='opcion1' accept-charset='UTF-8' >");

                        // Campo oculto para el número de clínica
                        out.println("<input type='hidden' name='clinicNum' value='" + numeroClinica + "'>");

                        // Campo oculto para el número de usuario
                        out.println("<input type='hidden' name='userNum' value='" + user.getIUserNum() + "'>");

                        out.println("<select id='" + selectId + "' name='userRole' class='select-menu'>");
                        out.println("<option id='opnada' value='Desvinculado'" + nulo + ">Desvinculado</option>");
                        out.println("<option id='oppacien' value='Paciente'" + paciente + ">Paciente</option>");
                        out.println("<option id='oppsi' value='Psicologo'" + clinica + ">Psicologo</option>");
                        out.println("</select>");
                        String textoBoton = (paciente != null || clinica != null) ? "Modificar rol" : "Dar de Alta";
                        out.println("<button type='button' onclick='enviarDatos(" + numeroClinica + ", " + user.getIUserNum() + ", " + numero + ")' id='submitButton" + numero + "' class='submitButton boton-select-menusito'>" + textoBoton + "</button>");
                        out.println("</form></div></li>");
                    }
                }
            } else {
                out.println("<p>No se encontraron usuarios.</p>");
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
