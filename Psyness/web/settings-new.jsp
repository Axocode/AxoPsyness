<%-- 
    Document   : settings-new
    Created on : 23 nov. 2023, 19:00:41
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs
        ================================================== -->
    <title>Settings</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">

    <!-- icons
    ================================================== -->
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
                            <img src="assets/images/avatars/prof2.png" class="is_avatar" alt="">
                        </a>
                        <div uk-drop="mode: click;offset:5" class="header_dropdown profile_dropdown">

                            <a href="profile-new.jsp" class="user">
                                <div class="user_avatar">
                                    <img src="assets/images/avatars/prof2.png" alt="">
                                </div>
                                <div class="user_name">
                                    <div> Axel5136 </div>
                                    <span> Axelitomix</span>
                                </div>
                            </a>
                           
                            <a href="settings-new.jsp">
                                <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path></svg>
                                Perfil 
                            </a>
                            <a href="follow-new.jsp">
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
                            <a href="form-login.html">
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
                <img src="images/sololetras.svg" class="logo-img_sidebar">
                <img src="images/Icono.svg" class="logo-icon_sidebar">
            </div>
    
    
            <nav>
                <button>
                    <span>
                        <i class='bx bxs-home'></i>
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
                        <i class='bx bx-compass' ></i>
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
    
                <button>
                    <span>
                        <img src="images/prof3.png" alt="" class="profile-img">
                        <span>Perfil</span>
                    </span>
                </button>
                
                <button>
                    <span>
                        <i class='bx bx-cog' ></i>  
                        <span>Settings</span>
                    </span>
                </button>
            </nav>
        </aside>
    
            <!---------------SIDEBAR BUSCAR----------------->
    
        <nav class="sidebar-search">
    
            <div class="search-header">
                <p>Buscar</p>
            </div>
    
            <nav>
                <input class="box-search" type="text" placeholder="Buscar">
            </nav>
    
            <nav class="profiles_search"><hr>
    
                <div class="subtitle_search">
                    <p>Recientes
                        <span>Borrar todo</span>
                    </p>
                </div>
    
                <div class="box_profile_search">
                    <img src="images/prof3.png" class="img_search">
                        <p>Yorch1342
                            <span>Yorch</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div>
    
                <div class="box_profile_search">
                    <img src="images/prof2.png" class="img_search">
                        <p>Vargas1341
                            <span>FerVargas</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div> 
    
                <div class="box_profile_search">
                    <img src="images/prof1.png" class="img_search">
                        <p>JohanUwW
                            <span>Yohan</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div>
    
                <div class="box_profile_search">
                    <img src="images/prof4.png" class="img_search">
                        <p>Axel42891
                            <span>Nextle</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div>
    
                <div class="box_profile_search">
                    <img src="images/prof5.png" class="img_search">
                        <p>Perro_NAOH
                            <span>Doggy</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div>
    
                <div class="box_profile_search">
                    <img src="images/prof6.png" class="img_search">
                        <p>Dylan41331
                            <span>Dylan</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div>
    
                <div class="box_profile_search">
                    <img src="images/prof7.png" class="img_search">
                        <p>Yael48392
                            <span>Valentain</span>
                        </p>
                    <div class="icons_X">
                        <i class='bx bx-x'></i>
                    </div> 
                </div>
    
            </nav>
        </nav>
    
    

        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">
                <div class="contenedor_editperfil">


                    <div class="mb-6">
                        <h2 class="text-2xl font-semibold"> Editar perfil </h2>
                        <nav class="responsive-nav border-b md:m-0 -mx-4">
                            <ul uk-switcher="connect: #form-type; animation: uk-animation-fade">
                                <li><a href="#" class="lg:px-2"> Perfil</a></li>

                                
                                
                            </ul>
                        </nav>
                    </div>

                    <div class="grid lg:grid-cols-3 mt-12 gap-8">

                        <div class="card" style="width: 18rem;">
                            <a href="profileimg.jsp">
                            <img src="assets/images/avatars/prof2.png" class="card-img-top" alt="...">
                        </a>
                            <div class="card-body">
                            <h3 >Selecciona una imagen</h3>
                            <p class="card-text">Tu imagen de perfil dice mucho de ti, asegurate de escoger la que mas te guste :D</p>
                            
                            </div>
                        </div>


                        <div class="bg-white rounded-md lg:shadow-md shadow col-span-2 lg:mx-16">
            
                            <div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
                                <div>
                                    <label for=""> Nombre de Usuario</label>
                                    <input type="text" placeholder="" class="shadow-none with-border">
                                </div>
                                
                                <div>
                                    <label for=""> Edad</label>
                                    <input type="text" placeholder="" class="shadow-none with-border">
                                </div>
                                <div class="col-span-2">
                                    <label for="about">Descripcion</label>  
                                    <textarea id="about" name="about" rows="3"  class="with-border"></textarea>
                                </div> 
                            </div> 
        
                            <div class="bg-gray-10 p-6 pt-0 flex justify-end space-x-3">
                                <button class="p-2 px-4 rounded bg-gray-50 text-red-500"> Cancel </button>
                                <button type="button" class="button bg-blue-700"> Save </button>
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

</body>

</html>