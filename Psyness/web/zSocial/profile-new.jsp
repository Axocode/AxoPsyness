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
<%
    request.setCharacterEncoding("UTF-8");          
    HttpSession sesion = request.getSession();          
    InterPub user = null;
    boolean flag = false;
    int persona = Integer.parseInt(request.getParameter("id"));
    
    InterUsers usuario = new InterUsers();
    InterUsersService uService = new InterUsersService();
    usuario = uService.getUserByInterUsersNum(persona);

        String descripcion = usuario.getIUserDescription();
        String nombre = usuario.getIUser();
        int edad = usuario.getIAge();
        String data = usuario.getIImgNum();
        int seguidores = usuario.getIUserSeguidores();
        int seguidos = usuario.getIUserSeguidos();
        
            ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
            ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
            String horaFormateada = horaCiudadMexico.format(formatter);
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
            String horaFormateada2 = horaCiudadMexico.format(formatter2);
            String[] partes =horaFormateada.split(" ");
            String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
            String hora12 = partes[5]; 
%>
    


    <div id="wrapper">

              
        <!-- Header -->
    <jsp:include page="sidebar.jsp"/>



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
                            
                            <a href="follow-new.jsp?follows=<%=persona%>"
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
<div  hidden id="hiAxogg0"></div>
                        <div class="flex justify-between lg:border-t border-gray-100 flex-col-reverse lg:flex-row pt-2">
                            <nav class="responsive-nav pl-3">
                                <ul uk-switcher="connect: #timeline-tab; animation: uk-animation-fade">
                                    <li><a href="">Perfil</a></li>
                                    <% if ((request.getParameter("id")).equals(sesion.getAttribute("SIUserNum").toString())) { %>
                                        <li><a href="" id="pubsFavoritas">Pubs Favoritas <span></span> </a></li>
                                    <% } %>
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
                                <div id="hiAxo0"></div>
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
                <div id="PublicacionesFavoritas0"></div>
                          
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
<audio id="miSonido">
    <source src="../assets/audio.mp3" type="audio/mp3">
</audio>
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
  
    <!-- Referencias a TensorFlow.js y tu script JS -->
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
    <script src="../zProcesos/ia.js"></script>   
    
    <!-- Javascript
    ================================================== --> 
    <script src="../assets/js/tippy.all.min.js"></script>
    <script src="../assets/js/uikit.js"></script>
    <script src="../assets/js/simplebar.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/bootstrap-select.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    var holaPerfil = 0;
    var holaFavoritos = 0;
    var isFocused = false;
    var cooldownPerfil = false;
    var cooldownFavoritos = false;
    var solicitudPendiente = false;

    function descargarPublicaciones(url, idPrefix, holaVariable, cooldownVariable) {
        if (cooldownVariable || solicitudPendiente) {
            console.log("Esperando el cooldown o ya hay una solicitud pendiente...");
            return;
        }

        solicitudPendiente = true;

        $.ajax({
            type: 'POST',
            url: url,
            data: {
                key1: holaVariable,
                key2: "<%=persona%>"
            },
            success: function (data) {
                $('#' + idPrefix + holaVariable).html(data);
                holaVariable++;
            },
            error: function (xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            },
            complete: function () {
                solicitudPendiente = false;
                cooldownVariable = true;
                setTimeout(function () {
                    cooldownVariable = false;
                }, 500);
            }
        });
    }

    function verificarFinalDePagina() {
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const scrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
        const clientHeight = document.documentElement.clientHeight || document.body.clientHeight;

        if (scrollTop + clientHeight >= scrollHeight - 300) {
            if (isFocused) {
                descargarPublicaciones('/Psyness/PublicacionesFavoritasServlet', 'PublicacionesFavoritas', holaFavoritos, cooldownFavoritos);
                holaFavoritos++;
            } else {
                descargarPublicaciones('/Psyness/PublicacionesPerfilServlet', 'hiAxo', holaPerfil, cooldownPerfil);
                holaPerfil++;
            }
        }
    }
    
    $(document).ready(function () {
    var $pubsFavoritas = $("#pubsFavoritas");

    // Escuchar eventos en el documento entero.
    $(document).on('click touchstart', function (e) {
        // Verificar si el evento ocurrió en $pubsFavoritas o en un descendiente.
        if ($pubsFavoritas.is(e.target) || $pubsFavoritas.has(e.target).length > 0) {
            console.log("Elemento activado");
            isFocused = true;
        } else {
            console.log("Elemento desactivado");
            isFocused = false;
        }
    });

    setInterval(function () {
        verificarFinalDePagina();
    }, 400);

    verificarFinalDePagina();
});




    
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
    function handleButtonHover(button, isHover) {
        if (isHover) {
            button.style.color = '#F6CE2F';
            button.querySelectorAll('svg').forEach(svg => svg.style.fill = '#F6CE2F');
        } else {
            button.style.color = '';
            button.querySelectorAll('svg').forEach(svg => svg.style.fill = '');
            }
        }
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
</body>
</html>
