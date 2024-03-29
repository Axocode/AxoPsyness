<%@ page import="org.axocode.dao.service.InterUsersService" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8" %>
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

    String nombre = request.getParameter("nombre");
    String edad = request.getParameter("edad");
    String descripcion = request.getParameter("descripcion");

    InterUsersService usersService = new InterUsersService();

    if (nombre.equals(sesion.getAttribute("SIUser"))) {
        boolean actualizacionExitosa = usersService.modificarUsuario((Integer) sesion.getAttribute("SIUserNum"), nombre, edad, descripcion);
        if (actualizacionExitosa) {
%>
            <script>
                alert("Cambiado con éxito");
                location.replace('../zSocial/settings-new.jsp');
            </script>
<%
            sesion.setAttribute("SIUser", nombre);
            sesion.setAttribute("SIAge", edad);
            sesion.setAttribute("SIUserDescription", descripcion);
        }
    } else {
        boolean usuarioExistente = usersService.verificarUserExistente(nombre);

        if (usuarioExistente) {
%>
            <script>
                alert("Ya existe este nombre de usuario");
                location.replace('../zSocial/settings-new.jsp');
            </script>
<%
        } else {
            boolean actualizacionExitosa = usersService.modificarUsuario((Integer) sesion.getAttribute("SIUserNum"), nombre, edad, descripcion);

            if (actualizacionExitosa) {
%>
                <script>
                    alert("Cambiado con éxito");
                    location.replace('../zSocial/settings-new.jsp');
                </script>
<%
                sesion.setAttribute("SIUser", nombre);
                sesion.setAttribute("SIAge", edad);
                sesion.setAttribute("SIUserDescription", descripcion);
            }
        }
    }
%>

</body>
</html>
