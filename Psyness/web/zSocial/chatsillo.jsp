<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : chatsillo.jsp
    Created on : 10 dic 2023, 17:04:11
    Author     : BD1
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        //PROTECCION

        HttpSession sesion = request.getSession();
        Integer id_usuario = (Integer) sesion.getAttribute("SIUserNum");
        String nom_usuario = (String) session.getAttribute("SIUser");
        String com_usuario = nom_usuario;

        String accion = request.getParameter("a");
        
    %>

    <body>
        
        <%
            if (accion != null) {
                if ("chat".equals(accion)) {
                    String id_rem = request.getParameter("i");
                    String nom_rem = request.getParameter("n");
        %>
        
        <h1>Chat de <%=com_usuario%></h1>
        <h2>con <%=nom_rem%></h2>

        
        <div id="output"></div>

        <input id="username_to" type="text" value="<%=id_rem%>" hidden>
        <input id="nom_to" type="text" value="<%=nom_rem%>" hidden>
        <input id="message_in" type="text">
        <input id="username_in" typse="text" value="<%=id_usuario%>" hidden>
        <input id="nom_in" type="text" value="<%=com_usuario%>" hidden>
        <button onclick="send()">Enviar</button>

        <script src="../assets/websocket.js"></script>
        
        
        <%
                }
            }
        %>
    </body>
</html>
