<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.axocode.dao.service.InterFavService"%>
<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="java.util.Collections"%>
<%@page import="org.axocode.dao.InterPub"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.helper.InterPubHelper"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/settings.css">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        
            <!--BOOTSRAP-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <title>Psyness</title>
        <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>
    </head>
    
    <body>
<%
    HttpSession sesion = request.getSession();
          if (sesion.getAttribute("SIUser") != null){}
          else{out.print("<script>location.replace('index.jsp');</script>");}                        
%>
        <div id="fb-root"></div>
            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v16.0" nonce="RJPKicjE"></script>
            <!-----------------------------------left-sidebar(YORCH)-------------------------------------------------->
        <div class="container" id="container">
        
            <div class="burguer" id="burguer">
                <i class="fas fa-bars" id="btn"></i>    
            </div>
            
            <div class="left_sidebar" id="left_sidebar">
                <div class="logo_content">
                    <div class="img">
                            <!-------Image-------->
                            <img src="images/logosidebar.jpg" width="220"">
                    </div>
                    <div class="img_responsive">
                            <!-------Image-------->
                            <img src="images/favicon.jpg" width="40" id="img_responsive">
                    </div>
                </div>

                <ul class="nav_list">
                    <li>
                        <i class="fas fa-search" id="fa-search"></i>
                        <input type="text" placeholder="Buscar">
                    </li>

                    <li>
                        <a href="feed.jsp">
                            <i class="fa-sharp fa-solid fa-house"></i>
                            <span class="links_name">Inicio</span>
                        </a>
                        <!---<span class="links_name">Inicio</span>---->
                    </li> 

                    <li>
                        <a href="genero.jsp">
                            <i class="fa-solid fa-venus-mars"></i>
                            <span class="links_name">Red de género</span>
                        </a>
                        <!---<span class="links_name">Inicio</span>---->
                    </li> 

                    <li>
                        <a href="datacenter.jsp">
                            <i class="fa-regular fa-file-lines"></i>
                            <span class="links_name">Datacenter</span>
                        </a>
                        <!---<span class="links_name">Inicio</span>---->
                    </li>

                    <li>
                        <a href="settings.jsp">
                            <i class="fas fa-cog"></i>
                            <span class="links_name">Settings</span>
                        </a>
                        <!---<span class="links_name">Inicio</span>---->
                    </li>
                </ul>

                <div class="logout_sesion">
                    <a href="index.jsp?cerrar=true">
                        <span class="texto">Cerrar Sesion</span>
                        <i class="fas fa-sign-out" id="log_out"></i>
                    </a>
                </div>
            </div>
               
                        <!--BURGUER-->
        
        <script>
            
            let btn = document.querySelector("#btn");
            let burguer_div = document.querySelector(".burguer");
            let left_sidebar = document.querySelector(".left_sidebar");
            let searchBtn = document.querySelector(".fa-search");
            
            document.getElementById("btn").addEventListener("click", open_close_menu);
            
            function open_close_menu(){
                    burguer_div.classList.toggle("burguer_move");
                    left_sidebar.classList.toggle("active");
                }
                
            
            window.addEventListener("resize", function(){
                
                if(window.innerWidth > 200){
                    
                    burguer_div.classList.add("burguer_move");
                    left_sidebar.classList.add("active"); 
                }
                
                if(window.innerWidth < 200){
                    
                   document.getElementById("btn").addEventListener("click", open_close_menu_responsive);
            
                    function open_close_menu_responsive(){
                        burguer_div.classList.toggle("burguer");
                        left_sidebar.classList.toggle("responsive");
                } 
                    
                    burguer_div.classList.remove("burguer_move");
                    left_sidebar.classList.remove("active"); 
                }
            });
            
        </script> 
                
                
                
            <div class="contenido_data">
                <div class="contenedor">
                    <div class="tu-info">
                        <h1>Tu Información</h1>
                    </div>
                    <div class="cont-pfp">
                        <img src="images/<%=sesion.getAttribute("SIImgNum")%>" class="pfp">
                        
                            <div class="overlay">
                                <div class="editar">                         
                                    <a href="profileimg.jsp"> <svg xmlns="http://www.w3.org/2000/svg" width="54" height="54" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;"><path d="m16 2.012 3 3L16.713 7.3l-3-3zM4 14v3h3l8.299-8.287-3-3zm0 6h16v2H4z"></path></svg></a>
                                </div>
                            </div>

                    </div>
                    <div class="info">
                        <form class="row g-3" action="actualizarUser.jsp" method="POST">
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Nombre de usuario</label>
                                <input type="text" name="nombre" value="<%=sesion.getAttribute("SIUser") %>" class="form-control" id="inputEmail4" required>
                            </div>
                            <div class="col-md-2">
                                <label for="inputZip" class="form-label">Edad</label>
                                <input type="text" name="edad" value="<%=sesion.getAttribute("SIAge") %>" class="form-control" id="inputZip" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
