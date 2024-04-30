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

              
 <jsp:include page="sidebar2.jsp"/>

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
<div  hidden id="hiAxogg0"></div>
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
                            <div class="message-content-inner" id="contento">
                                    
                                    <!-- Time Sign -->
                                    <div class="message-time-sign">
                                        <span>23, Abril 2024</span>
                                    </div>
    
    
                                    
                                    <div class="message-bubble">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <div class="message-text"><p>Hola! Soy tu acompañante en esta red social!<br>Cuentame,que necesitas el dia de hoy?</p></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    
                                    <div class="message-bubble">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <button type="submit" class="message-text bg-blue-700"> Consejos </button>
                                        </div>                                        
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <button type="submit" class="message-text bg-blue-700"> Mensajes de Apoyo </button>
                                        </div>
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <button type="submit" class="message-text  bg-blue-700"> Actividades de Relajación </button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
    
                                                                     
    
                                   <!-- <div class="message-bubble">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar"><img src="../assets/images/avatars/axo.jpg" alt=""></div>
                                            <div class="message-text">
                                                <!-- Typing Indicator <-Est0 es un comentario
                                                <div class="typing-indicator">
                                                    <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div> -->
                            </div>
                            <!-- Message Content Inner / End -->
                            
                            <!-- Reply Area -->
                            <div class="message-reply">
                                <input cols="1" rows="1" placeholder="Escribe un mensaje" id="user-input"></input>
                                <button class="button ripple-effect" id="send-btn">Enviar</button>
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
                    <li class="uk-active"><a class="active" href="#0"> Clinica </a></li>
                    
                </ul>
            </nav>

            <div class="contact-list px-2 uk-switcher" id="chats-tab">

                <div class="p-1">
                    
                   



                    
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">

                        <div class="contact-username">Sexenal</div>
                    </button><br><br>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">

                        <div class="contact-username">Cañitas</div>
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
        <h5 class="modal-title" id="exampleModalLabel">Sexenal</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  <h5>NOMBRE</h5>
  <p>Sexenal</p>
  <hr><br>
  <h5>TELEFONO DE CONTACTO</h5>
  <p>555 <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>
  <hr><br>
  <h5>Plan de Guadalupe 82, Nextitla, Miguel Hidalgo, 11420 Ciudad de México, CDMX</h5>
  <!--<p>Link para visualizar ubicacion <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>-->
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
        <h5 class="modal-title" id="exampleModalLabel">Cañitas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  <h5>NOMBRE</h5>
  <p>Cañitas</p>
  <hr><br>
  <h5>TELEFONO DE CONTACTO</h5>
  <p> 555 <a href="psiconfio.jsp" class="link-dark"> aqui</a></p>
  <hr><br>
  <h5>C. Cañitas, Popotla, Miguel Hidalgo, 11400 Ciudad de México, CDMX</h5>
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
  
<script>
    function obtenerCoordenadasYCalcularDistancia(direccion) {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(position => {
        buscarCoordenadas(direccion, position.coords.latitude, position.coords.longitude);
      }, error => {
        console.error("Error al obtener la ubicación del usuario:", error);
      }, {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
      });
    } else {
      console.log("La geolocalización no está disponible en este navegador.");
    }
  }

  function buscarCoordenadas(direccion, latUsuario, lonUsuario) {
    const apiKey = 'pk.79194de17838dd557bc019090eca41e9'; // Asegúrate de que esto es una cadena de texto válida
    const urlBase = 'https://us1.locationiq.com/v1/search.php';
    var url = urlBase + "?key=" + apiKey + "&q=" + encodeURIComponent(direccion) + "&format=json";

    const xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'json';
    xhr.onload = function() {
        if (xhr.status === 200) {
          var data = xhr.response;
          if (data && data.length > 0) {
            // Accede al primer resultado
            var lat = data[0].lat;
            var lon = data[0].lon;
            console.log("Latitud: " + lat + ", Longitud: " + lon);
            var distancia = calcularDistancia(latUsuario, lonUsuario, lat, lon);
            console.log("La distancia es: " + distancia + " kilómetros");

          } else {
            console.log("No se encontraron resultados.");
          }
        } else {
          console.error('Error al obtener las coordenadas:', xhr.statusText);
        }
      };
    xhr.onerror = function() {
      console.error('Error en la solicitud a la API.');
    };
    xhr.send();
  }

  function calcularDistancia(lat1, lon1, lat2, lon2) {
    const radioTierra = 6371; // Radio de la Tierra en kilómetros
    const rad = x => x * Math.PI / 180;
    const dLat = rad(lat2 - lat1);
    const dLon = rad(lon2 - lon1);
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
              Math.cos(rad(lat1)) * Math.cos(rad(lat2)) *
              Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return radioTierra * c;
  }

  // Ejemplo de uso
  obtenerCoordenadasYCalcularDistancia("C. Cañitas, Popotla, Miguel Hidalgo, 11400 Ciudad de México, CDMX");
  obtenerCoordenadasYCalcularDistancia("Plan de Guadalupe 82, Nextitla, Miguel Hidalgo, 11420 Ciudad de México, CDMX");

</script>

    
    <!-- Javascript
    ================================================== -->
    <script src="../assets/js/tippy.all.min.js"></script>
    <script src="../assets/js/uikit.js"></script>
    <script src="../assets/js/simplebar.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/bootstrap-select.min.js"></script>
    <script src="../assets/js/axochat.js"></script>

</body>
</html>
