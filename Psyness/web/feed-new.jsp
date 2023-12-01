<%-- 
    Document   : feed - new
    Created on : 23 nov. 2023, 18:54:17
    Author     : admin
--%>

<%@page import="org.axocode.dao.InterComent"%>
<%@page import="org.axocode.dao.service.InterComentService"%>
<%@page import="org.axocode.helper.InterComentHelper"%>
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
        <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">
        <title>Feed - Psyness</title>

            <!-- Favicon -->
        <link href="assets/images/Icono.svg" rel="icon" type="image/png">


            <!-- icons ================================================== -->
        <link rel="stylesheet" href="assets/css/icons.css">

            <!-----Boxicons------->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

            <!-----Bootstrap------->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
       
            <!-----Fontawesome------->
        <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
            <!-----JQuery------->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    
            <!-- CSS ================================================== --> 
        <link rel="stylesheet" href="assets/css/uikit.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/style2.css">
        <link href="assets/css/tailwind.css" rel="stylesheet"> 
        <link rel="stylesheet" href="assets/css/cambios.css">

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
                Helpers helperss = null;
                InterPub user = null;
                String aux = null;
                boolean flag = false;
                String readonly = null;
                aux = "Guardar";
                readonly = "";
                String guardar = request.getParameter("guardar");
                String comentar = request.getParameter("comentar");
                int seguidores = 0;
                int seguidos = 0;
                int PubNumIdefinitivo;
                helpers = new InterPubHelper( ).addRequest( request );
                helperss = new InterComentHelper( ).addRequest( request );
                ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
                ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
                String horaFormateada = horaCiudadMexico.format(formatter);
                
                
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
                String horaFormateada2 = horaCiudadMexico.format(formatter2);
                
                
                
                user = new InterPub(); 
                user.setPubCont("");    
                if ("Submit".equals(comentar)) {
                        flag = helperss.addT();
                        response.sendRedirect("error.jsp?direct=2&&place="+request.getParameter("ComentPubNumId"));
                    }
                    
                    
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
                            response.sendRedirect("error.jsp?direct=0");     
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
                                response.sendRedirect("error.jsp?direct=0");
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
                            <img src="assets/images/avatars/Logo con letras centrado.svg" alt="">
                            <img src="assets/images/avatars/Logo con letras centrado.svg" class="logo_mobile" alt="">
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
                        <a href="#D">
                            <img src="assets/images/avatars/<%=data%>" class="is_avatar" alt="">
                        </a>
                        <div uk-drop="mode: click;offset:5" class="header_dropdown profile_dropdown">

                            <a href="profile-new.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="user">
                                <div class="user_avatar">
                                    <img src="assets/images/avatars/<%=data%>" alt="">
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
                            <a href="index.jsp?cerrar=true">
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
    
    <aside class="sidebar_feed">

        <div class="sidebar_header">
            <!--<img src="images/sololetras.svg" class="logo-img_sidebar">-->
            <h1>Psyness</h1>
            <img src="images/Icono.svg" class="logo-icon_sidebar">
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

            <button onclick="location.href='data-new.jsp'">
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
                        <img src="images/<%=sesion.getAttribute("SIImgNum")%>" alt="" class="profile-img">
                        <span>Perfil</span>
                    </span>
            </button>
            
            <button onclick="location.href='settings-new.jsp'">
                <span>
                    <i class='bx bx-cog' ></i>  
                    <span>Configuración</span>
                </span>
            </button>
            
                        <button onclick="location.href='index.jsp?cerrar=true'">
                <span>
                    <i class='bx bx-log-out'></i>
                    <span>Salir</span>
                </span>
            </button>
        </nav>
    </aside>

        <!---------------SIDEBAR BUSCAR----------------->

    <nav class="sidebar-search">

        <div class="search-header">
            <p>Buscar</p>
        </div>
        <%
    String searchTerm = request.getParameter("term");
    if (searchTerm == null) {
            
        %>
        <nav>
            <input id="campoBusqueda" type="text" onkeydown="buscarEnEnter(event)" placeholder="Buscar" autofocus>
        </nav>
        <%}else{%>
        <nav>
            <input id="campoBusqueda" type="text" onkeydown="buscarEnEnter(event)" placeholder="Buscar" value="<%=searchTerm%>" autofocus>
        </nav>
        <%}%>
        <nav class="profiles_search"><hr>

            <div class="subtitle_search">
                <p>Recientes
                    <span>Borrar todo</span>
                </p>
            </div>

<%
    List<InterUsers> usersList = new InterUsersService().getInterUsersListByTerm(searchTerm);
    if (usersList != null && usersList.size() > 0) {
            
    for( InterUsers lista : usersList){
    
%>
            <div  class="box_profile_search" onclick="location.href='profile-new.jsp?id=<%=lista.getIUserNum()%>'">
                <img src="images/<%=lista.getIImgNum()%>" class="img_search">
                    <p><%=lista.getIUser()%>
                        <span><%=lista.getIAge()%></span>
                    </p>
                <div class="icons_X">
                    <i class='bx bx-x'></i>
                </div> 
            </div>
  <%}}%>

        </nav>
    </nav>


        <!---------------CREAR----------------->
    

        <!-- Main Contents -->
                <div class="main_content">
                    <div class="mcontainer">
                            <!-- Perfil -->
                        <div class="md:flex md:space-x-6 lg:mx-16">
                            <div class="space-y-5 flex-shrink-0 md:w-7/12">
              
                                   <!-- Crear publiccion  -->
                                   <div class="card lg:mx-0 p-4" uk-toggle="target: #create-post-modal" id="card_posting">
                                       <div class="flex space-x-3">
                                           <img src="assets/images/avatars/<%=data%>" class="w-10 h-10 rounded-full">
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
                                    <!-- post header-->
                                <div class="card lg:mx-0 uk-animation-slide-bottom-small" id="posts_feed">
                           
                                    <div class="flex justify-between items-center lg:p-4 p-2.5" id="<%=trows.getPubNumId()%>">
                                        
                                        <div class="flex flex-1 items-center space-x-4">
                                            <a href="profile-new.jsp?id=<%=interUsers.getIUserNum()%>">
                                                <img src="assets/images/avatars/<%=data1%>" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                            </a>
                                            <div class="flex-1 font-semibold capitalize">
                                                
                                                <a href="profile-new.jsp?id=<%=interUsers.getIUserNum()%>" class="text-black dark:text-white" id="name_user_feed">  <c:out value='<%=interUsers.getIUser()%>'/>  <span class="text-gray-700"><%=horita%>hrs</span></a>
                                                <div class="text-gray-700 flex items-center space-x-2"><%=trows.getPubDate()%> <ion-icon name="people"></ion-icon></div>
                                                
                                            </div>
                                        </div>
                                      <div>
                                        <a href=""> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i></a>
                                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                        uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                      
                                            <ul class="space-y-0">
                                              <% if (sesion.getAttribute("SIUser").equals(interUsers.getIUser())) {%>  
                                              <li uk-toggle="target: #create-post-modal-edit" > 
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
                                                  <a href="eliminarPub.jsp?eliminar=<%=trows.getPubNumId()%>&per=<%=interUsers.getIUserNum()%>&direct=0" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
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
                                            <a href="loveService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Lovent" 
                                                class="flex items-center space-x-2" 
                                                style="color: #6B64F4;">
                                                 <div id="likesito" class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
                                                     <span style="color: #6B64F4;"> <%=trows.getPubMg()%></span>
                                                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100" style="fill: #6B64F4;">
                                                         <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
                                                     </svg>
                                                 </div>
                                                 <div> - Amor</div>
                                             </a>
                        <%}else{%>
                                            <a href="loveService.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Love" 
                                                class="flex items-center space-x-2"
                                                onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4'); this.querySelector('span').style.color = '#6B64F4';" 
                                                onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = ''); this.querySelector('span').style.color = '';">
                                                <div id="likesito" class="flex items-center p-2 rounded-full text-black lg:bg-gray-100 dark:bg-gray-600">
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
                                            <a href="favService.jsp?pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Favoritont" 
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
                                            <a href="favService.jsp?pub=<%=trows.getPubNumId()%>&&chest=feed&&action1=Favorito" 
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
                                            <a href="seguirnt.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed" 
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
                                            <a href="seguir.jsp?id=<%=interUsers.getIUserNum()%>&&pub=<%=trows.getPubNumId()%>&&chest=feed" class="flex items-center space-x-2 flex-1 justify-end" 
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
                                            <p class="px-4 sm:flex sm:flex-row-reverse hover:text-blue-600" onclick="toggleContainer()">Ver Comentarios </p>

                                            <div id="inner-container" class="inner-container">
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
                                                            <img src="assets/images/avatars/<%=persona.getIImgNum()%>" alt="" class="absolute h-full rounded-full">
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


                                        
                                        <div id="card_posting">
                                            <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                                <div onclick="location.href='feed-new.jsp?coment=<%=trows.getPubNumId()%>#<%=trows.getPubNumId()%>'" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full" style="display: flex; align-items: center; color: #b0b0b0; height: 40px; border: none; font-size: 15px;">Agregar comentario</div>
                                            </div>
                                        </div>    
                                        <!--FIN - Cambios-->
                                        
                                        
                                        
                                    </div>
                                </div>      
                                    <%
                                        }}}
                                    %>
                            </div>
            
                        </div>
                            <%
                                        String[] partes =horaFormateada.split(" ");
                                        String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                                        String hora12 = partes[5];
                                        %> 
                            <!-------------------------IMPORTANTE - CAMBIOS - Comentarios-------------------------------->
                               <!-- Comment modal -->
                            <div id="create-comment-modal" class="create-post" uk-modal>
                                <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
                                    
                                    <div class="text-center py-4 border-b">
                                        <h3 class="text-lg font-semibold"> Comentar post </h3>
                                        <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                                    </div>
                                    <form id="formulario3" method="POST" accept-charset="UTF-8" onsubmit="doPub();" >
                                    <div class="flex flex-1 items-start space-x-4 p-5">
                                        <img src="assets/images/avatars/<c:out value='<%=data%>'/>"
                                            class="bg-gray-200 border border-white rounded-full w-11 h-11">
                                        <div class="flex-1 pt-2">
                                        <textarea id="ComentCont" name="ComentCont" class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5" placeholder="¿Tienes algo que compartir?" maxlength="1250" autofocus></textarea>
                                        <input type="hidden" id="comentar" name="comentar" value="Submit" />
                                        <input type="hidden" name="ComentDate" id="ComentDate" value="<%=fecha12%>" />
                                        <input type="hidden" name="ComentHour" id="ComentHour" value="<%=hora12%>" />
                                        <input type="hidden" name="ComentPubNumId" id="ComentPubNumId" value="<%=request.getParameter("coment")%>" />
                                        <input type="hidden" name="ComentIUserNum" id="ComentIUserNum" value="<%=sesion.getAttribute("SIUserNum")%>" />
                                        </div>
                                    </div>

                                        

                                    <div class="bsolute bottom-0 p-4 space-x-4 w-full">
                                        <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-3 shadow-sm items-center">
                                            <button type="submit" id="guardadito" class="button bg-blue-700"> Publicar </button>
                                            
                                            <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">
                                            
                                                <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                                <svg class="text-red-600 h-9 p-1.5 rounded-full bg-red-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z"> </path></svg>
                                                <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                                <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"> </path></svg>
                                                
                                            </div>
                                        </div>                   
                                    </div> 
                                    </form>
                                </div>
                            </div>

                            
                            <!------------------------------IMPORTANTE - CAMBIOS - Publicar---------------------------------------------->
                            <!-- Craete post modal -->
                            <div id="create-post-modal" class="create-post" uk-modal>
                                <div
                                    class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
                            
                                    <div class="text-center py-4 border-b">
                                        <h3 class="text-lg font-semibold"> Cuentanos tu pensamiento <c:out value='<%=sesion.getAttribute("SIUser")%>'/> </h3>  
                                        <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                                    </div>
                                        <form id="formulario3" method="POST" accept-charset="UTF-8" onsubmit="doPub();" >
                                    <div class="flex flex-1 items-start space-x-4 p-5">
                                        <img src="assets/images/avatars/<c:out value='<%=data%>'/>"
                                            class="bg-gray-200 border border-white rounded-full w-11 h-11">
                                        <div class="flex-1 pt-2">
                                            <textarea id="PubCont" name="PubCont" class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5" placeholder="¿Tienes algo que compartir?" maxlength="1250" autofocus></textarea>
                                        <input type="hidden" id="guardar" name="guardar" value="Submit" />
                                        <input type="hidden" name="PubDate" id="PubDate" value="<%=fecha12%>" />
                                        <input type="hidden" name="PubHour" id="PubHour" value="<%=hora12%>" />
                                        </div>
                                        
                                         <!-------------------------IMPORTANTE - CAMBIOS-------------------------------->
                                             <div>
                                                <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-5 dark:hover:bg-gray-700"></i> </a>
                                                    <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                                  
                                                        <ul class="space-y-1">
                                                          <li> 
                                                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                               <i class="icon-brand-font-awesome-flag mr-3" id="iconito_edit_post"></i> <p id="iconito_edit_post">Pública</p>
                                                              </a> 
                                                          </li>
                                                          <li> 
                                                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                               <i class="uil-lock-alt mr-2" id="iconito_edit_post"></i> <p id="iconito_edit_post">Privada</p>
                                                              </a> 
                                                          </li>
                                                          <li> 
                                                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                               <i class="uil-comment-plus mr-2" id="iconito_edit_post"></i> <p id="iconito_edit_post">No sé</p>
                                                              </a> 
                                                          </li> 
                                                        </ul>
                                                    
                                                    </div>
                                            </div>
                            
                                    </div>
                                        
                                        <!---------CAMBIOS-------------->
                                            <!--Etiquetas-->
                                            <div class="space-x-4 p-5" id="tags-container">
                                                <script>
                                                    function agregarEtiqueta(categoria) {
                                                        const tagsContainer = document.getElementById('tags-container');
                                            
                                                        // Primero creo la etiqueta
                                                        const tag = document.createElement('div');
                                                        tag.className = 'tag';
                                                        tag.textContent = categoria;
                                            
                                                        // Esto es para el botón "X" para cerrar la etiqueta
                                                        const closeBtn = document.createElement('span');
                                                        closeBtn.className = 'close-btn';
                                                        closeBtn.innerHTML = 'X';
                                            
                                                        // Agrego un manejador de eventos al botón para quitar la etiqueta
                                                        closeBtn.addEventListener('click', function() {
                                                            tagsContainer.removeChild(tag);
                                                        });
                                            
                                                        // Agrego el botón "X" a la etiqueta
                                                        tag.appendChild(closeBtn);
                                            
                                                        // Agrego la etiqueta al contenedor
                                                        tagsContainer.appendChild(tag);
                                                    }
                                                </script>
                                            </div>

                                            <!--Fin - Cambios-->
                                        
                                        
                                        
                                        
                                    <div class="bsolute bottom-0 p-4 space-x-4 w-full">
                                        <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-3 shadow-sm items-center">
                                            <button type="submit" class="button bg-blue-700" id="guardadito"> Publicar </button>
                                            <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">
                                            
                                                <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                                <svg class="text-red-600 h-9 p-1.5 rounded-full bg-red-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z"> </path></svg>
                                                <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                                <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"> </path></svg>
                                                
                                                <!-- TRES PUNTOS - etiquetas -->
                                                <div>
                                                    <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-2 dark:hover:bg-gray-700"></i> </a>
                                                        <div class="overflow-auto bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                                        uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                                      
                                                            <ul class="space-y-1 max-h-56">
                                                              <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Ansiedad')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon><p id="iconito_edit_post">Ansiedad</p></button>
                                                             </li>
                                                             <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Depresion')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon><p id="iconito_edit_post">Depresion</p> </button>
                                                             </li>
                                                             <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Suicidio')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon><p id="iconito_edit_post">Suicidio</p> </button>
                                                             </li>
                                                             <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Bipolaridad')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon> <p id="iconito_edit_post">Bipolaridad</p> </button>
                                                             </li>
                                                             <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Estres')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon> <p id="iconito_edit_post">Estres</p></button>
                                                             </li>
                                                             <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Autismo')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon> <p id="iconito_edit_post">Autismo</p> </button>
                                                             </li>
                                                             <li>
                                                                <button class="flex items-center w-full px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800" onclick="agregarEtiqueta('Otros')"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-500 text-xl p-1 mr-3" id="iconito_edit_post"></ion-icon> <p id="iconito_edit_post">Otros</p></button>
                                                             </li>
                                                             <!-- No hacerle caso

                                                                 <li> 
                                                                     <a href="#" class="flex items-center px-6 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                                         <button onclick="agregarEtiqueta('Estres')">Estres</button>
                                                                        </a> 
                                                                    </li> 
                                                            -->
                                                            </ul>
                                                        </div>
                                                </div>

                                                <!--Fin cambios-->
                                            </div>
                                        </div>
                                    </div>   
                                        </form>
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
                                                    <img src="assets/images/avatars/prof3.png" class="bg-gray-200 border border-white rounded-full w-10 h-10">
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



                            <!-- Modal para publicaciones ofensivas -->

                            <div class="modal_offensive" id="modal_offensive_announce">
                                <div class="relative z-10" aria-labelledby="modal-title" role="dialog" aria-modal="true">
                                    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>
                                    <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
                                        <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">

                                            <!--Panel-->
                                            <div class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
                                            <div class="bg-white px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
                                                <div class="sm:flex sm:items-start">
                                                <div class="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
                                                    <svg class="h-6 w-6 text-red-600" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
                                                    </svg>
                                                </div>
                                                <div class="mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left">
                                                    <h3 class="text-base font-semibold leading-6 text-gray-900" id="modal-title">Comentario ofensivo</h3>
                                                    <div class="mt-2">
                                                    <p class="text-sm text-gray-500">Puede que tu publicación, contenga contenido sensible para otros usuarios.</p>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
                                                <button type="button" id="button_close_offensive" class="inline-flex w-full justify-center rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 sm:ml-3 sm:w-auto">Cerrar</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                    <!---------------PERFILES----------------->

                        <div class="lado_derecho">                          
                            <div class="right_sidebar_feed">
                                <div class="w-full space-y-6">
                                            
                                    <div class="card lg:mx-0 p-9" id="contenedor_side_right_pf">
                                        <div class="boxesita_rights_feed">

                                            <a href="profile-new.jsp?id=<%=sesion.getAttribute("SIUserNum")%>">
                                                <img src="assets/images/avatars/<%=data%>" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                            </a>
                                            <div class="flex-1 font-semibold capitalize">
                                                <a href="profile-new.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="text-black dark:text-white" id="name_user_feed"><c:out value='<%=sesion.getAttribute("SIUser")%>'/></a>
                                                <div class="text-gray-500 flex items-center space-x-2"><span><%=sesion.getAttribute("SIAge")%></span></div>
                                            </div>
                                        </div>
                                        <a href="follow-new.jsp?follows=<%=sesion.getAttribute("SIUserNum")%>"
                                        onmouseover="this.style.color='#141414'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#141414')" 
                                        onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                                        <ul class="text-gray-600 space-y-3 mt-3">
                                            <li class="flex items-center space-x-2"> 
                                                <ion-icon name="home-sharp" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                Seguidores <strong> <%=seguidores%>  </strong>
                                            </li>
                                            <li class="flex items-center space-x-2"> 
                                                <ion-icon name="globe" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                Seguidos <strong> <%=seguidos%> </strong>
                                            </li>                                         
                                        </ul>
                                        </a>
                                    </div>                    
                                </div>
                                            
                                            <!-------------------------IMPORTANTE - CAMBIOS-------------------------------->
                                <!---------------WAVE--------------->


                                <div class=" wave_feed">
                                       <%
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
                                    <div class="w-full space-y-6">
                    
                                        <div class="card lg:mx-0 p-9 overflow-auto" id="contenedor_side_right">
                                            
                                            <div class="titulo_wave">
                                                <h3 class="text-center text-lg font-semibold "> WAVE DIARIA </h3>
                                                <hr class="-mx-2 my-2 dark:border-gray-800">
                                            </div>

                                            <div class="boxesita_rights_feed ">
                                                <a href="profile-new.jsp?id=<%=waveUsers.getIUserNum()%>">
                                                    <img src="assets/images/avatars/<%=waveUsers.getIImgNum()%>" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                </a>
                                                                                       
                                                <div class="flex-1 font-semibold capitalize ">
                                                    <a href="profile-new.jsp?id=<%=waveUsers.getIUserNum()%>" class="text-black dark:text-white" id="name_user_feed"> <%=waveUsers.getIUser()%> </a>
                                                    <div class="text-gray-500 flex items-center space-x-2 "><%=wave.getPubDate()%></div>
                                                </div>
                                            </div>

                                            <div class="segunda_boxesita_rights_feed" id="second_box_right_feed">
                                                <div class="p-2 pt-1 border-b dark:border-gray-700" id="texto_feed_wave">                      
                                                    <%=wave.getPubCont()%>
                                                </div>

                                                <ul class="text-gray-600 space-y-3 mt-3">
                                                    <li class="flex items-center space-x-2"> 
                                                        <ion-icon name="home-sharp" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                        Amor <strong> <%=wave.getPubMg()%>  </strong>
                                                    </li>
                                                </ul>
                                            </div>  

                                        </div>                    
                                            
                                    </div>
                                 <%}%>
                                </div>
                                
                                
                            </div>    
                        </div>
                    </div>    
                </div> 
            </div>    

                      
                                <!--Fin - Cambios-->

                               
                            <script>
                              function buscarEnEnter(event) {
                                if (event.key === "Enter") {
                                  buscarEnTiempoReal();
                                }
                              }

                              function buscarEnTiempoReal() {
                                var campoBusqueda = document.getElementById("campoBusqueda");
                                var valor = campoBusqueda.value;

                                location.href = "feed-new.jsp?term=" + encodeURIComponent(valor);
                              }
                            </script>


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
     <script src="../../code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="assets/js/tippy.all.min.js"></script>
    <script src="assets/js/uikit.js"></script>
    <script src="assets/js/simplebar.js"></script>
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="../../unpkg.com/ionicons%405.2.3/dist/ionicons.js"></script>
    
</body>  
<% String coment = request.getParameter("coment"); %>
<script>
    document.addEventListener("DOMContentLoaded", function(event) { 
        var coment = "<%= coment %>";
        if (coment !== null && coment !== 'null' && coment.trim() !== '') {
            UIkit.modal("#create-comment-modal").show();
        }
    });
</script>

</html>    