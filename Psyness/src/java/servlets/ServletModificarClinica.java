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
import org.axocode.dao.service.InterClinicService;

/**
 *
 * @author chump
 */
@WebServlet(name = "ServletModificarClinica", urlPatterns = {"/ServletModificarClinica"})
public class ServletModificarClinica extends HttpServlet {

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
        HttpSession sesion = request.getSession();   
        int numClinica = Integer.parseInt(request.getParameter("clinicNum"));
        int userNum = Integer.parseInt(request.getParameter("userNum"));
        String userRole = request.getParameter("userRole");
        
        InterClinicService clinicService = new InterClinicService();
        if (numClinica == clinicService.getkClinicNumByUserId(Integer.parseInt(sesion.getAttribute("SIUserNum").toString()))) {            
            boolean cuentaExistente = clinicService.checkIfUserExistsInClinic(userNum);
            if (!cuentaExistente) {
                clinicService.agregarUsuarioClinica(userNum, numClinica, userRole);
            } else if (userRole.equals("Desvinculado")) {
                clinicService.eliminarUsuarioClinica(userNum);
            } else {
                clinicService.modificarUsuarioClinica(userNum, userRole);
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
