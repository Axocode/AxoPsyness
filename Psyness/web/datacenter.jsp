<%-- 
    Document   : datacenter2
    Created on : 20/05/2023, 06:10:22 PM
    Author     : admin
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/data2css.css">
        
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
                        <a href="#">
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
                    <div class="encabezado">
                        <h2 class="titulo-seccion">Ayuda profesional</h2>
                        <h3 class="subtitulo-seccion">Información de Contacto</h3>
                    </div>

                    <div class="contenido_seccion">
                        <div class="row row-cols-1 row-cols-md-3 g-4">

                            <div class="col">
                                <div class="card" id="cajitas">
                                     <div class="card_img">
                                        <img src="images/apoyofamiliar.png" width="150">
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-user"></i>
                                        <span class="titulo-detalle">Red de Género Cecyt 9</span>
                                        <p>Instituto Politecnico Nacional</p>
                                    </div>
                                    <div class="col_info">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;"><path d="M20 4H4c-1.103 0-2 .897-2 2v12c0 1.103.897 2 2 2h16c1.103 0 2-.897 2-2V6c0-1.103-.897-2-2-2zm0 2v.511l-8 6.223-8-6.222V6h16zM4 18V9.044l7.386 5.745a.994.994 0 0 0 1.228 0L20 9.044 20.002 18H4z"></path></svg>
                                        <span class="titulo-detalle">Contacto</span>
                                        <p>genero@ipn.mx</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span class="titulo-detalle">Website</span>
                                        <a href="https://www.cecyt9.ipn.mx/red-genero-jdb.html" target="_blank">cecyt9.ipn.mx</a>
                                    </div>
                                </div>
                                
                            </div>

                            <div class="col">
                                <div class="card" id="cajitas">
                                    <div class="card_img">
                                        <img src="images/apoyopsicologico.png" width="150">
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-user"></i>
                                        <span class="titulo-detalle">LOCATEL</span>
                                        <p>Servicio de Atención Psicologica Confidencial y Profesional</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-phone"></i>
                                        <span class="titulo-detalle">Contacto</span>
                                        <p>55 5658 1111</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span class="titulo-detalle">Website</span>
                                        <a href="https://311locatel.cdmx.gob.mx/" Target='_blank'>locatel.com</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="card" id="cajitas">
                                    <div class="card_img">
                                        <img src="images/apoyomujeres.png" width="150">
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-user"></i>
                                        <span class="titulo-detalle">LINEA MUJERES</span>
                                            <p>Servicio de Atención para las Mujeres</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-phone"></i>
                                        <span class="titulo-detalle">Contacto</span>
                                        <p>55 5658 1111</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span class="titulo-detalle">Website</span>
                                        <a href="https://www.semujeres.cdmx.gob.mx/servicios/servicio/linea-mujeres" Target='_blank'>limujer.com</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="card" id="cajitas">
                                     <div class="card_img">
                                        <img src="images/apoyosuicidio.png" width="150">
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-user"></i>
                                        <span class="titulo-detalle">AMS</span>
                                        <p>Asociación Mexicana de Suicidiología</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-phone"></i>
                                        <span class="titulo-detalle">Contacto</span>
                                        <p>55 525 98121</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span class="titulo-detalle">Website</span>
                                        <a href="https://suicidologia.mx/" Target='_blank'>ams.com</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="card" id="cajitas">
                                     <div class="card_img">
                                        <img src="images/apoyosos.png" width="150">
                                    </div>
                                    <div class="col_info">
                                        <br><i class="fa-solid fa-user"></i>
                                        <span class="titulo-detalle">SOS</span>
                                        <p>Servicio de Orientacion Psicologica</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-phone"></i>
                                        <span class="titulo-detalle">Contacto</span>
                                        <p>800 710 24 96</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span class="titulo-detalle">Website</span>
                                        <a href="https://difem.edomex.gob.mx/mujeres_servicio_orientacion_psicologica" Target='_blank'>sos.com</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="card" id="cajitas">
                                    <div class="card_img">
                                        <img src="images/apoyotelefono.png" width="150">
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-user"></i>
                                        <span class="titulo-detalle">SAPTEL</span>
                                        <p>Sistema Nacional de Apoyo en Crisis por Teléfono</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fa-solid fa-phone"></i>
                                        <span class="titulo-detalle">Contacto</span>
                                        <p>01 800 472 7835</p>
                                    </div>
                                    <div class="col_info">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <span class="titulo-detalle">Website</span>
                                        <a href="https://www.saptel.org.mx/" Target='_blank'>saptel.com</a>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
