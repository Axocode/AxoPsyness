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
            <div class="mcontainer" >

                <div class="messages-container">
                    <div class="messages-container-inner">

                        <div class="message-content">

                            <div class="messages-headline">
                                <h2 class="text-2xl font-semibold">AXOCHAT</h2>
                            </div>

                            <div class="message-content-scrolbar" data-simplebar>

                                <!-- Message Content Inner -->
                                <div class="message-content-inner" id="contento">

                                        <!-- Time Sign -->
                                        <div class="message-time-sign">
                                            <span>13, Junio 2024</span>
                                        </div>



                                        <div class="message-bubble">
                                            <div class="message-bubble-inner">
                                                <div class="message-avatar"><img src="../assets/images/Axo_cantante.svg" alt=""></div>
                                                <div class="message-text py-2"><p>Hi Axo! Soy tu acompañante en esta red social!<br>Cuentame, que necesitas el dia de hoy?</p></div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="message-bubble" id="botones-axochar">
                                            <div class="message-bubble-inner">
                                                <div class="message-avatar"><img src="../assets/images/Axo_cantante.svg" alt=""></div>
                                                <button type="submit" class="message-text bg-blue-700 py-2 my-2" style="background-color: #787df1; color: #fff" id="btn1">Consejos</button>
                                            </div>
                                            <div class="message-bubble-inner">
                                                <div class="message-avatar"><img src="../assets/images/Axo_cantante.svg" alt=""></div>
                                                <button type="submit" class="message-text bg-blue-700 py-2 my-2" style="background-color: #787df1; color: #fff" id="btn2">Mensajes de Apoyo</button>
                                            </div>
                                            <div class="message-bubble-inner">
                                                <div class="message-avatar"><img src="../assets/images/Axo_cantante.svg" alt=""></div>
                                                <button type="submit" class="message-text bg-blue-700 py-2 my-2" style="background-color: #787df1; color: #fff" id="btn3">Actividades de Relajación</button>
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
                                    <input cols="1" class="px-2" rows="1" placeholder="Escribe un mensaje" id="user-input" disabled></input>
                                    <button class="button ripple-effect" id="send-btn" disabled>Enviar</button>
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
    <script src="../assets/js/tippy.all.min.js"></script>
    <script src="../assets/js/uikit.js"></script>
    <script src="../assets/js/simplebar.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/bootstrap-select.min.js"></script>
    <script src="../assets/js/axochat.js"></script>

</body>
</html>
