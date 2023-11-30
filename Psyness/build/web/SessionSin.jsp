<%-- 
    Document   : registro
    Created on : 19 may 2023, 12:51:17
    Author     : alumno
--%>
<%@page session="true"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.helper.Helpers"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="css/maincss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <title>Psyness</title>
        <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>
        
    </head>
    <body>
       <%
            HttpSession sesion = request.getSession();
            String accion = request.getParameter("accion");
            Helpers helpers = null;
            InterUsers user = null;
            String aux = null;
            boolean flag = false;
            String readonly = null;
            
            
            
            
            
            if( "Nuevo".equals( request.getParameter("accion") ) )
            {
                helpers = new InterUsersHelper( ).addRequest( request );
                if( "Nuevo".equals( accion ) )
                {
                    user = new InterUsers();
                 
                    user.setIUser("");
                    user.setIAge("");
                    user.setIEmail("");
                    user.setIPassword("");
                    user.setIRol("");
                    
                    aux = "Guardar";
                    readonly = "";
                }

                

        %>
        <jsp:include page="createSinCodigo.jsp" >
                    <jsp:param name="IUser" value="<%=user.getIUser()%>" />
                    <jsp:param name="IAge" value="<%=user.getIAge()%>" />
                    <jsp:param name="IEmail" value="<%=user.getIEmail()%>" />
                    <jsp:param name="IPassword" value="<%=user.getIPassword()%>" />
                    <jsp:param name="IRol" value="<%=user.getIRol()%>" />
                    <jsp:param name="accion" value="<%=aux%>" />
                    <jsp:param name="readonly" value="<%=readonly%>" />
                </jsp:include>
        <%
            
            }

            if( "Guardar".equals( accion ))
            {
             InterUsersService usersService = new InterUsersService(); 
            boolean correoExistente = usersService.verificarUserExistente(request.getParameter("IUser"));
                if (correoExistente) {
%>
                        <script>
                            alert("El nombre de usuario ya existe");
                            window.location.href = "Session.jsp?accion=Nuevo"; 
                        </script>
<%                       
                    }else{

                helpers = new InterUsersHelper( ).addRequest( request );
                if( "Guardar".equals( accion ) )
                {
                    flag = helpers.addT( );
                  
                    InterUsersService inter = new InterUsersService();
                    InterUsers userR = inter.getUserByInterUsers(request.getParameter("IUser"));
                    Integer SIUserNum = userR.getIUserNum();
                    String SIRol = userR.getIRol();
                    String SIImgNum = userR.getIImgNum();
                    Integer SISeguidores = userR.getIUserSeguidores();
                    Integer SISeguidos = userR.getIUserSeguidos();
                    String SIUserDescription = userR.getIUserDescription();
                    
            
            
            
            

                    if(flag != false){

                    String SIUser = request.getParameter("IUser");
                    String SIAge = request.getParameter("IAge");
                    String SIEmail = request.getParameter("IEmail");
                    String SIPassword = request.getParameter("IPassword");
                    
                    sesion.setAttribute("SIUserNum", SIUserNum);
                    sesion.setAttribute("SIRol", SIRol);
                    sesion.setAttribute("SISeguidores", SISeguidores);
                    sesion.setAttribute("SISeguidos", SISeguidos);
                    sesion.setAttribute("SIUser", SIUser);
                    sesion.setAttribute("SIAge", SIAge);
                    sesion.setAttribute("SIEmail", SIEmail);
                    sesion.setAttribute("SIPassword", SIPassword);
                    sesion.setAttribute("SIImgNum", SIImgNum);
                    sesion.setAttribute("SILastPub",null);
                    sesion.setAttribute("SIUserDescription", SIUserDescription);
                    response.sendRedirect("feed-new.jsp");
                    }else
                        {
                        
                            sesion.setAttribute("invalido", "creacionInvalida");
                            response.sendRedirect("SessionSin.jsp?accion=Nuevo");
                        } 
                    

                }
                if( flag )
                {
        %>
        
        <%
                }                
            }
            if( accion == null || "list".equals(accion ))
            {
        %>
        <jsp:forward page="createSinCodigo.jsp" />
        <%
            }
            }
        %>
        
    </body>
</html>
