
<%@page import="servlets.HtmlEscape"%>
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
        <meta charset="UTF-8">
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
        int pub = Integer.parseInt(request.getParameter("id").toString());
                
                ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
                ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
                String horaFormateada = horaCiudadMexico.format(formatter);
                String[] partes =horaFormateada.split(" ");
                String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
                String hora12 = partes[5]; 
                
        InterUsers persona = new InterUsers();
        InterUsersService personaService = new InterUsersService();
        persona = personaService.getInterUsersByPubNumId(pub);
        
        InterPub publi = new InterPub();
        InterPubService publiService = new InterPubService();
        publi = publiService.getPubByInterPub(pub);
        
        String horita = publi.getPubHour().substring(0, 5);
        String escapedUser = HtmlEscape.escapeHtml(persona.getIUser());
        String escapedCont = HtmlEscape.escapeHtml((publi.getPubCont()));
        String data = (String) sesion.getAttribute("SIImgNum");
        
        request.setCharacterEncoding("UTF-8");      
%>
    <div id="wrapper">

    
             
        <!-- Header -->
    <jsp:include page="sidebar.jsp"/>


<!-- CONTENIDOOOOOOOOOO




-->

<div class="main_content">
            <div class="mcontainer">

                 <!--  Feeds  -->
                 <div class="lg:flex lg:space-x-10">
                    <div class="lg:w-3/4 lg:px-20 space-y-7">
                
                      <div  hidden id="hiAxogg0"></div>
                
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                            <!-- post header-->
                            
                            
                            <div class="flex justify-between items-center lg:p-4 p-2.5">
                                <div class="flex flex-1 items-center space-x-4">
                                    <a href="#">
                                        <img src="../assets/images/avatars/<%=persona.getIImgNum()%>" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                    </a>
                                    <div class="flex-1 font-semibold capitalize">
                                        <a href="profile-new.jsp?id=<%=persona.getIUserNum()%>" class="text-black"> <%=escapedUser%> </a>
                                        <span class="text-gray-700"><%=horita%> hrs</span>
                                        <%if (publi.getPubDate().equals(fecha12)) {%>
                                            <div class="text-gray-700 flex items-center space-x-2">hoy <ion-icon name="people"></ion-icon></div>
                                        <%} else {%>
                                            <div class="text-gray-700 flex items-center space-x-2"><%=publi.getPubDate()%>"<ion-icon name="people"></ion-icon></div>
                                        <%}%>
                                    </div>
                                </div>
                              <div>
                                <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                    <ul class="space-y-1">
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-share-alt mr-1"></i> Compartir
                                          </a> 
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                           <i class="uil-edit-alt mr-1"></i>  Editar 
                                          </a> 
                                      </li>
                                      <li>
                                        <hr class="-mx-2 my-2 dark:border-gray-800">
                                      </li>
                                      <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                           <i class="uil-trash-alt mr-1"></i>  Eliminar
                                          </a> 
                                      </li>
                                    </ul>
                                </div>
                              </div>
                            </div>
                                    
                            <div class="p-4 space-y-3 relative"> 
                                <p> <%=escapedCont%> </p>
                                <hr>
                                <div id="reaccion" class="flex space-x-4 lg:font-bold">

                                </div>  
                                        <%--  Comentarios  --%>   
                                <div id="comentarios0"class="border-t py-4 space-y-4 dark:border-gray-600">
                                    
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                
                                        <%request.setCharacterEncoding("UTF-8");%>
       <div id="create-comment-modal" class="create-post" uk-modal>
                <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
                    <div class="text-center py-4 border-b">
                        <h3 class="text-lg font-semibold"> Escribe tu opinion <c:out value='<%=sesion.getAttribute("SIUser")%>'/> </h3>  
                        <button id="cerrar" class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                    </div>
                    <form id="comentariosAxo" method="POST" accept-charset="UTF-8">
                        <div class="flex flex-1 items-start space-x-4 p-5">
                            <img src="../assets/images/avatars/<c:out value='<%=data%>'/>" class="bg-gray-200 border border-white rounded-full w-11 h-11">
                                <div class="flex-1 pt-2">
                                    <input type="hidden" id="guardar" name="guardar" value="Submit" />
                                    <input type="hidden" name="numero123" id="numero23" value="<%=request.getParameter("id")%>" />
                                    <textarea id="inputText1" name="ComentCont" class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5" placeholder="¿Alguna recomendación o opinion?" maxlength="1250" autofocus></textarea>
                                    <input type="hidden" name="ComentDate" id="ComentDate" value="<%=fecha12%>" />
                                    <input type="hidden" name="ComentHour" id="ComentHour" value="<%=hora12%>" />
                                    <input type="hidden" name="ComentPubNumId" id="ComentPubNumId" value="<%=request.getParameter("id")%>" />
                                    <input type="hidden" name="ComentIUserNum" id="ComentIUserNum" value="<%=sesion.getAttribute("SIUserNum")%>" />
                                </div>
                        </div>
                        <div class="bsolute bottom-0 p-4 space-x-4 w-full">
                            <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-3 shadow-sm items-center">
                                <button type="submit" class="button bg-blue-700" id="guardadito1" ontouchstart="this.click()"> Publicar </button>
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
                                        
                                        
                                        
<script>
    function openModal() {
        var modal = document.getElementById('create-comment-modal');
        if (modal) {
            UIkit.modal("#create-comment-modal").show();
            console.log("ejecuto");
            modal.style.display = 'block';
        } else {
            console.error("No se encontró la modal con el ID 'create-comment-modal'");
        }
    }
</script>

<!-- FIN CONTENIDOOOO -->

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
<script>
    function actualizarPubli() {

    var num = <%=request.getParameter("id")%>;

        if (num) {
            var url = '/Psyness/ServletPublicacionIndividual?key2=' + num;

           
            function actualizar() {
                $.ajax({
                    type: 'GET',
                    url: url,
                    success: function (data) {
                        $('#reaccion').html(data);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error en la solicitud AJAX:", status, error);
                        console.log(xhr.responseText);
                    }
                });
            }
            setInterval(actualizar, 1000); 
        } else {
            console.error("No se encontró el parámetro 'id' en la URL.");
        }
        return false;
    }
    actualizarPubli();


    var hola = 0;
    var cooldown = false;
    var solicitudPendiente = false;

    function descargarPublicaciones(TotalCiclos) {
        if (cooldown || solicitudPendiente) {
            console.log("Esperando el cooldown o ya hay una solicitud pendiente...");
            return; 
        }

        solicitudPendiente = true;
        var url = '/Psyness/ServletComentarios';
        var num = <%=request.getParameter("id")%>;
        $.ajax({
            type: 'GET',
            url: url,
            data: {
                key1: TotalCiclos,
                id: num
            },
            success: function (data) {
                $('#comentarios' + TotalCiclos).html(data);
                hola = hola + 1;
                console.log(hola);
            },
            error: function (xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            },
            complete: function () {
                solicitudPendiente = false;
                cooldown = true;
                setTimeout(function () {
                    cooldown = false;
                }, 500);
            }
        });
    }

    function verificarFinalDePagina() {
        const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        const scrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
        const clientHeight = document.documentElement.clientHeight || document.body.clientHeight;

        if (scrollTop + clientHeight >= scrollHeight - 150) {
            descargarPublicaciones(hola);
        }
    }
    
    $(window).on('scroll', function () {
        verificarFinalDePagina();
    });
    setInterval(function () {
        verificarFinalDePagina();
    }, 800);

    $(document).ready(function () {
        descargarPublicaciones(hola);
    });


function handleButtonHover1(button, isHover) {
    if (isHover) {
        button.style.color = '#787DF1';
        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '#787DF1');
        button.querySelector('span').style.color = '#787DF1';
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
        button.querySelector('span').style.color = '#F6CE2F';
    } else {
        button.style.color = '';
        button.querySelectorAll('svg').forEach(svg => svg.style.fill = '');
        button.querySelector('span').style.color = '';
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

</html>    

