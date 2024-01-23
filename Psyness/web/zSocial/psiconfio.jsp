
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
        <link href="../assets/images/Icono.svg" rel="icon" type="image/png">


            <!-- icons ================================================== -->
        <link rel="stylesheet" href="../assets/css/icons.css">

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
        <link rel="stylesheet" href="../assets/css/uikit.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/style2.css">
        <link href="../assets/css/tailwind.css" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/cambios.css">

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
                        response.sendRedirect("../zProcesos/error.jsp?direct=2&&place="+request.getParameter("ComentPubNumId"));
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
                            response.sendRedirect("../zProcesos/error.jsp?direct=0");     
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
                                response.sendRedirect("../zProcesos/error.jsp?direct=0");
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
                           
                                        String[] partes =horaFormateada.split(" ");
                                        String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                                        String hora12 = partes[5]; 
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
<!-- CONTENIDO FORMULARIOS -->
<div class="main_content">

            <div class="bg-gradient-to-tr flex from-blue-400 h-52 items-center justify-center lg:h-80 pb-10 relative to-blue-300 via-blue-400 w-full">

                <div class="text-center max-w-xl mx-auto z-10 relative px-5">
                    <div class="lg:text-4xl text-2xl text-white font-semibold mb-3"> Contactar Psicologo </div>
                    <div class="text-white text-lg font-medium text-opacity-90"> Hola que tal! Soy "Nombre" 
                        <br>Contactame si tienes alguna pregunta o situacion, recuerda que tu salud mental es muy importante!</div>
    
                </div>
            
            </div>
            <div class="mcontainer">
 
                <div class="-mt-16 bg-white max-w-2xl mx-auto p-10 relative rounded-md shadow">

                    <div class="grid md:grid-cols-2 md:gap-y-7 md:gap-x-6 gap-6">
                        <input type="text" placeholder="Nombre" class="with-border">
                        <input type="text" placeholder="Apellidos" class="with-border">
                        <input type="text" placeholder="Email" class="with-border">
                        <input type="text" placeholder="Numero de Contacto" class="with-border">
                        <textarea placeholder="Como te puedo ayudar?" rows="5" class="with-border md:col-span-2 p-5 px-7 resize-none h-72"></textarea>
                        <div class="md:col-span-2 md:flex items-center justify-between">
                            <div>
                                <div class="checkbox">
                                    <input type="checkbox" id="chekcbox2">
                                    <label for="chekcbox2">
                                        <span class="checkbox-icon"></span> <span class="font-medium text-gray-400">Acepto Terminos &amp; Condiciones</span> 
                                    </label>
                                </div>
                            </div>
                            <button type="button" class="button bg-blue-700 w-full md:w-auto md:mt-0 mt-4"> Submit </button> 
                        </div>
                    </div>
                    
                </div>
        
            </div>
        </div>
<!-- CONTENIDO FORMULARIO FIIIN -->






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
    
            if (!('localStorage' in window)) return;
    
            var nightMode = document.querySelector('#night-mode');
            if (!nightMode) return;
    
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
<audio id="miSonido">
    <source src="../assets/audio.mp3" type="audio/mp3">
    Tu navegador no soporta el elemento de audio.
</audio>

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
<script>
    var hola = 0;
    var esperandoRespuesta = false;

    function descargarPublicaciones(TotalCiclos) {
        var url = '/Psyness/PublicacionesServlet';

        if (!esperandoRespuesta) {
            esperandoRespuesta = true;

            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    key1: TotalCiclos
                },
                success: function (data) {
                    $('#hiAxo'+TotalCiclos).html(data);
                    
                    console.log("Ciclo anterior" + hola);
                    hola = hola + 1;
                    console.log("Nuevo ciclo" + hola);

                    esperandoRespuesta = false;
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", status, error);
                    console.log(xhr.responseText);

                    esperandoRespuesta = false;
                }
            });
        }
    }

    function verificarFinalDePagina() {
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const scrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
        const clientHeight = document.documentElement.clientHeight || document.body.clientHeight;

        if (scrollTop + clientHeight >= scrollHeight - 750) {
            if (!esperandoRespuesta) {
                descargarPublicaciones(hola);
                
                esperandoRespuesta = true;
                setTimeout(function () {
                    esperandoRespuesta = false;
                }, 2000);
            }
        }
    }

    window.onscroll = function () {
        verificarFinalDePagina();
    };

    $(document).ready(function () {
        descargarPublicaciones(hola);
    });
</script>
<script>
    function enviarAmor(pub1, action) {
        var url = '/Psyness/MeGustaServlet?pub=' + pub1 + '&action1=' + action;

        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

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
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

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
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

        return false;
    }
   
</script>
<script>
    var sonidoReproducido = false; // Variable para rastrear si el sonido ya se ha reproducido

    function actualizarPub(num) {
        var url = '/Psyness/ReaccionesServlet?key2=' + num;
        console.log("Click" + num);

        // Función que realiza la solicitud AJAX
        function hacerSolicitud() {
            $.ajax({
                type: 'GET',
                url: url,
                success: function (data) {
                    $('#pub' + num).html(data);
                    console.log("Actualizada:" + num);

                    // Reproducir el sonido solo la primera vez
                    if (!sonidoReproducido) {
                        reproducirSonido();
                        sonidoReproducido = true;
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", status, error);
                    console.log(xhr.responseText);
                }
            });
        }

        // Ejecutar la función hacerSolicitud dos veces con un intervalo de 1 segundo
        setTimeout(function () {
            hacerSolicitud();
            sonidoReproducido = false; // Restablecer la variable para permitir futuras reproducciones
            setTimeout(hacerSolicitud, 1000); // 1000 milisegundos = 1 segundo
        }, 200); // 1000 milisegundos = 1 segundo

        return false;
    }

    function reproducirSonido() {
        var audioElement = document.getElementById("miSonido");
        if (audioElement) {
            audioElement.play();
        }
    }
</script>



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
</html>    

