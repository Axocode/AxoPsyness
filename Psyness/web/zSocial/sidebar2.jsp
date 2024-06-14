<%-- 
    Document   : sidebar
    Created on : 28 dic. 2023, 22:47:43
    Author     : chump
--%>


<%@page import="org.axocode.dao.service.InterClinicService"%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">
        <title>Feed - Psyness</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>


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

        <%request.setCharacterEncoding("UTF-8");        
          HttpSession sesion = request.getSession();
          String data = (String) sesion.getAttribute("SIImgNum");%>
        <!-- Header -->
        <div hidden id="hiAxoggA"></div>
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
                        <a href="home.jsp"> 
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

                        <a href="data-new.jsp?follows=1" class="is_icon">
                            <i class='bx bx-user-voice'></i>
                        </a>
                        
                        <a href="chat-new.jsp" class="is_icon" uk-tooltip="title: Message">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd"></path></svg>
                        </a>
                        
                        <a href="home.jsp" class="is_icon">
                            <i class='bx bxs-home'></i>
                        </a>
                        
                        <a href="settings-new.jsp" class="is_icon">
                            <i class='bx bx-cog' ></i>  
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
                         
    <!-- SIDEBAR -->
        <aside class="sidebar_feed">

        <div class="sidebar_header">
            <img src="../assets/images/avatars/Logo con letras centrado.svg" class="logo-img_sidebar">
            <img src="../images/Icono.svg" class="logo-icon_sidebar">
        </div>


        <nav>
            <button onclick="location.href='home.jsp'">
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

            <button onclick="location.href='chat-new.jsp'">
                <span>
                    <i class='bx bxl-telegram' >
                        <!--<span>15</span>-->
                        <em></em>
                    </i>
                    <span>Axochat</span>
                </span>
            </button>
            
            <button onclick="location.href='testrano.jsp'">
                <span>
                    <i class="fa-solid fa-film fa-rotate-180 fa-sm" style="color: #000000;"></i><!-- comment -->          
                    <span>Videos</span>
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
                     <%
                         InterClinicService clinic = new InterClinicService();
                         if(clinic.checkIfUserWithInClinic(Integer.parseInt(sesion.getAttribute("SIUserNum").toString()))){  
                     %>   
                <button onclick="location.href='search-user.jsp'">
                <span>
                    <i class="icon-feather-activity"></i>
                    <span>Clinicas</span>
                </span>
                </button>
                    <%}%>
               <button onclick="abrirModal()">
                <span>
                    <i class="icon-feather-plus"></i>
                    <span>Publicar</span>
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
    
    function abrirModal() {
      UIkit.modal("#create-post-modal").show();
    }

</script>

<%
            ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
            ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
            // Restar una hora a la hora actual de la Ciudad de México
            ZonedDateTime horaMenosUnahora = horaCiudadMexico.minusHours(1);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
            String horaFormateada = horaMenosUnahora.format(formatter);  // Usar la hora ajustada para formatear
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
            String horaFormateada2 = horaMenosUnahora.format(formatter2);  // Usar la hora ajustada para formatear

            String[] partes = horaFormateada.split(" ");
            String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
            String hora12 = partes[5];
            %>
            
                    <div id="create-post-modal" class="create-post" uk-modal>
                        <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
                            <div class="text-center py-4 border-b">
                                <h3 class="text-lg font-semibold"> Cuentanos tu pensamiento <c:out value='<%=sesion.getAttribute("SIUser")%>'/> </h3>  
                                <button id="cerrar" class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                            </div>
                            <form id="axocode123" method="POST" accept-charset="UTF-8">
                                <div class="flex flex-1 items-start space-x-4 p-5">
                                    <img src="../assets/images/avatars/<c:out value='<%=data%>'/>" class="bg-gray-200 border border-white rounded-full w-11 h-11">
                                        <div class="flex-1 pt-2">
                                            <textarea id="inputText" name="PubCont" class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5" placeholder="¿Tienes algo que compartir?" maxlength="1250" autofocus></textarea>
                                            <input type="hidden" id="guardar" name="guardar" value="Submit" />
                                            <input type="hidden" name="PubDate" id="PubDate" value="<%=fecha12%>" />
                                            <input type="hidden" name="PubHour" id="PubHour" value="<%=hora12%>" />
                                            <input type="hidden" name="numero123" id="numero123" value="<%=sesion.getAttribute("SIUserNum")%>" />
                                            <input type="hidden" name="PubRol" id="PubRol" value="Feed" />
                                        </div>
                                         <!-------------------------IMPORTANTE - CAMBIOS
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
                            -------------------------------->
                                </div> 
                                            
                              <!------------------------- Etiquetas-------------------------->    
                                           <div class="overflow-auto space-x-4 p-5" id="tags_Container">
                                               
                                                <div class="toogle-desactivable">
                                                    <input type="checkbox" id="TagPubSensible" name="TagPubSensible" class="toggle-checkbox">
                                                    <label for="TagPubSensible" class="toggle-label"></label>      
                                                    <span>Contenido sensible</span>
                                                </div>                                               
                                               
                                              <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubAutoestima" name="TagPubAutoestima" onclick="alternarEstado('TagPubAutoestima')">
                                                <label for="TagPubAutoestima">Autoestima y confianza</label>
                                              </div>
                                              <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubRelaciones" name="TagPubRelaciones" onclick="alternarEstado('TagPubRelaciones')">
                                                <label for="TagPubRelaciones">Relaciones interpersonales</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubAnsiedad" name="TagPubAnsiedad" onclick="alternarEstado('TagPubAnsiedad')">
                                                <label for="TagPubAnsiedad">Ansiedad y estrés</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubDepresion" name="TagPubDepresion" onclick="alternarEstado('TagPubDepresion')">
                                                <label for="TagPubDepresion">Depresión</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubConflictos" name="TagPubConflictos" onclick="alternarEstado('TagPubConflictos')">
                                                <label for="TagPubConflictos">Resolución de conflictos</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubBienestar" name="TagPubBienestar" onclick="alternarEstado('TagPubBienestar')">
                                                <label for="TagPubBienestar">Mindfulness y bienestar</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="boton7" onclick="alternarEstado('boton2')">
                                                <label for="boton7">Adicciones</label>
                                              </div>   
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubCrecimiento" name="TagPubCrecimiento" onclick="alternarEstado('TagPubCrecimiento')">
                                                <label for="TagPubCrecimiento">Crecimiento personal</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubSalud" name="TagPubSalud" onclick="alternarEstado('TagPubSalud')">
                                                <label for="TagPubSalud">Salud emocional</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubTranstornos" name="TagPubTranstornos" onclick="alternarEstado('TagPubTranstornos')">
                                                <label for="TagPubTranstornos">Transtornos</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubRecaidas" name="TagPubRecaidas" onclick="alternarEstado('TagPubRecaidas')">
                                                <label for="TagPubRecaidas">Recaidas</label>
                                              </div>
                                               <div class="boton-desactivable">
                                                <input type="checkbox" id="TagPubSueno" name="TagPubSueno" onclick="alternarEstado('TagPubSueno')">
                                                <label for="TagPubSueno">Problemas de sueño</label>
                                              </div>
                                           </div>  
                                        

                                       
                                        <script>
                                            function alternarEstado(id) {
                                              var checkbox = document.getElementById(id);
                                            }
                                        </script>     
                                        
                                        <style>
                                            
                                            /* ETIQUETAS */

                                            .boton-desactivable {
                                                display: inline-block;
                                                position: relative;
                                            }

                                            .boton-desactivable input[type="checkbox"] {
                                                display: none;
                                            }

                                            .boton-desactivable label {
                                                padding: 10px 20px;
                                                background-color: #f8f8f8;
                                                border: 1px solid #afaeae;
                                                border-radius: 20px;
                                                cursor: pointer;
                                                box-shadow: 5px 5px 10px 1px rgba(0,0,0,0.1);
                                            }

                                            .boton-desactivable input[type="checkbox"]:checked + label {
                                                background-color: #787df1;
                                                color: #fff;
                                                cursor:pointer;
                                            }

                                            .boton-desactivable input[type="checkbox"]:checked + label::before {
                                                content: "°";
                                                display: inline-block;
                                                position: absolute;
                                                margin: auto;
                                                left: 8px;
                                                top: 50%;
                                                transform: translateY(-50%);
                                            }

                                            /*       Toogle     */

                                            .toogle-desactivable {
                                                display: flex;
                                                flex-direction: row;
                                                align-items: flex-start;
                                                margin-left: 10px;
                                            }

                                            .toogle-desactivable input[type="checkbox"] {
                                                display: none;
                                            }

                                            .toogle-desactivable span{
                                                margin: 10px;
                                                transform: translateY(-20%);
                                            }

                                            .toggle-label {
                                                display: inline-block;
                                                width: 50px;
                                                height: 25px;
                                                background-color: #d3d3d3;
                                                border-radius: 25px;
                                                cursor: pointer;
                                                position: relative;
                                                box-shadow: 5px 5px 10px 1px rgba(0,0,0,0.1);
                                            }

                                            .toggle-label::after {
                                                content: '';
                                                display: block;
                                                width: 23px;
                                                height: 23px;
                                                background-color: #fff;
                                                border-radius: 50%;
                                                position: absolute;
                                                top: 1px;
                                                left: 0;
                                                transition: transform 0.3s;
                                            }

                                            .toggle-checkbox:checked + .toggle-label::after {
                                                transform: translateX(25px);

                                            }     

                                            .toggle-checkbox:checked + .toggle-label {
                                                background-color: #787df1;

                                            }         
                                            
                                            #guardadito1{
                                                background-color: #787df1; 
                                            }

                                        </style>
                                         
                                         
                                         
                        
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
                                                    <p class="text-sm text-gray-500">Puede que tu publicación contenga contenido sensible para otros usuarios.
                                                    Por favor edita el contenido y vuelve a intentarlo</p>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
                                                <button type="button" onClick="cerrarModal()" id="button_close_offensive" class="inline-flex w-full justify-center rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 sm:ml-3 sm:w-auto">Cerrar</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
<script src="../assets/js/ProcesosAjax.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="../assets/js/Perspective.js" defer></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>