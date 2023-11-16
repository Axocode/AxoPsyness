<%-- 
    Document   : genero2
    Created on : 21 may. 2023, 13:57:14
    Author     : Admin
--%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="org.axocode.helper.InterUsersHelper"%>
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
    <link rel="stylesheet" href="css/genero2.css">
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
          String data = (String) sesion.getAttribute("SIImgNum");
                if (data != null) {}
                    else{data = "perfilsidebar.png";}
                    
    int seguidores = 0;
    int seguidos = 0;
                InterUsersHelper userHelper = new InterUsersHelper();
        List<InterUsers>listita = userHelper.getListT();
        
                    if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           InterUsersService dao = new InterUsersService();
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           if ((sesion.getAttribute("SIUserNum").toString()).equals(interUsers.getIUserNum().toString())) {
            
            seguidores = interUsers.getIUserSeguidores();
            seguidos = interUsers.getIUserSeguidos();
                
            
    }}}}
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
        
            
            
            
            <!<!-- CARDS -->
                        <div class="row row-cols-1 row-cols-md-2 g-4" style="
                padding-top: 3rem;">
              <div class="col">
                <div class="card"style="box-shadow: 5px 5px 10px 1px rgb(0 0 0 / 20%);">
                    <a href="categoria1.jsp"><img src="images/FobiasDiscriminatorias.png" class="card-img-top" alt="..."></a>
                  <div class="card-body">
                    <h4 class="card-title">Violencia</h4>
                    <p class="card-text">La violencia es el “uso intencional de la fuerza física o el poder real o como amenaza contra uno mismo, una persona, o comunidad que tiene como resultado la probabilidad de daño psicológico, fisico privación.</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card" style="box-shadow: 5px 5px 10px 1px rgb(0 0 0 / 20%);">
                    <a href="categoria2.jsp"><img src="images/genero.png" class="card-img-top" alt="..."></a>
                  <div class="card-body">
                    <h4 class="card-title">Genero</h4>
                    <p class="card-text">El género se refiere a los roles, las características y oportunidades definidos por la sociedad que se
                        consideran apropiados para todas las personas
 </p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card"style="box-shadow: 5px 5px 10px 1px rgb(0 0 0 / 20%);">
                    <a href="categoria3.jsp"><img src="images/economiagenero.jpg" class="card-img-top" alt="..."></a>
                  <div class="card-body">
                    <h4 class="card-title">Economia en el genero</h4>
                    <p class="card-text">La autonomía económica se explica como la capacidad de las mujeres de generar ingresos y
                        recursos propios a partir del acceso al trabajo remunerado en igualdad de condiciones que los hombres</p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card"style="box-shadow: 5px 5px 10px 1px rgb(0 0 0 / 20%);">
                    <a href="categoria4.jsp"><img src="images/Suicidio.png" class="card-img-top" alt="..."></a>
                  <div class="card-body">
                    <h4 class="card-title">Suicidio</h4>
                    <p class="card-text">Segun la OMS el comportamiento suicida es una de las variables, reportadas por la evidencia cientifica, 
                        asociadas al consumo de alcohol, tabaco y el consumo de drogras.</p>
                  </div>
                </div>
              </div>
            </div>
            <!<!-- CARDS -->

            
            
            
        </div>
        <!-----------------------------------right-sidebar(VERGAS)------------------------------------------------------------------------->
        <div class="right-sidebar">
            <div class="sidebar-profile">
                <a href="profile.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="a-perfil" style="text-decoration:none">                    
                <div class="user-profile">
                    <img src="images/<%=data%>" id="foton">
                    <div>
                        <p id="username"><c:out value='<%=sesion.getAttribute("SIUser")%>'/></p>
                        <small><%=sesion.getAttribute("SIAge")%></small>
                    </div>   
                </div>
                <br>
                <div class="stats">
                    <div class="activity-icons">
                        <div><a href="followers.jsp?id=<%=sesion.getAttribute("SIUserNum")%>">Seguidores: <%=seguidores%><img src="images/friends.png"></a></div>
                        <div><a href="follows.jsp?id=<%=sesion.getAttribute("SIUserNum")%>">Seguidos: <%=seguidos%><img src="images/friends.png"></a></div>
                        <div><a href="favs.jsp?rufless=on&&favs=<%=sesion.getAttribute("SIUserNum")%>"><img src="images/star.png"></a></div>
                    </div>
                </div>
                </a>
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
    </div>
</body>
</html>

