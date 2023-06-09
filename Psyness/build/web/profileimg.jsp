<%@page import="java.sql.ResultSet"%>
<%@page import="org.axocode.dao.service.Conexion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Psyness</title>
            <!-----Bootstrap------->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            <!-----Bootstrap------->
        <link rel="stylesheet" href="css/pfp.css">
        <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
            <!-----Boxicons------->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>    
    </head>
    <body>
<%
    HttpSession sesion = request.getSession();
          if (sesion.getAttribute("SIUser") != null){}
          else{out.print("<script>location.replace('index');</script>");}   

        String img = request.getParameter("img");
        
        if (img != null) {         
        int iUserNum = (Integer) sesion.getAttribute("SIUserNum");

            
           
            InterUsers Object  = new InterUsers();
            InterUsersService container = new InterUsersService();
            Object.setIImgNum(img);
            Object.setIUserNum(iUserNum);
            
            boolean cont = container.updateUsuario(Object);
            if (cont) {
                    session.setAttribute("SIImgNum", img);
                    response.sendRedirect("profile.jsp?id="+iUserNum);
                }
}
%>         
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v16.0" nonce="RJPKicjE"></script>
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
            <!-- main content -->
          
            <div class="contenedor-grid">
                <div class="titulo">
                    <div class="card">
                        <div class="card-body">
                            <h1>Selecciona la foto de perfil que mas te agrade</h1>
                        </div>
                    </div>
                </div>
                
                    <div class="pfp-container1">
                       <img src="images/prof1.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof1.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container2">
                       <img src="images/prof2.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof2.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container3">
                       <img src="images/prof3.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof3.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container4">
                       <img src="images/prof4.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof4.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container5">
                       <img src="images/prof5.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof5.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container6">
                       <img src="images/prof6.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof6.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container7">
                       <img src="images/prof7.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof7.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                
                    <div class="pfp-container8">
                       <img src="images/prof8.png" class="fotoperfil"/>
                        <div class="overlay2">
                            <div class="seleccionar">   
                                <a href="profileimg.jsp?img=prof8.png" ><span class="badge bg-light text-dark">Seleccionar</span></a>
                            </div>
                        </div>                        
                    </div>
                   

            </div>
            <!-- Right Sidebar -->

            <div class="right-sidebar" >
            
            
            <div class="suggested">
                <div class="accordion" id="accordionExample">                    
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          Nota De La Semana
                        </button>
                      </h2>
                      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <a class="twitter-timeline" href="https://twitter.com/Axocode1?ref_src=twsrc%5Etfw">Tweets by Axocode1</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                        </div>
                      </div>
                    </div>
                    
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          Articulos de interés
                        </button>
                      </h2>
                      <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="card" style="width: 18rem;">
                            <ul class="list-group list-group-flush">
                              <li class="list-group-item"><svg class="svg-inline--fa fa-check-circle fa-w-16" aria-hidden="true" data-prefix="far" data-icon="check-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 48c110.532 0 200 89.451 200 200 0 110.532-89.451 200-200 200-110.532 0-200-89.451-200-200 0-110.532 89.451-200 200-200m140.204 130.267l-22.536-22.718c-4.667-4.705-12.265-4.736-16.97-.068L215.346 303.697l-59.792-60.277c-4.667-4.705-12.265-4.736-16.97-.069l-22.719 22.536c-4.705 4.667-4.736 12.265-.068 16.971l90.781 91.516c4.667 4.705 12.265 4.736 16.97.068l172.589-171.204c4.704-4.668 4.734-12.266.067-16.971z"></path></svg><b><a href="https://www.uv.mx/cendhiu/files/2013/08/Articulo-Violencia-de-genero.pdf">Violencia de género</a></b></li>
                              <li class="list-group-item"><svg class="svg-inline--fa fa-check-circle fa-w-16" aria-hidden="true" data-prefix="far" data-icon="check-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 48c110.532 0 200 89.451 200 200 0 110.532-89.451 200-200 200-110.532 0-200-89.451-200-200 0-110.532 89.451-200 200-200m140.204 130.267l-22.536-22.718c-4.667-4.705-12.265-4.736-16.97-.068L215.346 303.697l-59.792-60.277c-4.667-4.705-12.265-4.736-16.97-.069l-22.719 22.536c-4.705 4.667-4.736 12.265-.068 16.971l90.781 91.516c4.667 4.705 12.265 4.736 16.97.068l172.589-171.204c4.704-4.668 4.734-12.266.067-16.971z"></path></svg><b><a href="http://www.fundacionmujeres.es/maletincoeducacion/pdf/CUAD5horiz.pdf">Fórmulas para la equidad de género</a></b></li>

                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                          Materiales
                        </button>
                      </h2>
                      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            <div class="card" style="width: 18rem;">
                            <ul class="list-group list-group-flush">
                              <li class="list-group-item"><img src="images/sdbr3.jpg"/><!-- <i class="far fa-check-circle"></i> --> <a href="https://www.ipn.mx/assets/files/ccs/docs/gaceta-extraordinaria/2019/12/1519-gaceta-protocolo-genero.pdf" target="blank" ><b>Protocolo</b></a> </li>
                               <li class="list-group-item"><img src="images/sdbr4.jpg"/><!-- <i class="far fa-check-circle"></i> --> <a href="https://www.ipn.mx/assets/files/cecyt9/docs/11-red-genero/ACUERDO-PRESIDENCIAL.pdf" target="blank"><br><b>Acuerdo Presidencia</b></a> </li>
</ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
            
            <div class="trends">
                 <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                          <a href="https://www.cecyt9.ipn.mx/red-genero-jdb.html" target="blank"><img src="images/reddegen.png" class="d-block w-100"></a>
                      </div>
                      <div class="carousel-item">
                          <a href="https://unesdoc.unesco.org/ark:/48223/pf0000368125" target="blank"><img src="images/violgen.png" class="d-block w-100" alt="..."></a>
                      </div>
                      <div class="carousel-item">
                          <a href="https://neuro-class.com/salud-mental-prevencion-del-suicidio-en-la-adolescencia/" target="blank"> <img src="images/suic.jpg" class="d-block w-100" alt="..."></a>
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
            </div>
            <div class="cont-feis">
                <div class="feisbuk">
                    <div class="fb-page" data-href="https://www.facebook.com/profile.php?id=100083354409895" data-tabs="timeline" data-width="340" data-height="" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="false">
                        <blockquote cite="https://www.facebook.com/profile.php?id=100083354409895" class="fb-xfbml-parse-ignore">
                            <a href="https://www.facebook.com/profile.php?id=100083354409895">Red de Género Bátiz</a>
                        </blockquote>       
                   </div>
                </div>
            </div>
            
        </div>

    </body>
</html>
