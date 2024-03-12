<%-- 
    Document   : settings-new
    Created on : 23 nov. 2023, 19:00:41
    Author     : axelitomixxxddd
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="../assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs
        ================================================== -->
        <title>AxoChat</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- icons
    ================================================== -->
    <link rel="stylesheet" href="../assets/css/icons.css">

    <!-----Boxicons------->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
    <!-----Bootstrap------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Bundle with Popper -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>

    
    <!-----Fontawesome------->
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-----JQuery------->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!-- CSS ================================================== --> 
        <link rel="stylesheet" href="../assets/css/uikit.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/style2.css">
        <link href="../assets/css/tailwind.css" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/cambios.css">


</head> 


<body>
   <%
    HttpSession sesion = request.getSession();
          if (sesion.getAttribute("SIUser") != null){}
          else{out.print("<script>location.replace('index.jsp');</script>");}
    String data = (String) sesion.getAttribute("SIImgNum");
                if (data == null) {data = "perfilsidebar.png";}
                
    request.setCharacterEncoding("UTF-8");
%>

    <div id="wrapper">

              

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
                        
                        <a href="data-new.jsp?follows=1" class="is_icon">
                            <i class='bx bx-user-voice'></i>
                        </a>
                        
                        <a href="settings-new.jsp" class="is_icon">
                            <i class='bx bx-cog' ></i>  
                        </a>

                        <a href="chat1.jsp" class="is_icon" uk-tooltip="title: Message">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd"></path></svg>
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

            <button onclick="abrirModal()">
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
<!-- SIDEBAR BUSCAR -->

<nav class="sidebar-search">
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
    
    function abrirModal() {
      UIkit.modal("#create-post-modal").show();
    }

</script>

        <!-- Main Contents -->
        <div class="main_content"> 
  

            <div class="messages-container">
                <div class="messages-container-inner">

                   
                    <div class="messages-inbox">
                        <div class="messages-headline">
                            <div class="input-with-icon" hidden>
                                    <input id="autocomplete-input" type="text" placeholder="Search">
                                <i class="icon-material-outline-search"></i>
                            </div>
                            <h2 class="text-2xl font-semibold">AXOCHAT</h2>
                            <span class="absolute icon-feather-edit mr-4 text-xl uk-position-center-right cursor-pointer"></span>
                        </div>
                        <div class="messages-inbox-inner" data-simplebar>
                            <ul>
    
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-online"></i><img src="../assets/images/avatars/axo.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>AXO</h5>
                                                <span>En linea</span>
                                            </div>
                                            <p>hola! Soy tu acompañante en esta aventura</p>
                                        </div>
                                    </a>
                                </li>
    
                                
    
                            </ul>
                        </div>
                    </div>


                    <div class="message-content">

                        <div class="messages-headline">
                            <h4> Axo </h4>
                            <a href="#" class="message-action text-red-500"><i class="icon-feather-trash-2"></i> <span class="md:inline hidden"> Eliminar Conversacion</span> </a>
                        </div>
                        
                        <div class="message-content-scrolbar" data-simplebar>

                            <!-- Message Content Inner -->
                            <div class="message-content-inner">
                                    
                                    <!-- Time Sign -->
                                    <div class="message-time-sign">
                                        <span>4, Marzo 2024</span>
                                    </div>
    
                                    <div class="message-bubble me">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/prof3.png" alt=""></div>
                                            <div class="message-text"><p>ME VALE VERGA ALV MI COMPAAAA.</p></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
    
                                    <div class="message-bubble">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <div class="message-text"><p>Hi Axo!</p></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="message-bubble">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <div class="message-text"><p>Hola! Soy tu acompañante en esta red social!</p></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
    
                                    
    
                                    
    
                                    <div class="message-bubble">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <div class="message-text">
                                                <!-- Typing Indicator -->
                                                <div class="typing-indicator">
                                                    <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                            </div>
                            <!-- Message Content Inner / End -->
                            
                            <!-- Reply Area -->
                            <div class="message-reply">
                                <textarea cols="1" rows="1" placeholder="Your Message"></textarea>
                                <button class="button ripple-effect">Enviar</button>
                            </div>

                        </div>

                    </div>


                </div>
            </div> 
            
        </div>
        
        
        
        
        
    </div>
    <div uk-toggle="target: #offcanvas-chat" class="start-chat">
        <svg class="h-7 w-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
        </svg>
    </div>
                        
    
    <div id="offcanvas-chat" uk-offcanvas="flip: true; overlay: true">
        <div class="uk-offcanvas-bar bg-white p-0 w-full lg:w-80 shadow-2xl">


            <div class="relative pt-5 px-4">

                <h3 class="text-2xl font-bold mb-2"> Chats </h3>

                <div class="absolute right-3 top-4 flex items-center space-x-2">

                    <button class="uk-offcanvas-close  px-2 -mt-1 relative rounded-full inset-0 lg:hidden blcok"
                        type="button" uk-close></button>

                    <a href="#" uk-toggle="target: #search;animation: uk-animation-slide-top-small">
                        <ion-icon name="search" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                    </a>
                    <a href="#">
                        <ion-icon name="settings-outline" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                    </a>
                    <a href="#">
                        <ion-icon name="ellipsis-vertical" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                    </a>
                    <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"  
                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small; offset:5">
                        <ul class="space-y-1">
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                 <ion-icon name="checkbox-outline" class="pr-2 text-xl"></ion-icon> Mark all as read
                              </a> 
                          </li>
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="settings-outline" class="pr-2 text-xl"></ion-icon>  Chat setting 
                              </a> 
                          </li>
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="notifications-off-outline" class="pr-2 text-lg"></ion-icon>   Disable notifications
                              </a> 
                          </li> 
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="star-outline"  class="pr-2 text-xl"></ion-icon>  Create a group chat 
                              </a> 
                          </li>
                        </ul>
                    </div>
                              

                </div>


            </div>

            <div class="absolute bg-white z-10 w-full -mt-5 lg:-mt-2 transform translate-y-1.5 py-2 border-b items-center flex"
                id="search" hidden>
                <input type="text" placeholder="Search.." class="flex-1">
                <ion-icon name="close-outline" class="text-2xl hover:bg-gray-100 p-1 rounded-full mr-4 cursor-pointer"
                    uk-toggle="target: #search;animation: uk-animation-slide-top-small"></ion-icon> 
            </div>

            <nav class="responsive-nav border-b extanded mb-2 -mt-2">
                <ul uk-switcher="connect: #chats-tab; animation: uk-animation-fade">
                    <li class="uk-active"><a class="active" href="#0"> Psicologos </a></li>
                    
                </ul>
            </nav>

            <div class="contact-list px-2 uk-switcher" id="chats-tab">

                <div class="p-1">
                    
                   



                    
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">

                        <div class="contact-username">clinica1</div>
                    </button><br><br>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">

                        <div class="contact-username">clinica2</div>
                    </button><br>
                    
                    
                    
                   

                </div>
               

            </div>
        </div>
    </div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">DOCTORALIA</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  <h5>NOMBRE</h5>
  <p>Doctoralia</p>
  <hr><br>
  <h5>TELEFONO DE CONTACTO</h5>
  <p>Link para contactar <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>
  <hr><br>
  <h5>Ubicacion</h5>
  <p>Link para visualizar ubicacion <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>
    </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">NEURO WELL</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  <h5>NOMBRE</h5>
  <p>Doctoralia</p>
  <hr><br>
  <h5>TELEFONO DE CONTACTO</h5>
  <p>Link para contactar <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>
  <hr><br>
  <h5>Ubicacion</h5>
  <p>Link para visualizar ubicacion <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>
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
    <script src="../assets/js/tippy.all.min.js"></script>
    <script src="../assets/js/uikit.js"></script>
    <script src="../assets/js/simplebar.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/bootstrap-select.min.js"></script>

</body>
</html>
