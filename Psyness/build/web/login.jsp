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
        <link rel="stylesheet" href="css/maincss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <title>Psyness</title>
        <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>
        
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
            String SIAge = user.getIAge();
            String SIEmail = user.getIEmail();
            String SIPassword = user.getIPassword();
            String SIImgNum = user.getIImgNum();
                    
                    sesion.setAttribute("SISeguidores", SISeguidores);
                    sesion.setAttribute("SISeguidos", SISeguidos);
                    sesion.setAttribute("SIUserNum", SIUserNum);
                    sesion.setAttribute("SIUser", NombreUsuario);
                    sesion.setAttribute("SIRol", SIRol);
                    sesion.setAttribute("SIAge", SIAge);
                    sesion.setAttribute("SIEmail", SIEmail);
                    sesion.setAttribute("SIPassword", SIPassword);
                    sesion.setAttribute("SIImgNum", SIImgNum);

            response.sendRedirect("feed.jsp");
            

            
        }} else {
%>
                        <script>
                            alert("No existe el usuario");
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
                    <img src="images/Icono.svg" alt="">
                    <div class="text">
                        <p>Unete a la comunidad de Psyness<i> -Axocode</i></p>
                    </div>
                </div>
                <div class="col-md-6 right">
                     <div class="input-box">
                        <header>Iniciar Sesion</header>
                        <form id="form2" >
                            <div class="input-field">
                                <input id="IUser" name="IUser" value="<%= request.getParameter("IUser") %>" type="text" class="input" required />
                                <label for="correoi">Nombre</label>
                            </div>
                            <div class="input-field">
                                <input id="IPassword" name="IPassword" value="<%= request.getParameter("IPassword") %>" type="password" class="input" required /> 
                                <label for="passi">Contraseña</label>
                            </div>
                            <div class="input-field">
                               <input class="submit" type="submit" id="guardar" name="guardar" value="Submit" />
                            </div>
                            <div class="signin">
                                <span>No tienes una cuenta? <a href="index.jsp">Crear cuenta</a></span>
                            </div>
                        </form>
                     </div>
                </div>
            </div>
        </div>
    </div>
                     

                                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                    </symbol>
                                    <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                                      <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                    </symbol>
                                    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                      <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                    </symbol>
                                    </svg>

                                    <div class="alert alert-success d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                        <div>
                                            <h1>Inicio de sesion exitoso(aqui te lleva al home)</h1>

                                        </div>
                                    </div> 
                    <script>
                    document.getElementsByTagName("input")[0].value = "";
                    document.getElementsByTagName("input")[1].value = "";
                    </script>
                    <script>
                        function error(){
                        document.write("Contraseña o Correo incorrecto");
                        }
                    </script>
    </body>
</html>
