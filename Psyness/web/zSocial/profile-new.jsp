<%-- 
    Document   : profile-new
    Created on : 23 nov. 2023, 19:01:23
    Author     : admin
--%>

<%@page import="org.axocode.dao.InterComent"%>
<%@page import="org.axocode.dao.service.InterComentService"%>
<%@page import="org.axocode.dao.InterFav"%>
<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.dao.service.InterLoveService"%>
<%@page import="org.axocode.dao.service.InterFavService"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="org.axocode.dao.service.InterUsersPubService"%>
<%@page import="org.axocode.dao.InterUsersPub"%>
<%@page import="org.axocode.dao.service.InterPubService"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="org.axocode.helper.Helpers"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="java.util.Collections"%>
<%@page import="org.axocode.dao.InterPub"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page import="org.axocode.helper.InterPubHelper"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="../assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs
        ================================================== -->
    <title>Perfil</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">

    <!-- icons
    ================================================== -->
    <link rel="stylesheet" href="../assets/css/icons.css">


    <!-- Bootstrap
    ================================================== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- CSS 
    ================================================== --> 
        <link rel="stylesheet" href="../assets/css/uikit.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/style2.css">
        <link href="../assets/css/tailwind.css" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/cambios.css">


     <!-----Boxicons------->
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-----Fontawesome------->
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
    <!-----JQuery------->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
 
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
          
                Helpers helpers = null;
                InterPub user = null;
                String aux = null;
                boolean flag = false;
                String readonly = null;
                aux = "Guardar";
                readonly = "";
                String guardar = request.getParameter("guardar");
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
                            response.sendRedirect("../zProcesos/error.jsp?direct=1&perf="+request.getParameter("id"));     
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
                                response.sendRedirect("../zProcesos/error.jsp?direct=1&perf="+request.getParameter("id"));
                                }   
                                }else {%>
                                        <script>
                                         var valor = '<%= 10 - totalToAccesss %>';
                                         if (valor === 1) {alert('Espera '+ valor +' segundo volver a publicar');
                                         window.location.href = "feed-new.jsp";}else 
                                         alert('Espera '+ valor +' segundos volver a publicar'); window.location.href = "feed-new.jsp"; 
                                         </script><%}
                        }
                    }

    Object siUserNumAttribute = sesion.getAttribute("SIUserNum");
    if (siUserNumAttribute == null) {
            out.print("<script>location.replace('index.jsp');</script>");
        }   
    String nombre =null;
    String edad = null;
    String data = null;
    String descripcion = null;
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
            descripcion = (interUsers.getIUserDescription());
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
    


    <div id="wrapper">

              
        <!-- Header -->
    <header>
        <div class="header_wrap">
            <div class="header_inner mcontainer">
                <div class="left_side">
                    
                    <!-- Burguer de NavBar - No es necesario

                        <span class="slide_menu" uk-toggle="target: #wrapper ; cls: is-collapse is-active">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M3 4h18v2H3V4zm0 7h12v2H3v-2zm0 7h18v2H3v-2z" fill="currentColor"></path></svg>
                        </span>
                    -->

                    <div id="logo">
                        <a href="feed-new.jsp"> 
                            <img src="../assets/images/avatars/Logo con letras centrado.svg" alt="">
                            <img src="../assets/images/avatars/Logo con letras centrado.svg" class="logo_mobile" alt="">
                        </a>
                    </div>
                </div>
                 
              <!-- Busqueda icon for mobile -->
                <div class="header-search-icon" uk-toggle="target: #wrapper ; cls: show-searchbox">  </div>
                <div class="header_search">
                    <i class="uil-search-alt"></i> 
                    <input value="" type="text" class="form-control" placeholder="Buscar" autocomplete="off">
                    
                </div>

                <div class="right_side">

                    <div class="header_widgets">                       

                        <!-- Iconos -->

                        <a href="feed-new.jsp" class="is_icon">
                            <i class='bx bxs-home'></i>
                        </a>

                        <a href="#" class="is_icon">
                            <i class='bx bx-compass' ></i>
                        </a>
                        
                        <a href="settings-new.jsp" class="is_icon">
                            <i class='bx bx-cog' ></i>  
                        </a>

                        <a href="chat1.jsp" class="is_icon" uk-tooltip="title: Message">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd"></path></svg>
                            <span>4</span>
                        </a>

                        <!-- Message de Bolita - Perfil -->
                        <a href="">
                            <img src="../assets/images/avatars/<%=data%>" class="is_avatar" alt="">
                        </a>
                        <div uk-drop="mode: click;offset:5" class="header_dropdown profile_dropdown">

                            <a href="profile-new.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="user">
                                <div class="user_avatar">
                                    <img src="../assets/images/avatars/<%=data%>" alt="">
                                </div>
                                <div class="user_name">
                                    <div> <c:out value='<%=sesion.getAttribute("SIUser")%>'/> </div>
                                    <span> <%=sesion.getAttribute("SIAge")%></span>
                                </div>
                            </a>
                           
                            <a href="settings-new.jsp">
                                <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path></svg>
                                Configuración 
                            </a>
                            <a href="follow-new.jsp?follows=<%=sesion.getAttribute("SIUserNum")%>">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M3 6a3 3 0 013-3h10a1 1 0 01.8 1.6L14.25 8l2.55 3.4A1 1 0 0116 13H6a1 1 0 00-1 1v3a1 1 0 11-2 0V6z"  clip-rule="evenodd" />
                                </svg>
                                Seguidores 
                            </a>
                            
                            <a href="#" id="night-mode" class="btn-night-mode">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
                                  </svg>
                                 Modo oscuro
                                <span class="btn-night-mode-switch">
                                    <span class="uk-switch-button"></span>
                                </span>
                            </a>
                            <a href="../index.jsp?cerrar=true">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                                </svg>
                                Salir
                            </a>

                            
                        </div>

                    </div>
                    
                </div>
            </div>
        </div>
    </header>
    <!-- SIDEBAR -->
    <aside class="sidebar_feed">

        <div class="sidebar_header">
            <!--<img src="images/sololetras.svg" class="logo-img_sidebar">-->
            <h1>Psyness</h1>
            <img src="../images/Icono.svg" class="logo-icon_sidebar">
        </div>


        <nav>
            <button onclick="location.href='feed-new.jsp'">
                <span>
                     <i class='bx bx-home' ></i>
                    <span>Inicio</span>
                </span>
            </button>

            <button id="button_search">
                <span>
                    <i class='bx bx-search'></i>
                    <span>Buscar</span>
                </span>
            </button>

            <button onclick="location.href='data-new.jsp?follows=1'">
                <span>
                   <i class='bx bx-user-voice' ></i>
                    <span>Datacenter</span>
                </span>
            </button>

            <button onclick="location.href='chat1.jsp'">
                <span>
                    <i class='bx bxl-telegram' >
                        <!--<span>15</span>-->
                        <em></em>
                    </i>
                    <span>Axochat</span>
                </span>
            </button>

            <!--

                <button>
                    <span>
                        <i class='bx bx-heart' >
                            <em></em>
                        </i>
                        <span>Notificaciones</span>
                    </span>
                </button>
            -->

            <button onclick="location.href='profile-new.jsp?id=<%=sesion.getAttribute("SIUserNum")%>'">
                    <span>
                        <img src="../images/<%=sesion.getAttribute("SIImgNum")%>" alt="" class="profile-img">
                        <span>Perfil</span>
                    </span>
            </button>
            
            <button onclick="location.href='settings-new.jsp'">
                <span>
                    <i class='bx bx-cog' ></i>  
                    <span>Configuración</span>
                </span>
            </button>
            <button onclick="location.href='feed-new.jsp'">
                <span>
                    <i class="fa-solid fa-plus"></i>
                    <span>Publicar</span>
                </span>
            </button>
            
                        <button onclick="location.href='../index.jsp?cerrar=true'">
                <span>
                    <i class='bx bx-log-out'></i>
                    <span>Salir</span>
                </span>
            </button>
        </nav>
    </aside>
<!-- SIDEBAR BUSCAR --><nav class="sidebar-search">
    <div class="search-header">
        <p>Buscar</p>
    </div>

    <nav>
        <input id="campoBusqueda" type="text" placeholder="Buscar" autofocus oninput="buscarEnTiempoReal()">
    </nav>

    <nav class="profiles_search">
        <hr>
        <div class="subtitle_search">
            <p>Personas</p>
        </div>

        <div id="resultadosBusqueda"></div>
    </nav>
</nav>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function buscarEnTiempoReal() {
        var searchTerm = document.getElementById('campoBusqueda').value;
        console.log(searchTerm)

        // Asegúrate de que la URL sea correcta
        var url = '/Psyness/BusquedaServlet?term=' + searchTerm;

        // Realizar solicitud AJAX
        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                $('#resultadosBusqueda').html(data);
            },error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);  // Agrega esta línea para mostrar la respuesta del servidor en la consola.
            }
        });
    }
</script>



        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">
                <div class="contenerdor_perfiluser">

                    <!-- Profile cover -->
                    <div class="profile user-profile">
    
                        <div class="profiles_banner">
                            <img src="../assets/images/avatars/fondomorado.png" alt="">
                            <div class="profile_action absolute bottom-0 right-0 space-x-1.5 p-3 text-sm z-50 hidden lg:flex">
                            
                        </div>
                        </div>
                        <div class="profiles_content">

                            <div class="profile_avatar">
                                <div class="profile_avatar_holder"> 
                                    <img src="../assets/images/avatars/<%=data%>" alt="">
                                </div>
                                <div class="icon_change_photo" hidden> <ion-icon name="camera" class="text-xl"></ion-icon> </div>
                            </div>
                            <div class="profile_info">
                                <h1> <c:out value='<%=nombre%>'/> </h1>
                            </div>
                            
                            <div class="profile_info">
                                <p> <c:out value='<%=descripcion%>'/> </p>
                            </div>
                            
                            <a href="follow-new.jsp?follows=<%=postK%>"
                            onmouseover="this.style.color='#141414'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#141414')" 
                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                            <div class="profile_info">
                                            <li class="flex items-center space-x-2"> 
                                                <ion-icon name="home-sharp" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                Seguidores: <strong> <%=seguidores%>  </strong>
                                                <ion-icon name="home-sharp" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                Seguidos: <strong> <%=seguidos%> </strong>
                                            </li>
                            </div>
                            </a>
                        </div>

                        <div class="flex justify-between lg:border-t border-gray-100 flex-col-reverse lg:flex-row pt-2">
                            <nav class="responsive-nav pl-3">
                                <ul  uk-switcher="connect: #timeline-tab; animation: uk-animation-fade">
                                    <li><a href="">Perfil</a></li>
                                    <%if ((request.getParameter("id")).equals(sesion.getAttribute("SIUserNum").toString())) {%>
                                    <li><a href="">Pubs Favoritas <span></span> </a></li>
                                    <%}%>
                                </ul>
                            </nav>
    
                            <!-- button actions -->
                            <div class="flex items-center space-x-1.5 flex-shrink-0 pr-4 mb-2 justify-center order-1 relative">
                                
                                <!-- add story -->
            
                            </div>

                        </div>

                    </div>
                    
                    <div class="uk-switcher lg:mt-8 mt-4" id="timeline-tab">
    
                        <!-- Perfil -->
                        <div class="md:flex md:space-x-6 lg:mx-16">
                            <div class="space-y-5 flex-shrink-0 md:w-7/12">
                                <%if (nombre.equals(sesion.getAttribute("SIUser"))) {%>
                            <!-- Crear publiccion  -->
                                   <div class="card lg:mx-0 p-4" uk-toggle="target: #create-post-modal" id="card_posting">
                                       <div class="flex space-x-3">
                                           <img src="../assets/images/avatars/<%=data3%>" class="w-10 h-10 rounded-full">
                                           <div class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full" style="display: flex; align-items: center; color: #b0b0b0; height: 40px; border: none; font-size: 15px;">¿Tienes algo que compartir?</div>
                                       </div>
                                       <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                                <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                                Photo/Video 
                                            </div>
                                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                                <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                                Tags
                                            </div>
                                            <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                                <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                                nose                                    
                                            </div>
                                       </div> 
                                   </div>
                                           <%}%>
                            
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
                                <!-- post header-->
                            <div class="card lg:mx-0 uk-animation-slide-bottom-small" id="posts_feed">
                           
                                    <div class="flex justify-between items-center lg:p-4 p-2.5" id="<%=trows.getPubNumId()%>">
                                        
                                        <div class="flex flex-1 items-center space-x-4">
                                            <a href="#">
                                                <img src="../assets/images/avatars/<%=data1%>" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                            </a>
                                            <div class="flex-1 font-semibold capitalize">
                                                
                                                <a href="#" class="text-black dark:text-gray-100">  <c:out value='<%=interUsers.getIUser()%>'/>  <span class="text-gray-700"><%=horita%>hrs</span></a>
                                                <div class="text-gray-700 flex items-center space-x-2"><%=trows.getPubDate()%> <ion-icon name="people"></ion-icon></div>
                                                
                                            </div>
                                        </div>
                                      <div>
                                        <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                        uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                      
                                            <ul class="space-y-0">
                                              <% if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {%>  
                                              <li uk-toggle="target: #create-post-modal-edit"> 
                                                  <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                   <i class="uil-edit-alt mr-1"></i>  Editar publicacion
                                                  </a> 
                                              </li>
                                              <li> 
                                                  <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                   <i class="uil-comment-slash mr-1"></i>  Desactivar
                                                  </a> 
                                              </li> 
                                              <li>
                                                <hr class="-mx-2 my-2 dark:border-gray-800">
                                              </li>
                                              <%} if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())  ||  sesion.getAttribute("SIRol").equals("Administrador")) {%>
                                              <li> 
                                                  <a href="../zProcesos/eliminarPub.jsp?eliminar=<%=trows.getPubNumId()%>&per=<%=interUsers.getIUserNum()%>&direct=1" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                   <i class="uil-trash-alt mr-1"></i>  Eliminar
                                                  </a> 
                                              </li>
                                              <%}if (!sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {%>
                                              <li> 
                                                  <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                      <i class="icon-feather-alert-circle mr-1"></i>  Reportar
                                                  </a> 
                                              </li>
                                              <%}%>
                                            </ul>
                                        </div>
                                      </div>
                                    </div>                       
                        
                                    <div class="p-4 pt-0 border-b dark:border-gray-700">
                        
                                        <p class="post-text"><c:out value='<%=trows.getPubCont()%>'/></p>
                        
                                    </div>
                                    
                        
                                    <div class="p-4 space-y-3"> 
                                       
                                        <div class="flex space-x-4 lg:font-bold">
                                        <%  
                                            InterLoveService lovee = new InterLoveService();
                                            int LoveID = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                                            boolean seguirLove = lovee.isUserLove(trows.getPubNumId(), LoveID );        
                                            String numpub = trows.getPubNumId().toString();
                                            String numid = interUsers.getIUserNum().toString();
                                            if (seguirLove) {
                                                
                                        %>
                                        <form class="love-form" action="/Psyness/MeGustaServlet" method="get" data-pub="<%=trows.getPubNumId()%>" onsubmit="return enviarAmor('<%=numpub%>', 'Lovent');">
                                            <button type="submit"
                                                    class="flex items-center space-x-2 love-button" 
                                                    style="color: #6B64F4; cursor: pointer; background-color: transparent; border: none; outline: none;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <span style="color: #6B64F4;"> <%=trows.getPubMg()%></span>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100" style="fill: #6B64F4;">
                                                        <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> - Amor</div>
                                            </button>
                                        </form>
                        <%}else{%>
                                        <form class="love-form" action="/Psyness/MeGustaServlet" method="get" data-pub="<%=trows.getPubNumId()%>" onsubmit="return enviarAmor('<%=numpub%>', 'Love');">
                                            <button type="submit"  
                                                    class="flex items-center space-x-2"
                                                    onmouseover="handleButtonHover1(this, true)"
                                                    onmouseout="handleButtonHover1(this, false)"
                                                    style="color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <span><%=trows.getPubMg()%></span>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                        <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> + Amor</div>
                                            </button>
                                        </form>
                        <%}%>
                        
                                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                                            InterFavService fav = new InterFavService();
                                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                                            boolean seguir = fav.isUserFav(trows.getPubNumId(), FlowSeguidorID );        
                                            if (seguir == true ) {
                                        %>
                                        <form class="fav-form" action="/Psyness/FavoritoServlet" method="get" data-pub="<%=trows.getPubNumId()%>" onsubmit="return agregarFav('<%=numpub%>', 'Favoritont');">
                                            <button type="submit"
                                                    class="flex items-center space-x-2"
                                                    style="color: #F6CE2F; cursor: pointer; background-color: transparent; border: none; outline: none;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100" style="fill: #F6CE2F;">
                                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.810l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.810h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                    </svg>
                                                </div>
                                                <div>- Favorito</div>
                                            </button>
                                        </form>

                        <%}else{%>       
                                        <form class="fav-form" action="/Psyness/FavoritoServlet" method="get" data-pub="<%=trows.getPubNumId()%>" onsubmit="return agregarFav('<%=numpub%>', 'Favorito');">
                                            <button type="submit"
                                                    class="flex items-center space-x-2"
                                                    onmouseover="handleButtonHover(this, true)"
                                                    onmouseout="handleButtonHover(this, false)"
                                                    style="color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                    </svg>
                                                </div>
                                                <div>+ Favorito</div>
                                            </button>
                                        </form>              
                        <%}}%>
                                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                                            InterFlowService flowww = new InterFlowService();
                                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                                            boolean seguir = flowww.isUserFollowing(interUsers.getIUserNum(), FlowSeguidorID );        
                                            if (seguir == true ) {
                                        %>
                                        <form class="follow-form" action="/Psyness/SeguidoresServlet" method="get" data-pub="<%=interUsers.getIUserNum()%>" onsubmit="return agregarSeguido('<%=numid%>', 'seguirnt');">    
                                            <button type="submit"
                                                    class="flex items-center space-x-2 flex-1 justify-end"
                                                    style="color: #EB74DB; cursor: pointer; background-color: transparent; border: none; outline: none;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" style="fill: #EB74DB;" class="dark:text-gray-100">
                                                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> - Seguir </div>
                                            </button>
                                        </form>
                        <%}else{%>
                                        <form class="follow-form" action="/Psyness/SeguidoresServlet" method="get" data-pub="<%=interUsers.getIUserNum()%>" onsubmit="return agregarSeguido('<%=numid%>', 'seguir');">    
                                            <button type="submit"
                                                    class="flex items-center space-x-2 flex-1 justify-end"
                                                    onmouseover="handleButtonHover2(this, true)"
                                                    onmouseout="handleButtonHover2(this, false)"
                                                    style="color: inherit; cursor: pointer; background-color: transparent; border: none; outline: none;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> + Seguir </div>
                                            </button>
                                        </form>
                        <%}}%>
                                            
                                        </div>
                                        
                                        <!--  
                                        <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                            <div class="flex">
                                                <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                    <img src="assets/images/avatars/prof6.png" alt="" class="absolute h-full rounded-full">
                                                </div>
                                                <div>
                                                    <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                        <p class="leading-6">Un comentario <urna class="i uil-heart"></urna> <i
                                                                class="uil-grin-tongue-wink"> </i> </p>
                                                        <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                    </div>
                                                    <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                        <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                        <a href="#"> Replay </a>
                                                        <span> 3d </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                            <input placeholder="Agregar un comentario" class="bg-transparent max-h-10 shadow-none px-5">
                                            <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                 
                                            </div>
                                        </div>
                                        -->
                                        
                                        
                                        <!-------------------------IMPORTANTE - CAMBIOS - COMMENTS-------------------------------->



                                        <div id="main-container" class="container-comentarios  border-b cursor-pointer py-2">
                                            <p class="px-4 sm:flex sm:flex-row-reverse hover:text-blue-600" onclick="toggleContainer(<%=trows.getPubNumId()%>)">Ver Comentarios </p>
                                            <div id="inner-container-<%=trows.getPubNumId()%>" class="inner-container">
                                                <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                                    <%
                                                        InterComentService coment = new InterComentService();
                                                        List<InterComent>comentarios = coment.getInterComentListWithNum(trows.getPubNumId().toString());
                                                        if (comentarios != null && comentarios.size() > 0) {
                                                                for(InterComent comentarito : comentarios){
                                                                
                                                                InterUsersService servicio = new InterUsersService();
                                                                InterUsers persona = new InterUsers();
                                                                persona  = servicio.getUserByInterUsersNum(comentarito.getComentIUserNum());
                                                        
                                                    %>


                                                    <div class="flex">
                                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                            <img src="../assets/images/avatars/<%=persona.getIImgNum()%>" alt="" class="absolute h-full rounded-full">
                                                        </div>
                                                        <div>
                                                            <div class="flex-1 font-semibold capitalize px-4">
                                                                <a href="profile-new.jsp?id=<%=comentarito.getComentIUserNum()%>" class="text-black dark:text-white" id="name_user_feed">  <c:out value='<%=persona.getIUser()%>'/>  </a>
                                                            </div>
                                                            
                                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                                <p class="leading-6"><c:out value='<%=comentarito.getComentCont()%>'/></p>
                                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%}}%>
                                                </div>
                                            </div>
                                        </div>
                                    
                                        <script>
                                            function toggleContainer() {
                                                var innerContainer = document.getElementById('inner-container');
                                                innerContainer.style.display = (innerContainer.style.display === 'none' || innerContainer.style.display === '') ? 'block' : 'none';
                                            }
                                        </script>
                                        
                                        
                                        
                                    </div>
                                </div> 
                            
                                                                       <%
                }}}}
            %> 
                            </div>
                            
                            <div class="right_side_profile">

                                <div class="w-full space-y-6" id="feauturings_user_perfil">

                                    <!--------------BOLITA ESTADO DE ANIMO------------->
                                    
                                    <div class="widget card p-4">
                                        <h4 class="text-center font-semibold"> ESTADO DE ÁNIMO </h4>


                                        <h2 class="text-center p-1 mr-3"> ¿Cómo te sientes el día de hoy? </h2>

                                        <div class="flex items-center justify-between border-t border-gray-200 bg-white px-4 py-2 sm:px-6">
                                            <img src="../assets/images/avatars/esfera-gradiente.png" class="object-cover rounded-lg col-span-full">
                                        </div>

                                        <!--CARRUSSEL-->

                                        <div class="flex items-center justify-between border-t border-gray-200 bg-white py-3 sm:px-4">
                                            <div class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between">
                                                <div>
                                                <p class="text-gray-700 px-1 sm:px-4">
                                                    BAD
                                                </p>
                                                </div>
                                                <div>
                                                <nav class="isolate inline-flex  shadow-sm" aria-label="Pagination">
                                                    <!-- Current: "z-10 bg-indigo-600 text-white focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600", Default: "text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:outline-offset-0" -->
                                                    <button class="relative inline-flex items-center px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0" id="numerito_bola_perfil">1</button>
                                                    <button class="relative inline-flex items-center px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0" id="numerito_bola_perfil">2</button>
                                                    <button class="relative inline-flex items-center px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0 md:inline-flex" id="numerito_bola_perfil">3</button>
                                                    <button class="relative inline-flex items-center px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0 md:inline-flex" id="numerito_bola_perfil">4</button>
                                                    <button class="relative inline-flex items-center px-3 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0" id="numerito_bola_perfil">5</button>
                                                    </a>
                                                </nav>
                                                </div>
                                                <div>
                                                    <p class="text-gray-700 px-1 sm:px-4">
                                                        COOL
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>     
                        </div>


                        <!-- PUBS FAVS  -->
                                <!-- post header-->
                 <%
    int u = Integer.parseInt(request.getParameter("id"));                       
        InterFavService favService = new InterFavService();
        List<InterFav>cont = favService.getInterFavList(u);

    if (cont != null && cont.size() > 0) {
    for (InterFav interFav : cont) {

    List<InterPub>liste = pubHelper.getListT();
    if( list != null && list.size() > 0)
    {
    for(InterPub trows : list)
    {
       InterUsersService dao = new InterUsersService();
       InterUsers interUsers = dao.getInterUsersByPubNumId(trows.getPubNumId());

        if (interUsers != null) {
        String data1 = interUsers.getIImgNum();
        if (data1 != null) {}
            else{data1 = "perfilsidebar.png";}

              if (interFav.getFavIdPub().equals(trows.getPubNumId())) {

        String horita = trows.getPubHour().substring(0,5);

%>                   
                            <div class="card lg:mx-0 uk-animation-slide-bottom-small" id="posts_feed">
                                    <div class="flex justify-between items-center lg:p-4 p-2.5">
                                        
                                        <div class="flex flex-1 items-center space-x-4">
                                            <a href="profile-new.jsp?id=<%=interUsers.getIUserNum()%>">
                                                <img src="../assets/images/avatars/<%=data1%>" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                            </a>
                                            <div class="flex-1 font-semibold capitalize">
                                                
                                                <a href="profile-new.jsp?id=<%=interUsers.getIUserNum()%>" class="text-black dark:text-gray-100">  <c:out value='<%=interUsers.getIUser()%>'/>  <span class="text-gray-700"><%=horita%>hrs</span></a>
                                                <div class="text-gray-700 flex items-center space-x-2"><%=trows.getPubDate()%> <ion-icon name="people"></ion-icon></div>
                                                
                                            </div>
                                        </div>
                                      <div>
                                        <a href=""> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                        uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                      
                                            <ul class="space-y-0">
                                              <% if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {%>  
                                              <li> 
                                                  <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                   <i class="uil-edit-alt mr-1"></i>  Editar publicacion
                                                  </a> 
                                              </li>
                                              <li> 
                                                  <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                   <i class="uil-comment-slash mr-1"></i>  Desactivar
                                                  </a> 
                                              </li> 
                                              <li>
                                                <hr class="-mx-2 my-2 dark:border-gray-800">
                                              </li>
                                              <%} if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())  ||  sesion.getAttribute("SIRol").equals("Administrador")) {%>
                                              <li> 
                                                  <a href="../zProcesos/eliminarPub.jsp?eliminar=<%=trows.getPubNumId()%>&per=<%=interUsers.getIUserNum()%>&direct=1" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                   <i class="uil-trash-alt mr-1"></i>  Eliminar
                                                  </a> 
                                              </li>
                                              <%}if (!sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {%>
                                              <li> 
                                                  <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                      <i class="icon-feather-alert-circle mr-1"></i>  Reportar
                                                  </a> 
                                              </li>
                                              <%}%>
                                            </ul>
                                        </div>
                                      </div>
                                    </div>                       
                        
                                    <div class="p-4 pt-0 border-b dark:border-gray-700">
                        
                                        <p class="post-text"><c:out value='<%=trows.getPubCont()%>'/></p>
                        
                                    </div>
                                    
                        
                                    <div class="p-4 space-y-3"> 
                                       
                                        <div class="flex space-x-4 lg:font-bold">
                                        <%  
                                            InterLoveService lovee = new InterLoveService();
                                            int LoveID = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
                                            boolean seguirLove = lovee.isUserLove(trows.getPubNumId(), LoveID );        
                                            if (seguirLove) {
                                        %>
                                            <a href="../zProcesos/loveService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Lovent" 
                                                class="flex items-center space-x-2" 
                                                style="color: #6B64F4;">
                                                 <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                     <span style="color: #6B64F4;"> <%=trows.getPubMg()%></span>
                                                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100" style="fill: #6B64F4;">
                                                         <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
                                                     </svg>
                                                 </div>
                                                 <div> - Amor</div>
                                             </a>
                        <%}else{%>
                                            <a href="../zProcesos/loveService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Love" 
                                                class="flex items-center space-x-2"
                                                onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4'); this.querySelector('span').style.color = '#6B64F4';" 
                                                onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = ''); this.querySelector('span').style.color = '';">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <span><%=trows.getPubMg()%></span>
                                                   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                      <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
                                                   </svg>
                                                </div>
                                                <div> + Amor</div>
                                             </a>
                        <%}%>
                        
                                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                                            InterFavService fav = new InterFavService();
                                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                                            boolean seguir = fav.isUserFav(trows.getPubNumId(), FlowSeguidorID );        
                                            if (seguir == true ) {
                                        %>
                                            <a href="../zProcesos/favService.jsp?id=<%=request.getParameter("id")%>&&pub=<%=trows.getPubNumId()%>&&chest=profile&&action1=Favoritont" 
                                                class="flex items-center space-x-2"
                                                style="color: #F6CE2F;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100" style="fill: #F6CE2F;">
                                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                    </svg>
                                                </div>
                                                <div>- Favorito</div>
                                            </a>
                        <%}else{%>             
                                            <a href="../zProcesos/favService.jsp?id=<%=request.getParameter("id")%>&&pub=<%=trows.getPubNumId()%>&&chest=profile&&action1=Favorito" 
                                            class="flex items-center space-x-2"
                                            onmouseover="this.style.color='#F6CE2F'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#F6CE2F')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                                                <div class="flex items-center p-2 rounded-full p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                    </svg>
                                                </div>
                                                <div>+ Favorito</div>
                                            </a>
                        <%}}%>
                                        <%  if (!interUsers.getIUser().equals(sesion.getAttribute("SIUser"))) {
                                            InterFlowService flowww = new InterFlowService();
                                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                                            boolean seguir = flowww.isUserFollowing(interUsers.getIUserNum(), FlowSeguidorID );        
                                            if (seguir == true ) {
                                        %>
                                            <a href="../zProcesos/seguirnt.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed" 
                                            class="flex items-center space-x-2 flex-1 justify-end" 
                                            style="color: #EB74DB;">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" style="fill: #EB74DB;" class="dark:text-gray-100">
                                                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> - Seguir </div>
                                            </a>
                        <%}else{%>
                                            <a href="../zProcesos/seguir.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed" class="flex items-center space-x-2 flex-1 justify-end" 
                                            onmouseover="this.style.color='#EB74DB'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#EB74DB')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                                                <div class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> + Seguir </div>
                                            </a>
                                            
                        <%}}%>
                                            <a href="#" class="flex items-center space-x-2 flex-1 justify-end" 
                                            onmouseover="this.style.color='#4FC0E8'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#4FC0E8')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                                                <div class="flex items-center p-2 rounded-full p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                        <path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                                <div> Comentario</div>
                                            </a>
                                            
                                        </div>
                                        
                                        <!--  
                                        <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                            <div class="flex">
                                                <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                    <img src="assets/images/avatars/prof6.png" alt="" class="absolute h-full rounded-full">
                                                </div>
                                                <div>
                                                    <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                        <p class="leading-6">Un comentario <urna class="i uil-heart"></urna> <i
                                                                class="uil-grin-tongue-wink"> </i> </p>
                                                        <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                    </div>
                                                    <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                        <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                        <a href="#"> Replay </a>
                                                        <span> 3d </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                            <input placeholder="Agregar un comentario" class="bg-transparent max-h-10 shadow-none px-5">
                                            <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                 
                                            </div>
                                        </div>
                                        -->
                                    </div>
                    <%
                        }}}}}}
                    %> 
                        </div>  
                                        <script>
                                            function toggleContainer(clave) {
                                                var vari = clave;
                                                var innerContainer = document.getElementById('inner-container-' + vari);
                                                innerContainer.style.display = (innerContainer.style.display === 'none' || innerContainer.style.display === '') ? 'block' : 'none';
                                            }
                                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
                        
                        
                        
                        
                                
                                         <!-------------------------IMPORTANTE - CAMBIOS - Editar-------------------------------->
                               <!----------- Edit modal-------------->
                               <div id="create-post-modal-edit" class="create-post" uk-modal>
                                <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
                                    
                                    <div class="text-center py-4 border-b">
                                        <h3 class="text-lg font-semibold"> Editar post </h3>
                                        <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                                    </div>
                                    <div class="lg:mx-0 uk-animation-slide-bottom-small" id="posts_feed">
                           
                                        <div class="flex justify-between items-center lg:p-4 p-2.5">
                                            <div class="flex flex-1 items-center space-x-4">
                                                <a href="#">
                                                    <img src="../assets/images/avatars/prof3.png" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                                </a>
                                                <div class="flex-1 font-semibold capitalize">
                                                    <a href="#" class="text-black dark:text-gray-100" id="name_user_tittle">  Ferdinand Vs  </a>
                                                    <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                                </div>
                                            </div>
                                        </div>   

                                        <div class="p-5 pt-0 dark:border-gray-700 border-b">
                                            <!--Imput para editar texto-->
                                            <input class="uk-textare text-gray-700 shadow-none"
                                            value="Lorem ipsum dolor sit amet, consectetuer adipiscing elit">                       
                                        </div>
                                       
                                        <div class="px-4 sm:flex sm:flex-row-reverse ">
                                            <button type="button" class="button bg-blue-700 inline-flex w-full justify-center rounded-md px-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 sm:ml-3 sm:w-auto"> Publicar </button>
                                        </div>                    
                                    </div>       
                                </div>
                            </div>

    
    
    

                         <!-- Craete post modal -->
                            <div id="create-post-modal" class="create-post" uk-modal>
                                <div
                                    class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
                            
                                    <div class="text-center py-4 border-b">
                                        <h3 class="text-lg font-semibold"> Cuentanos tu pensamiento <c:out value='<%=sesion.getAttribute("SIUser")%>'/> </h3>
                                        <%
                                        String[] partes =horaFormateada.split(" ");
                                        String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                                        String hora12 = partes[5];
                                        %>   
                                        <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                                    </div>
                                        <form id="formulario3" method="POST" accept-charset="UTF-8" onsubmit="doPub();" >
                                    <div class="flex flex-1 items-start space-x-4 p-5">
                                        <img src="../assets/images/avatars/<c:out value='<%=data%>'/>"
                                            class="bg-gray-200 border border-white rounded-full w-11 h-11">
                                        <div class="flex-1 pt-2">
                                            <textarea id="PubCont" name="PubCont" class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" maxlength="1250" rows="5" placeholder="¿Tienes algo que compartir?"></textarea>
                                        <input type="hidden" id="guardar" name="guardar" value="Submit" />
                                        <input type="hidden" name="PubDate" id="PubDate" value="<%=fecha12%>" />
                                        <input type="hidden" name="PubHour" id="PubHour" value="<%=hora12%>" />
                                        </div>
                            
                                    </div>
                                    <div class="bsolute bottom-0 p-4 space-x-4 w-full">
                                        <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-3 shadow-sm items-center">
                                            <button type="submit" class="button bg-blue-700" id="guardadito"> Publicar </button>
                                            <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">
                                            
                                                <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                                <svg class="text-red-600 h-9 p-1.5 rounded-full bg-red-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z"> </path></svg>
                                                <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                                <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"> </path></svg>
                                                
                                                <!-- view more -->
                                                <svg class="hover:bg-gray-200 h-9 p-1.5 rounded-full w-9 cursor-pointer" id="veiw-more" uk-toggle="target: #veiw-more; animation: uk-animation-fade" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"> </path></svg>
                                            
                                            </div>
                                        </div>
                                    </div>   
                                        </form>
                                </div>
                            </div>
    

    <script>
        $(document).ready(function () {
            $("#button_search").click(function () {
                $(".sidebar-search").fadeToggle();
            });
        });
    
        $(document).ready(function () {
            $("#button_close_offensive").click(function () {
                $(".modal_offensive_announce").fadeOut();
            });
        });
    
    </script>

    
    <!-- Modo oscuro -->
    <script>
        (function (window, document, undefined) {
            'use strict';
            if (!('localStorage' in window)) return;
            var nightMode = localStorage.getItem('gmtNightMode');
            if (nightMode) {
                document.documentElement.className += ' night-mode';
            }
        })(window, document);
    
        (function (window, document, undefined) {
    
            'use strict';
    
            // Feature test
            if (!('localStorage' in window)) return;
    
            // Get our newly insert toggle
            var nightMode = document.querySelector('#night-mode');
            if (!nightMode) return;
    
            // When clicked, toggle night mode on or off
            nightMode.addEventListener('click', function (event) {
                event.preventDefault();
                document.documentElement.classList.toggle('dark');
                if (document.documentElement.classList.contains('dark')) {
                    localStorage.setItem('gmtNightMode', true);
                    return;
                }
                localStorage.removeItem('gmtNightMode');
            }, false);
    
        })(window, document);
    </script>
  
    <!-- Javascript
    ================================================== --> 
    <script src="../assets/js/tippy.all.min.js"></script>
    <script src="../assets/js/uikit.js"></script>
    <script src="../assets/js/simplebar.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/bootstrap-select.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                                            <script>
                                                function handleButtonHover1(button, isHover) {
                                                    if (isHover) {
                                                        button.style.color = '#6B64F4';
                                                        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4');
                                                        button.querySelector('span').style.color = '#6B64F4';
                                                    } else {
                                                        button.style.color = '';
                                                        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '');
                                                        button.querySelector('span').style.color = '';
                                                    }
                                                }
                                            </script>
                                            <script>
                                                function handleButtonHover(button, isHover) {
                                                    if (isHover) {
                                                        button.style.color = '#F6CE2F';
                                                        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '#F6CE2F');
                                                    } else {
                                                        button.style.color = '';
                                                        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '');
                                                    }
                                                }
                                            </script>
                                            <script>
                                                function handleButtonHover2(button, isHover) {
                                                    if (isHover) {
                                                        button.style.color = '#EB74DB';
                                                        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '#EB74DB');
                                                    } else {
                                                        button.style.color = '';
                                                        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '');
                                                    }
                                                }
                                            </script>
<script>
    function enviarAmor(pub1, action) {
        var url = '/Psyness/MeGustaServlet?pub=' + pub1 + '&action1=' + action;

        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                // Manejar la respuesta del servidor si es necesario
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

        // Devuelve false para evitar la recarga de la página
        return false;
    }
</script>
<script>
    function agregarFav(pub1, action) {
        var url = '/Psyness/FavoritoServlet?pub=' + pub1 + '&action1=' + action;

        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                // Manejar la respuesta del servidor si es necesario
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

        // Devuelve false para evitar la recarga de la página
        return false;
    }
</script>
<script>
    function agregarSeguido(num, action) {
        var url = '/Psyness/SeguidoresServlet?id=' + num + '&action1=' + action;
        console.log("numero:",num,"acccion:",action)
        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                console.log("funciono")
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

        // Devuelve false para evitar la recarga de la página
        return false;
    }
</script>
</body>
</html>
