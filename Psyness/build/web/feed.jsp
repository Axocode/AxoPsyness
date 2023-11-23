<%-- 
    Document   : feed2.jsp
    Created on : 7 may. 2023, 20:33:13
    Author     : Admin
--%>
<%@page import="org.axocode.dao.service.InterLoveService"%>
<%@page import="org.axocode.dao.service.InterPubService"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page session="true"%>
<%@page import="org.axocode.dao.InterFav"%>
<%@page import="org.axocode.helper.InterFavHelper"%>
<%@page import="org.axocode.dao.service.InterFavService"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page import="org.axocode.dao.service.InterUsersPubService"%>
<%@page import="org.axocode.helper.InterUsersPubHelper"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.axocode.dao.InterPub"%>
<%@page import="org.axocode.dao.InterUsersPub"%>
<%@page import="org.axocode.helper.Helpers"%>
<%@page import="org.axocode.helper.InterPubHelper"%>
<%@page import="java.util.Collections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Psyness</title>
        <!-----Bootstrap------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-----Bootstrap------->
    <link rel="stylesheet" href="css/feed3css.css">
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
        <!-----Boxicons------->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>    
    
    
</head>
<body>
<script>
    function doPub() {
      document.getElementById("guardadito").disabled = true;
    }
</script>
<%
          request.setCharacterEncoding("UTF-8");          
          HttpSession sesion = request.getSession();
          
                String data = (String) sesion.getAttribute("SIImgNum");
                if (data == null) {data = "profilesidebar3.png";}
                Helpers helpers = null;
                InterPub user = null;
                String aux = null;
                boolean flag = false;
                String readonly = null;
                aux = "Guardar";
                readonly = "";
                String guardar = request.getParameter("guardar");
                int seguidores = 0;
                int seguidos = 0;
                int PubNumIdefinitivo;
                helpers = new InterPubHelper( ).addRequest( request );
                ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
                ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
                String horaFormateada = horaCiudadMexico.format(formatter);
                
                
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
                String horaFormateada2 = horaCiudadMexico.format(formatter2);
                
                
                
                user = new InterPub(); 
                user.setPubCont("");    

                if(  "Submit".equals( guardar ) ){
                    if (sesion.getAttribute("SILastPub") == null) {
                        sesion.setAttribute("SILastPub", horaCiudadMexico.format(formatter2));
                        flag = helpers.addT( );
                        if (flag) {
                        
                            
                            int IUserNum = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                            InterPubService metododefinitivo = new InterPubService();
                            InterPub objetodefinivo = metododefinitivo.getLastPub();
                            if (objetodefinivo != null && objetodefinivo.getPubNumId() != null) {
                                PubNumIdefinitivo = Integer.parseInt(objetodefinivo.getPubNumId().toString());
                                } else {
                                PubNumIdefinitivo = 1;}
                            
                            InterUsersPub contextInterses = new InterUsersPub();
                            contextInterses.setPubNumId(new InterPub(PubNumIdefinitivo));
                            contextInterses.setiUserNum(new InterUsers(IUserNum));
                            InterUsersPubService interUsersPubService = new InterUsersPubService();
                            boolean success = interUsersPubService.addUsersPub(contextInterses);
                            response.sendRedirect("error.jsp");     
                            }
                        }else{
                            LocalDateTime horaAct = LocalDateTime.parse(horaFormateada2, formatter2);
                            String horaLastPubliString = (String) sesion.getAttribute("SILastPub");
                            LocalDateTime horaLastPubli = LocalDateTime.parse(horaLastPubliString, formatter2);
                            long totalToAccesss = ChronoUnit.SECONDS.between(horaLastPubli, horaAct);
                            if (totalToAccesss > 10) {
                                sesion.setAttribute("SILastPub", horaCiudadMexico.format(formatter2));
                                flag = helpers.addT( );
                                if (flag) {
                                
                                
                                int IUserNum = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                                InterPubService metododefinitivo = new InterPubService();
                            InterPub objetodefinivo = metododefinitivo.getLastPub();
                            if (objetodefinivo != null && objetodefinivo.getPubNumId() != null) {
                                PubNumIdefinitivo = Integer.parseInt(objetodefinivo.getPubNumId().toString());
                                } else {
                                PubNumIdefinitivo = 1;}

                                InterUsersPub contextInterses = new InterUsersPub();
                                contextInterses.setPubNumId(new InterPub(PubNumIdefinitivo));
                                contextInterses.setiUserNum(new InterUsers(IUserNum));
                                InterUsersPubService interUsersPubService = new InterUsersPubService();
                                boolean success = interUsersPubService.addUsersPub(contextInterses);
                                response.sendRedirect("error.jsp");
                                }   
                                }else {%>
                                        <script>
                                         var valor = '<%= 10 - totalToAccesss %>';
                                         if (valor === 1) {alert('Espera '+ valor +' segundo volver a publicar');
                                         window.location.href = "feed.jsp";}else 
                                         alert('Espera '+ valor +' segundos volver a publicar'); window.location.href = "feed.jsp"; 
                                         </script><%}
                        }
                    }
                    
                    
                    
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
                        <span class="links_name">Incio</span>
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
            <div class="write-post-container">
                <div class="user-profile">
                    <img src="images/<%=data%>">
                    <div>
                        <p><c:out value='<%=sesion.getAttribute("SIUser")%>'/></p>
                        <small>Public</small>
                    </div>

                </div>
                <br>
                <div class="post-input-container">
                    <div class="checkbox">
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                          ¿Que desea publicar?
                        </button>
                    </div>

                        <!--MODAL-->
                              
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel"><center>Crear publicacion</center></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="user-profile-modal">
                                <img src="images/<c:out value='<%=data%>'/>">
                                <div>
                                    <p><c:out value='<%=sesion.getAttribute("SIUser")%>'/></p>
                                </div>
                            <%
                            String[] partes =horaFormateada.split(" ");
                            String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                            String hora12 = partes[5];
                            %>      
                            </div>
                                <form id="formulario3" method="POST" accept-charset="UTF-8" onsubmit="doPub();" >
                            <div class="post-input-container">
                                <textarea id="PubCont" name="PubCont" value="67" class="input" rows="3" maxlength="500" placeholder="Que estas Pensando,  <c:out value='<%=sesion.getAttribute("SIUser")%>'/>"></textarea>
                                <input type="hidden" name="PubDate" id="PubDate" value="<%=fecha12%>" />
                                <input type="hidden" name="PubHour" id="PubHour" value="<%=hora12%>" />
                            </div>
                            <div class="modal-footer">
                                <div class="d-grid gap-2">
                                    <input class="btn btn-primary" type="hidden" id="guardar" name="guardar" value="Submit" />
                                    <input class="btn btn-primary" type="submit" id="guardadito" name="guardar" value="Submit" />
                                </div>                            
                                </form>
                            </div>
                          </div>
                        </div>
                      </div>
                        <!--FIN MODAL-->
                    <div class="add-post-links">
                        
                    </div>
                </div>
            </div>
<%
        
        InterPubHelper pubHelper = new InterPubHelper();
        List<InterPub>list = pubHelper.getListT();
        Collections.reverse(list);
        int Cantidad = 0;
        int tamano = list.size();
        if( list != null && list.size() > 0)
        {
        for(InterPub trows : list)
        {       
           Cantidad++;
           InterUsersService dao = new InterUsersService();
           InterUsers interUsers = dao.getInterUsersByPubNumId(trows.getPubNumId());

            if (interUsers != null) {
            String data1 = interUsers.getIImgNum();
            
            if (data1 != null) {}
                else{data1 = "perfilsidebar.png";}
                
        String horita = trows.getPubHour().substring(0, 5);
            

                
    %>
            <div class="post-container" id="<%=trows.getPubNumId()%>">
                <div class="user-profile">
                    <a href="profile.jsp?id=<%=interUsers.getIUserNum()%>" style="text-decoration:none"><img src="images/<%=data1%>"></a>
                    <div>
                        <a href="profile.jsp?id=<%=interUsers.getIUserNum()%>" style="text-decoration:none"><p><b><c:out value='<%=interUsers.getIUser()%>'/></b>‎ ‎<%=horita%></p></a>
                        <a href="profile.jsp?id=<%=interUsers.getIUserNum()%>" style="text-decoration:none"><small><%=trows.getPubDate()%></small></a>
                    </div>
                </div>
                <br>                
                <%if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {%>
                <p class="post-text"><c:out value='<%=trows.getPubCont()%>'/></p>
                <p class="post-text">(<a href="eliminarPub.jsp?eliminar=<%=trows.getPubNumId()%>">Eliminar</a>)</p>
                <%}else if (sesion.getAttribute("SIRol").equals("Administrador")) {%>
                <p class="post-text"><c:out value='<%=trows.getPubCont()%>'/></p>
                <p class="post-text">(<a href="eliminarPub.jsp?eliminar=<%=trows.getPubNumId()%>">Eliminar</a>)</p>
                <%}else{%>
                <p class="post-text"><c:out value='<%=trows.getPubCont()%>'/></p>
                <%}%>

                <div class="post-row">
                    <div class="activity-icons">
                         <%  
                            InterLoveService lovee = new InterLoveService();
                            int LoveID = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                            boolean seguirLove = lovee.isUserLove(trows.getPubNumId(), LoveID );        
                            if (seguirLove) {
                        %>
                        <div><a href="loveService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Lovent"><%=trows.getPubMg()%> <img src="images/heart.png">Quitar amor</a></div>
                        <%}else{%>
                        <div><a href="loveService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Love"><%=trows.getPubMg()%> <img src="images/heart.png">Dar amor</a></div>
                        <%}%>
                        
                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                            InterFavService fav = new InterFavService();
                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                            boolean seguir = fav.isUserFav(trows.getPubNumId(), FlowSeguidorID );        
                            if (seguir == true ) {
                        %>
                        <div><a href="favService.jsp?pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Favoritont"><img src="images/star.png">Eliminar</a></div>
                        <%}else{%>
                        <div><a href="favService.jsp?pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Favorito"><img src="images/star.png">Agregar</a></div>
                        <%}}%>
                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                            InterFlowService flowww = new InterFlowService();
                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                            boolean seguir = flowww.isUserFollowing(interUsers.getIUserNum(), FlowSeguidorID );        
                            if (seguir == true ) {
                        %>
                        <div><a href="seguirnt.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed"><img src="images/follow.png">Dejar de Seguir</a></div>
                        <%}else{%>
                        <div><a href="seguir.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed"><img src="images/follow.png">Seguir</a></div>
                        <%}}%>
                        
                    </div>
                    <div class="post-profile-icon">

                    </div>
                </div>
            </div>
            <%
                }}}
            %>
        </div>
        <!-----------------------------------right-sidebar(VERGAS)------------------------------------------------------------------------->

        <div class="right-sidebar">
            <div class="sidebar-profile">
                <a href="profile.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="a-perfil" style="text-decoration:none">                    
                <div class="user-profile">
                    <img src="images/<%=data%>" id="foton">
                    <div>
                        <p id="username"><c:out value='<%=sesion.getAttribute("SIUser")%>'/></p>
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
                          <b>Wave diaria</b>
                        </button>
                      </h2>
                      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                        <div class="accordion-body">
                            <div class="card" style="width: 18rem;">
                                <ul class="list-group list-group-flush">
                                    <%
                              /*WAVE*/

                            ZonedDateTime ayer = horaCiudadMexico.minusDays(1);
                            String horaFormateadaWave = ayer.format(formatter);
                            String []partesWave = horaFormateadaWave.split(" ");
                            String fechaWave = partesWave[0] + " " + partesWave[1] + " " + partesWave[2] + " " + partesWave[3] + " " + partes[4];

                            InterPubService horas = new InterPubService();
                            boolean empezarWave = horas.getPubLateDay(fechaWave);

                                if (empezarWave) {
                                    InterPub wave = new InterPub();
                                    InterUsers waveUsers = new InterUsers();
                                    InterUsersService persona = new InterUsersService();
                                    wave = horas.getMostLikedPubByDate(fechaWave);
                                    waveUsers = persona.getInterUsersByPubNumId(wave.getPubNumId());
    %>
    <li class="list-group-item">
        <a href="profile.jsp?id=<%=waveUsers.getIUserNum()%>" style="text-decoration:none; color: black;"><p><small><%=wave.getPubDate()%></small></p></a>
        <a href="profile.jsp?id=<%=waveUsers.getIUserNum()%>" style="text-decoration:none; color: black;"><p><b><c:out value='<%=waveUsers.getIUser()%>'/></b>‎</p></a>
        <a href="profile.jsp?id=<%=waveUsers.getIUserNum()%>" style="text-decoration:none; color: black;"><%=wave.getPubCont()%></a><br><br>
        <a href="profile.jsp?id=<%=waveUsers.getIUserNum()%>" style="text-decoration:none; color: black;">Likes: <%=wave.getPubMg()%></a>
    </li>
                                <%}%>
                            </ul>
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