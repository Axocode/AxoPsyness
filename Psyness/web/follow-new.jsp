<%-- 
    Document   : follow-new
    Created on : 23 nov. 2023, 19:16:07
    Author     : admin
--%>

<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">
    <title>Follow - Psyness</title>

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

<%        request.setCharacterEncoding("UTF-8");          
          HttpSession sesion = request.getSession();
          String nombreper = null;
          String seguidormain = null;
          InterUsersHelper userHelper = new InterUsersHelper();       
          int IdS = Integer.parseInt(request.getParameter("follows"));
          InterUsersService dao = new InterUsersService();
          List<InterUsers>listita = userHelper.getListT();
          int postK = 0;
        
        if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           if ((request.getParameter("follows").toString()).equals(interUsers.getIUserNum().toString())) {
            nombreper = (interUsers.getIUser());
            postK = interUsers.getIUserNum();
    }}}}
     if (nombreper.equals(session.getAttribute("SIUser"))) {
            seguidormain = "sigue";
        }
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
                            <img src="assets/images/avatars/<%=sesion.getAttribute("SIImgNum")%>" class="is_avatar" alt="">
                        </a>
                        <div uk-drop="mode: click;offset:5" class="header_dropdown profile_dropdown">

                            <a href="profile-new.jsp?id=<%=sesion.getAttribute("SIUserNum")%>" class="user">
                                <div class="user_avatar">
                                    <img src="assets/images/avatars/<%=sesion.getAttribute("SIImgNum")%>" alt="">
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
                            <a href="index?cerrar=true">
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

            <button>
                <span>
                    <i class='bx bx-user-voice' ></i>
                    <span>Datacenter</span>
                </span>
            </button>

            <button>
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

    <<nav class="sidebar-search">

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
    List<InterUsers> usersListi = new InterUsersService().getInterUsersListByTerm(searchTerm);
    if (usersListi != null && usersListi.size() > 0) {
            
    for( InterUsers lista : usersListi){
    
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


        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">
                <div class="contenedor_info_user">

                    <div class="lg:flex lg:space-x-10">

                        <div class="lg:w-2/3">
                            <div class="flex justify-between items-center relative md:mb-4 mb-3">
                                <div class="flex-1">
                                    <h2 class="text-2xl font-semibold"> Informacion </h2>
                                    <nav class="responsive-nav border-b md:m-0 -mx-4">
                                        <ul>
                                            <li class="active"><a href="#" class="lg:px-2">   Usuarios </a></li>
                                        </ul>
                                    </nav>
                                </div>
                                
                            </div>
                            <br>
                            <div class="my-2 flex items-center justify-between pb-3">
                                <div>
                                    <%if (seguidormain != null) {%>
                                    <h2 class="text-xl font-semibold"> Tus Seguidores</h2>
                                    <%}else{%>
                                    <h1 class="text-xl font-semibold">Seguidores de <a href="profile-new.jsp?id=<%=postK%>" style="text-decoration: none; color: black;" ><c:out value='<%=nombreper%>'/></a></h1>
                                    <%}%>
                                </div>
                                
                            </div>

                            <div class="relative" uk-slider="finite: true">
                                <div class="uk-slider-container px-1 py-3">
                                    <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">
                      <%
                InterUsersService interUsersService = new InterUsersService();
                List<InterUsers> interUsersList = interUsersService.getInterUsersByFollow(IdS);
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
                                        <li>
                                            <a href="profile-new.jsp?id=<%=trows.getIUserNum()%>" class="uk-link-reset"
                                            onmouseover="this.style.color='#141414'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#141414')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                                                <div class="card">
                                                    <img src="assets/images/avatars/<%=dot%>" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                    <div class="p-4">
                                                        <h4 class="text-base font-semibold mb-1"> <c:out value='<%=trows.getIUser()%>'/> </h4>
                                                        <p class="font-medium text-sm">Seguidores: <c:out value='<%=trows.getIUserSeguidores()%>'/>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                    <%}}}}}%>  
                                    </ul>

                                    <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                                        href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
                                    <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                                        href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

                                </div>
                            </div>

                            <br>

                            <div class="my-2 flex items-center justify-between pb-3">
                            <div>
                                <%if (seguidormain != null) {%>
                                    <h2 class="text-xl font-semibold"> Tus Seguidos</h2>
                                    <%}else{%>
                                    <h1 class="text-xl font-semibold">Seguidos de <a href="profile-new.jsp?id=<%=postK%>" style="text-decoration: none; color: black;" ><c:out value='<%=nombreper%>'/></a></h1>
                                    <%}%>
                            </div>
                            </div>

                            <div class="relative" uk-slider="finite: true">
                                <div class="uk-slider-container px-1 py-3">
                                    <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">
                <%
                InterUsersService interUsersServicee = new InterUsersService();
                List<InterUsers> interUsersListe = interUsersServicee.getInterUsersByFollower(IdS);
                if (!interUsersListe.isEmpty()) { 
                
                for (InterUsers interUsers : interUsersListe) {
                List<InterUsers>list = userHelper.getListT();                    
                    if( list != null && list.size() > 0){
                        
                    for(InterUsers trows : list){
                        if (interUsers.getIUser().equals(trows.getIUser())) {  
                        
                        String dot = (String) trows.getIImgNum();
                        if (dot != null) {}
                            else{dot = "perfilsidebar.png";}
                      %>
                                        <li>
                                            <a href="profile-new.jsp?id=<%=trows.getIUserNum()%>" class="uk-link-reset"
                                            onmouseover="this.style.color='#141414'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#141414')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')">
                                                <div class="card">
                                                    <img src="assets/images/avatars/<%=dot%>" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                    <div class="p-4">
                                                        <h4 class="text-base font-semibold mb-1"> <c:out value='<%=trows.getIUser()%>'/> </h4>
                                                        <p class="font-medium text-sm">Seguidores: <c:out value='<%=trows.getIUserSeguidores()%>'/>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                <%}}}}}%>  
                                    
                                    </ul>

                                    <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                                        href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
                                    <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                                        href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

                                </div>
                            </div>


                        </div>

                        <!-- Sidebar -->
                        <div class="lg:w-1/3 w-full" id="sidebar_seguidos">
                            <div uk-sticky="media @m ; offset:80 ; bottom : true" class="card">
                            
                            
                                <div class="border-b flex items-center justify-between p-4">
                                    <div>
                                        <h2 class="text-lg font-semibold">Usuarios más seguidos</h2>
                                    </div>
                                </div>
                            
                                <div class="p-4 -mt-1.5">
                            <%
                            InterUsersService masFav=  new InterUsersService();
                            List<InterUsers>list = masFav.getInterUsersMoreFav();
                            if (list!=null && list.size() > 0) {
                                    for(InterUsers usersList : list ){
                                  if (!usersList.getIUser().equals(sesion.getAttribute("SIUser"))) {
                                            InterFlowService flowww = new InterFlowService();
                                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                                            boolean seguir = flowww.isUserFollowing(usersList.getIUserNum(), FlowSeguidorID );        
                                            if (seguir == true ) {
                                        %>
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="assets/images/avatars/<%=usersList.getIImgNum()%>" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" class="text-base font-semibold capitalize"
                                            onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"> 
                                            <%=usersList.getIUser()%></a>
                                            <div class="text-sm text-gray-500 mt-0.5"><%=usersList.getIUserSeguidores()%> Seguidores</div>
                                        </div>
                                            <a href="seguirnt.jsp?follows=<%=request.getParameter("follows")%>&&id=<%=usersList.getIUserNum()%>&&chest=follows&&idP=<%=sesion.getAttribute("SIUserNum")%>"
                                           class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold" style="color:#EB74DB;">
                                            Siguiendo   
                                        </a>
                                    </div>
                                    
                                    <%}else{%>
                                    
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                           <img src="assets/images/avatars/<%=usersList.getIImgNum()%>" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="profile-new.jsp?follows=<%=request.getParameter("follows")%>&&id=<%=usersList.getIUserNum()%>" class="text-base font-semibold capitalize"
                                            onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"> 
                                            <%=usersList.getIUser()%></a>
                                            <div class="text-sm text-gray-500 mt-0.5"><%=usersList.getIUserSeguidores()%> Seguidores</div>
                                        </div>
                                        <a href="seguir.jsp?follows=<%=request.getParameter("follows")%>&&id=<%=usersList.getIUserNum()%>&&chest=follows&&idP=<%=sesion.getAttribute("SIUserNum")%>"
                                            class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold"
                                            onmouseover="this.style.color='#EB74DB'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#EB74DB')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"> 
                                            Seguir   
                                        </a>
                                    </div>
                                    
                                    <%}} if (usersList.getIUserNum().toString().equals(sesion.getAttribute("SIUserNum").toString())) {%>
                            
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" href="timeline.html"iv class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="assets/images/avatars/<%=usersList.getIImgNum()%>" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" class="text-base font-semibold capitalize"
                                            onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"><%=usersList.getIUser()%></a>
                                            <div class="text-sm text-gray-500 mt-0.5"><%=usersList.getIUserSeguidores()%> Seguidores</div>
                                        </div>
                                    </div>
                            
                                    <%}}}%>                                   
                            
                                </div>
                            
                            </div>
                        </div>

                    </div>

                </div>
            </div>
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
    
            // Al hacer clic, activa o desactiva el modo nocturno
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
    <!-- si lees esto tqm -->
    <!-- att: axelito mix -->
    <!-- att: Yorch  -->

</body>
<script>
  function buscarEnEnter(event) {
    if (event.key === "Enter") {
      buscarEnTiempoReal();
    }
  }

  function buscarEnTiempoReal() {
    var campoBusqueda = document.getElementById("campoBusqueda");
    var valor = campoBusqueda.value;

    location.href = "follow-new.jsp?follows=<%=request.getParameter("follows")%>&&term=" + encodeURIComponent(valor);
  }
</script>
</html>

