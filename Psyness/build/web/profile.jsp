<%@page import="org.axocode.dao.service.InterFavService"%>
<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="java.util.Collections"%>
<%@page import="org.axocode.dao.InterPub"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.helper.InterPubHelper"%>
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
        <link rel="stylesheet" href="css/profileremaster.css">
        <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
            <!-----Boxicons------->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>    
    </head>
    <body>
<<<<<<< HEAD
<%
    HttpSession sesion = request.getSession(); 
    Object siUserNumAttribute = sesion.getAttribute("SIUserNum");
    if (siUserNumAttribute == null) {
            out.print("<script>location.replace('index.jsp');</script>");
        }
    String nombre =null;
    String edad = null;
    String data = null;
    int seguidores = 0;
    int seguidos = 0;
    int postK = 0;
    String data3 = (String) sesion.getAttribute("SIImgNum");
                if (data3 != null) {}
                    else{data3 = "perfilsidebar.png";}
    
        InterPubHelper pubHelper = new InterPubHelper();
        InterUsersHelper userHelper = new InterUsersHelper();
        
        
        List<InterPub>list = pubHelper.getListT();
        List<InterUsers>listita = userHelper.getListT();
        
        Collections.reverse(list);
        if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           InterUsersService dao = new InterUsersService();
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           if ((request.getParameter("id").toString()).equals(interUsers.getIUserNum().toString())) {
            nombre = (interUsers.getIUser());
            edad = (interUsers.getIAge());
            data = interUsers.getIImgNum();
            postK = interUsers.getIUserNum();
            seguidores = interUsers.getIUserSeguidores();
            seguidos = interUsers.getIUserSeguidos();
                if (data != null) {}
                    else{data = "perfilsidebar.png";}
            
    }}}}
    



    int seguidores1 = 0;
    int seguidos1 = 0;
                    if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           InterUsersService dao = new InterUsersService();
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           
           if ((sesion.getAttribute("SIUserNum").toString()).equals(interUsers.getIUserNum().toString())) {
            
            seguidores1 = interUsers.getIUserSeguidores();
            seguidos1 = interUsers.getIUserSeguidos();
                
            
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
            <div class="contenedor-central">
            <div class="top-profile">
                <div class="write-post-container">
                <div class="user-profile-top">
                    <div class="contenedor-imagen">
                        <img src="images/<%=data%>" class="">
                                <%if (nombre.equals(sesion.getAttribute("SIUser"))) {%>
                        <div class="overlay">
                            <div class="editar">
                                <a href="profileimg.jsp"> <svg xmlns="http://www.w3.org/2000/svg" width="54" height="54" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;"><path d="m16 2.012 3 3L16.713 7.3l-3-3zM4 14v3h3l8.299-8.287-3-3zm0 6h16v2H4z"></path></svg></a>
                            </div>
                        </div>
                                <%}%>
                    </div>
                    <div>
                        <h1><c:out value='<%=nombre%>'/><br><span class="badge bg-secondary"><c:out value='<%=edad%>'/></span></h1>                       
                    </div>

                </div>
               
                <div class="post-row">
                    <div class="activity-icons">
                        <div><a href="followers.jsp?id=<%=postK%>">Seguidores: <%=seguidores%><img src="images/friends.png"></a></div>
                        <div><a href="follows.jsp?id=<%=postK%>">Seguidos: <%=seguidos%><img src="images/friends.png"></a></div>
                        <%
                            if (nombre.equals(sesion.getAttribute("SIUser"))) {
                                  %>
                        <div><a href="favs.jsp?rufless=on&&favs=<%=postK%>"><img src="images/star.png"></a></div>
                        <%
                            }
                          
                            
                            if (!nombre.equals(sesion.getAttribute("SIUser"))) {
                            InterFlowService flowww = new InterFlowService();
                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");;
                            boolean seguir = flowww.isUserFollowing(postK, FlowSeguidorID );        
                            if (seguir == true ) {
                        %>
                        <div><a href="seguirnt.jsp?id=<%=postK%>&&chest=profile"><img src="images/follow.png">Dejar de Seguir</a></div>
                        <%}else{%>
                        <div><a href="seguir.jsp?id=<%=postK%>&&chest=profile"><img src="images/follow.png">Seguir</a></div>
                        <%}}%>
                    </div>
                    <div class="post-profile-icon">

                    </div>
                </div>
                <!--<div class="post-input-container">
                    <div class="checkbox">
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                          ¿Que desea publicar?
                        </button>
                    </div>

                        <!--MODAL
                              
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                      </div>
                        <!--FIN MODAL-  
                    <div class="add-post-links">
                        <a href="#"><img src="images/camera.png">Agregar Img</a>
                        <a href="#"><img src="images/upload.png">Subir Imagen</a> -->
                    </div>
            </div>
            <div class="main-content">
                    <%
        if( list != null && list.size() > 0)
        {
        for(InterPub trows : list)
        {
           InterUsersService dao = new InterUsersService();
           InterUsers interUsers = dao.getInterUsersByPubNumId(trows.getPubNumId());

           if (interUsers != null) {
           if ((request.getParameter("id").toString()).equals(interUsers.getIUserNum().toString())) {
            String data1 = interUsers.getIImgNum();
            if (data1 != null) {}
                    else{data1 = "perfilsidebar.png";}
                    String horita = trows.getPubHour().substring(0, 5);
                    
    %>
            <div class="post-container">
                <div class="user-profile">
                    <a href="profile.jsp?id=<%=interUsers.getIUserNum()%>" style="text-decoration:none"><img src="images/<%=data1%>"></a>
                    <div>
                        <a href="profile.jsp?id=<%=interUsers.getIUserNum()%>" style="text-decoration:none"><p><b><c:out value='<%=interUsers.getIUser()%>'/></b>‎ ‎<%=horita%></p></a>
                        <a href="profile.jsp?id=<%=interUsers.getIUserNum()%>" style="text-decoration:none"><small><%=trows.getPubDate()%></small></a>
                    </div>
                </div>
                <br>
                <p class="post-text"><c:out value='<%=trows.getPubCont()%>'/></p>
                <div class="post-row">
                    <div class="activity-icons">
                        <div><a href="megusta.jsp?pub=<%=trows.getPubNumId()%>&&chest=profile&&id=<%=interUsers.getIUserNum()%>"><img src="images/heart.png"><%=trows.getPubMg()%></a></div>
                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                            InterFavService fav = new InterFavService();
                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                            boolean seguir = fav.isUserFav(trows.getPubNumId(), FlowSeguidorID );        
                            if (seguir == true ) {
                        %>
                        <div><a href="favService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=profile&&action1=Favoritont"><img src="images/star.png">Eliminar</a></div>
                        <%}else{%>
                        <div><a href="favService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=profile&&action1=Favorito"><img src="images/star.png">Agregar</a></div>
                        <%}}%>
                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                            InterFlowService flowww = new InterFlowService();
                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");;
                            boolean seguir = flowww.isUserFollowing(interUsers.getIUserNum(), FlowSeguidorID );        
                            if (seguir == true ) {
                        %>
                        <div><a href="seguirnt.jsp?id=<%=interUsers.getIUserNum()%>&&chest=profile"><img src="images/follow.png">Dejar de Seguir</a></div>
                        <%}else{%>
                        <div><a href="seguir.jsp?id=<%=interUsers.getIUserNum()%>&&chest=profile"><img src="images/follow.png">Seguir</a></div>
                        <%}}%>
                    </div>
                    <div class="post-profile-icon">

                    </div>
                </div>
            </div>
            <%
                }}}}
            %>
                </div>
            </div>
            <div class="right-sidebar" >
            <div class="sidebar-profile">
                <a href="profile.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="a-perfil" style="text-decoration:none">                    
                <div class="user-profile">
                    <img src="images/<%=data3%>" id="foton">
                    <div>
                        <p id="username"><c:out value='<%=sesion.getAttribute("SIUser")%>'/></p>
                        <small><%=sesion.getAttribute("SIAge")%></small>
                    </div>   
                </div>
                <br>
                <div class="stats">
                    <div class="activity-icons">
                        <div><a href="followers.jsp?id=<%=sesion.getAttribute("SIUserNum")%>">Seguidores: <%=seguidores1%><img src="images/friends.png"></a></div>
                        <div><a href="follows.jsp?id=<%=sesion.getAttribute("SIUserNum")%>">Seguidos: <%=seguidos1%><img src="images/friends.png"></a></div>
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