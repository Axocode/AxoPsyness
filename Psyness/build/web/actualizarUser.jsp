<%-- 
    Document   : actualizarUser
    Created on : 1 jun 2023, 1:51:54
    Author     : chump
--%>

<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
          request.setCharacterEncoding("UTF-8"); 
          HttpSession sesion = request.getSession();
          if (sesion.getAttribute("SIUser") != null){}
          else{out.print("<script>location.replace('index.jsp');</script>");}
          
          
    String nombre = request.getParameter("nombre");
    String edad = request.getParameter("edad");
    
    InterUsersService usersService = new InterUsersService();
    
    if (nombre.equals(sesion.getAttribute("SIUser"))) {
        boolean actualizacionExitosa = usersService.modificarUsuario( (Integer)sesion.getAttribute("SIUserNum"), nombre, edad);
        if (actualizacionExitosa) {
            %>
        <script>
        alert("Cambiado con exito");
        location.replace('settings-new.jsp');
        </script>
<%      sesion.setAttribute("SIUser", nombre);
        sesion.setAttribute("SIAge", edad);
        }
}else{
    boolean usuarioExistente = usersService.verificarUserExistente(nombre);
    
    if (usuarioExistente) {
%>
        <script>
        alert("Ya existe este nombre de usuario");
        location.replace('settings-new.jsp');
        </script>
<%
    } else {
        boolean actualizacionExitosa = usersService.modificarUsuario( (Integer)sesion.getAttribute("SIUserNum"), nombre, edad);
        
        if (actualizacionExitosa) {
            %>
        <script>
        alert("Cambiado con exito");
        location.replace('settings-new.jsp');
        </script>
<%      sesion.setAttribute("SIUser", nombre);
        sesion.setAttribute("SIAge", edad);
        }
    }}
%>

    </body>
</html>
