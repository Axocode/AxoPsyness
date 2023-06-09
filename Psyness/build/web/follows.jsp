<%@page import="java.util.List"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page session="true"%>
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
        <link rel="stylesheet" href="css/follows.css">
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
                    
                    int IdS = Integer.parseInt(request.getParameter("id"));
          String nombreper = null;
          String seguidormain = null;
          InterUsersHelper userHelper = new InterUsersHelper();       
          int postK = 0;
                    
        InterUsersService dao = new InterUsersService();
        List<InterUsers>listita = userHelper.getListT();
        
        if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           if ((request.getParameter("id").toString()).equals(interUsers.getIUserNum().toString())) {
            nombreper = (interUsers.getIUser());
            postK = interUsers.getIUserNum();
    
    }}}} if (nombreper.equals(session.getAttribute("SIUser"))) {
            seguidormain = "sigue";
        }
        


        int seguidores = 0;
        int seguidos = 0;
        
                    if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           if ((sesion.getAttribute("SIUserNum").toString()).equals(interUsers.getIUserNum().toString())) {
            
            seguidores = interUsers.getIUserSeguidores();
            seguidos = interUsers.getIUserSeguidos();
            
    }}}}
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
                        <input type="text" id="myInput" placeholder="Buscar">
                        <!--<div class="dropdown-container">
                        
                        <div class="dropdown-content">
                            <ul class="list-group">
                                <li class="list-group-item">An item</li>
                                <li class="list-group-item">A second item</li>
                                <li class="list-group-item">A third item</li>
                                <li class="list-group-item">A fourth item</li>
                                <li class="list-group-item">And a fifth one</li>
                            </ul>
                        </div>
                        </div>-->
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
            <div class="contenedor-central">
                <div class="card1">
                    <%if (seguidormain != null) {%>
                    <h1 class="card-header">Tus seguidos</h1>
                    <%}else{%>
                    <h1 class="card-header">Seguidos de <a href="profile.jsp?id=<%=postK%>" style="text-decoration: none; color: black;"><%=nombreper%></a></h1>
                    <%}%>
                    <div class="card-body scroll">
                      <%
                InterUsersService interUsersService = new InterUsersService();
                List<InterUsers> interUsersList = interUsersService.getInterUsersByFollower(IdS);
                if (!interUsersList.isEmpty()) { 
                
                for (InterUsers interUsers : interUsersList) {
                List<InterUsers>list = userHelper.getListT();                    
                    if( list != null && list.size() > 0){
                        
                    for(InterUsers trows : list){
                        if (interUsers.getIUser().equals(trows.getIUser())) {  
                        
                        String dot = (String) trows.getIImgNum();
                        if (dot != null) {}
                            else{dot = "perfilsidebar.png";}
                      %>
                        <div class="card mb-3" style="">
                        <div class="row g-0">
                          <div class="col-md-4">
                              <img src="images/<%=dot%>" class="img-fluid rounded-start" alt="..." >
                          </div>
                          <div class="col-md-8">
                            <div class="card-body">
                              <a href="profile.jsp?id=<%=trows.getIUserNum()%>"  style="text-decoration: none; color: black;" ><h3 class="card-title"><%=trows.getIUser()%></h3></a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <%}}}}}%> 
                    </div>
                </div>
                
                
            </div>
            <div class="right-sidebar" >
            <div class="sidebar-profile">
                <a href="profile.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="a-perfil" style="text-decoration:none">                    
                <div class="user-profile">
                    <img src="images/<%=data%>" id="foton">
                    <div>
                        <p id="username"><%=sesion.getAttribute("SIUser")%></p>
                        <small><%=sesion.getAttribute("SIUserNum")%></small>
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
                              <li class="list-group-item"><img src="images/sdbr1.jpg"><b><a href="https://www.uv.mx/cendhiu/files/2013/08/Articulo-Violencia-de-genero.pdf" target="blank">Violencia de género</a></b></li>
                              <li class="list-group-item"><img src="images/sdbr2.jpg"><b><a href="http://www.fundacionmujeres.es/maletincoeducacion/pdf/CUAD5horiz.pdf" target="blank">Fórmulas para la equidad de género</a></b></li>

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
            <script>
                document.getElementById("myInput").addEventListener("click", function() {
                var dropdownContent = document.getElementsByClassName("dropdown-content")[0];
                if (dropdownContent.style.display === "none") {
                  dropdownContent.style.display = "block";
                } else {
                  dropdownContent.style.display = "none";
                }
              });
            </script>
    </body>
</html>
