<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="../css/maincss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <title>Psyness</title>
        <link rel="icon" type="image/jpg" href="../images/favicon.jpg"/>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String guardar = request.getParameter("guardar");
            if ( "Submit".equals( guardar )) {
                    
            
        InterUsersService inter = new InterUsersService();
        boolean verif = inter.validarCredenciales(request.getParameter("IUser"), request.getParameter("IPassword"));

        if (verif) {
             String NombreUsuario = request.getParameter("IUser");
             InterUsers user = inter.getUserByInterUsers(request.getParameter("IUser"));

             
             if (user != null) {
             
            Integer SIUserNum = user.getIUserNum();
            Integer SISeguidores = user.getIUserSeguidores();
            Integer SISeguidos = user.getIUserSeguidos();
            String SIRol = user.getIRol();
            int SIAge = user.getIAge();
            String SIEmail = user.getIEmail();
            String SIPassword = user.getIPassword();
            String SIImgNum = user.getIImgNum();
            String SIUserDescription = user.getIUserDescription();
                    
                    sesion.setAttribute("SISeguidores", SISeguidores);
                    sesion.setAttribute("SISeguidos", SISeguidos);
                    sesion.setAttribute("SIUserNum", SIUserNum);
                    sesion.setAttribute("SIUser", NombreUsuario);
                    sesion.setAttribute("SIRol", SIRol);
                    sesion.setAttribute("SIAge", SIAge);
                    sesion.setAttribute("SIEmail", SIEmail);
                    sesion.setAttribute("SIPassword", SIPassword);
                    sesion.setAttribute("SIImgNum", SIImgNum);
                    sesion.setAttribute("SILastPub",null);
                    sesion.setAttribute("SIUserDescription", SIUserDescription);

            response.sendRedirect("../zSocial/feed-new.jsp");
            

            
        }} else {
%>
                        <script>
                            alert("Contraseña o Correo incorrecto");
                        </script>
<%               
        }
        }
        %>
        <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-md-6 side-image">
                    <!-------Image-------->
                    <img src="../images/Icono.svg" alt="">
                    <div class="text">
                        <p>Unete a la comunidad de Psyness<i> -Axocode</i></p>
                    </div>
                </div>
                <div class="col-md-6 right">
                     <div class="input-box">
                        <header>Iniciar Sesion</header>
                        <form id="form2" onsubmit="doCommit()" >
                            <div class="input-field">
                                <input id="IUser" name="IUser" value="<%= request.getParameter("IUser") %>" type="text" class="input" required />
                                <label for="correoi">Nombre</label>
                            </div>
                            <div class="input-field">
                                <input id="IPassword" name="IPassword" value="<%= request.getParameter("IPassword") %>" type="password" class="input" required /> 
                                <label for="passi">Contraseña</label>
                            </div>
                            <div class="input-field">
                                <input class="submit" type="hidden" id="guardar" name="guardar" value="Submit" />
                                <input class="submit" type="submit" id="guardadito" name="guardar" value="Submit" />
                            </div>
                            <div class="signin">
                                <span>No tienes una cuenta? <a href="../index.jsp">Crear cuenta</a></span>
                            </div>
                        </form>
                     </div>
                </div>
            </div>
        </div>
    </div>
                    <script>
                    document.getElementsByTagName("input")[0].value = "";
                    document.getElementsByTagName("input")[1].value = "";
                    </script>
                    <script>
                        function doCommit() {
                          document.getElementById("guardadito").disabled = true;
                        }
                    </script>
    </body>
</html>
