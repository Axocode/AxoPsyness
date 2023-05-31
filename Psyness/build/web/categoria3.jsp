<%-- 
    Document   : genero2
    Created on : 21 may. 2023, 13:57:14
    Author     : Admin
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Psyness</title>
        <!-----Bootstrap------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-----Bootstrap------->
    <link rel="stylesheet" href="css/categoria3css.css">
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
        <!-----Boxicons------->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            
            /*
            searchBtn.onclick = function() {
                left_sidebar.classList.toggle("active");
            }
             */
            
            /*
             * 
             * @type {type}
            document.getElementById("btn").addEventListener("click", open_close_menu);
            
            var left_sidebar = document.getElementById("left_sidebar");
            var btn = document.getElementById("btn");
            var burguer = document.getElementById("burguer");
            
                function open_close_menu(){
                    burguer.classList.toggle("burguer_move");
                    left_sidebar.classList.toggle("menu_side_move");
                }
             */
        </script>     
            
        
        <!-----------------------------------main-content(EXEL)--------------------------------------------------->
        <div class="main-content">
            <div class="write-post-container">
                   
                <div class="user-profile">                   
                    <div>
                        <p id="username">Subtemas</p>
                    </div> 
                </div>
                <div class="post-input-container">


                        <!--MODAL-->
                              
                        <!--  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel"><center>Crear publicacion</center></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="user-profile-modal">
                                <img src="images/perfilsidebar.png">
                                <div>
                                    <p>JASNA</p>
                                </div>
                                    
                            </div>
                                <form id="formulario3" method="POST">
                            <div class="post-input-container">
                                <textarea id="PubCont" name="PubCont" value="67" class="input" rows="3" placeholder="Que estas Pensando,  JAFNA?"></textarea>
                            </div>
                            <button type="button" class="btn btn-outline-light"><span><i class="fa-regular fa-file-plus" style="color: #000000;"></i>
                                </span>Agregar Imagen</button>
                            <div class="modal-footer">
                                <div class="d-grid gap-2">
                                    <input class="btn btn-primary" type="submit" id="guardar"  class="submit"/>
                                    
                                </div>                            
                                </form>
                            </div>
                          </div>
                        </div>
                      </div><!-- comment -->
                        <!--FIN MODAL-->
                    
                </div>
            </div>
            
            
            
            
            <!<!-- CARDS -->
                        <div class="row row-cols-1 row-cols-md-2 g-4" style="
                padding-top: 3rem;">
              <div class="col">
                <div class="card"style="box-shadow: 5px 5px 10px 1px rgb(0 0 0 / 20%);">
                    <a href="https://www.instagram.com/p/CscBbdtPXJR/"><img src="images/mujerempresarial.png" class="card-img-top" alt="..."></a>
                  <div class="card-body">
                    <h4 class="card-title">Mujer Empresarial</h4>
                    <p class="card-text">En torno a las mujeres empresarias, es una ocasion valiosa para impulsar emprendimiento de jovenes y mujeres de cualquier edad, grupo social, raza o nacionalidad <br> <br>Con acciones que despejen su camino de obstaculos que les discrimine</p>
                  </div>
                </div>
              </div>
              
            </div>
            <!<!-- CARDS -->

            
            
            
        </div>
        <!-----------------------------------right-sidebar(VERGAS)------------------------------------------------------------------------->
        <div class="right-sidebar">
            
            
           
            
            
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
    </div>
</body>
</html>

