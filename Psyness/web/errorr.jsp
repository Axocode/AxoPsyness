<%-- 
    Document   : errorr
    Created on : 29 dic. 2023, 02:57:41
    Author     : chump
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ page isErrorPage="true" %>

<!-- Página de error que redirige a index.jsp -->
<script>
    
    window.location.replace("../index.jsp")
    
</script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
