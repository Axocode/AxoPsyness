<%-- 
    Document   : dashboard.jsp
    Created on : 26 feb. 2024, 00:13:01
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">
    <title>Dashboard - Psyness</title>

        <!-- Favicon -->
    <link href="assets/images/Icono.svg" rel="icon" type="image/png">
        <!-- CSS ================================================== --> 
    <link rel="stylesheet" href="../assets/css/cambios.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../assets/css/dash-styles.css">

</head>

<body>
    <div  hidden id="hiAxogg0"></div>
    <div class="dcontainer">

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
                            <a href="feed2.html"> 
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

                            <a href="#" class="is_icon">
                                <i class='bx bxs-home'></i>
                            </a>

                            <a href="#" class="is_icon">
                                <i class='bx bx-compass' ></i>
                            </a>
                            
                            <a href="#" class="is_icon">
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

                                <a href="timeline.html" class="user">
                                    <div class="user_avatar">
                                        <img src="assets/images/avatars/prof2.png" alt="">
                                    </div>
                                    <div class="user_name">
                                        <div> Axel5136 </div>
                                        <span> Axelitomix</span>
                                    </div>
                                </a>
                            
                                <a href="pages-setting.html">
                                    <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path></svg>
                                    Perfil 
                                </a>
                                <a href="pages.html">
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
            <!--   UPGRADE UR PLAN
                <div class="upgrade">
                <h5>Upgrade Your Plan</h5>
                <div class="link">
                    <a href="#">Go to <b>PRO</b></a>
                    <i class='bx bxs-chevron-right'></i>
                </div>
            </div>
            -->
            
            
            
            
            
 
        <!---------------MAIN CONTENT------------------->


        <main>

            <div class="dseparator">
                <div class="info_d">
                    <h3>Estadísticas</h3>
                </div>
            </div>

            <!-------------STATS----------------->

            <div class="analytics_d">
                <div class="item_d" uk-toggle="target: #create-post-modal">
                    <div class="dprogress">
                        <div class="info_d">
                            <h5>Comentarios</h5>
                            <p>12 comments</p>
                        </div>
                        <h3>250</h3>
                    </div>
                    <i class='bx bx-map-pin'></i>
                </div>
                <div class="item_d">
                    <div class="dprogress">
                        <div class="info_d">
                            <h5>Publicaciones</h5>
                            <p>30 posts</p>
                        </div>
                        <h3>250</h3>
                    </div>
                    <i class='bx bx-user-voice'></i>
                </div>
                <div class="item_d">
                    <div class="dprogress">
                        <div class="info_d">
                            <h5>Tiempo</h5>
                            <p>45 minutos</p>
                        </div>
                       <h3>250</h3>
                    </div>
                    <i class='bx bx-map-pin'></i>
                </div>
                <div class="item_d">
                    <div class="dprogress">
                        <div class="info_d">
                            <h5>Favoritos</h5>
                            <p>20 favs</p>
                        </div>
                        <h3>250</h3>
                    </div>
                    <i class='bx bx-user-voice'></i>
                </div>
            </div>

            <!--------------------Planeaciones------------------------->

            <div class="dseparator">
                <div class="info_d">
                    <h3>Seguimiento</h3>
                </div>
                <input type="date" value="2023-10-15">
            </div>

            <div class="dplanning">
                <div class="item_d">
                    <div class="left">
                        <div class="icon_d">
                            <i class='bx bx-book-alt'></i>
                        </div>
                        <div class="details">
                            <h5>Reading - Topic 1</h5>
                            <p>8:00 - 10:00</p>
                        </div>
                    </div>
                    <i class='bx bx-dots-vertical-rounded'></i>
                </div>
                <div class="item_d">
                    <div class="left">
                        <div class="icon_d">
                            <i class='bx bx-edit-alt'></i>
                        </div>
                        <div class="details">
                            <h5>Writing - Topic 2</h5>
                            <p>13:00 - 14:00</p>
                        </div>
                    </div>
                    <i class='bx bx-dots-vertical-rounded'></i>
                </div>
                <div class="item_d">
                    <div class="left">
                        <div class="icon_d">
                            <i class='bx bx-headphone'></i>
                        </div>
                        <div class="details">
                            <h5>Listening - Topic 1</h5>
                            <p>15:00 - 16:00</p>
                        </div>
                    </div>
                    <i class='bx bx-dots-vertical-rounded'></i>
                </div>
                <div class="item_d">
                    <div class="left">
                        <div class="icon_d">
                            <i class='bx bx-volume-low'></i>
                        </div>
                        <div class="details">
                            <h5>Listening - Topic 2</h5>
                            <p>19:00 - 20:00</p>
                        </div>
                    </div>
                    <i class='bx bx-dots-vertical-rounded'></i>
                </div>
            </div>
        </main>


        <!------------------------->

        <aside class="right-section">

            <div class="dseparator" id="first">
                <h4>Estadísticas Globales</h4>
            </div>

            <div class="dstats">
                <div class="item_d">
                    <div class="top">
                        <p>Comentarios</p>
                    </div>
                    <div class="bottom">
                        <div class="line"></div>
                        <h3>202</h3>
                    </div>
                </div>
                <div class="item_d">
                    <div class="top">
                        <p>Publicaciones</p>
                    </div>
                    <div class="bottom">
                        <div class="line"></div>
                        <h3>250</h3>
                    </div>
                </div>
                <div class="item_d">
                    <div class="top">
                        <p>Tiempo</p>
                        <p>En Aplicación</p>
                    </div>
                    <div class="bottom">
                        <div class="line"></div>
                        <h3>20hrs</h3>
                    </div>
                </div>
                <div class="item_d">
                    <div class="top">
                        <p>Notas</p>
                    </div>
                    <div class="bottom">
                        <div class="line"></div>
                        <h3>50</h3>
                    </div>
                </div>
            </div>
            
                        <div class="dseparator">
                <h4>Weekly Work</h4>
            </div>

            <div class="weekly_d">
                <div class="title">
                    <div class="line"></div>
                    <h5>Proceso de al</h5>
                </div>
                <div class="dprogress-bar" role="dprogressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                </div>
            </div>


        </aside>

    </div>

    <script>
        const menuOpen = document.getElementById('menu-open');
        const menuClose = document.getElementById('menu-close');
        const sideBar = document.querySelector('.dcontainer .left-section');
        const sidebarItems = document.querySelectorAll('.dcontainer .left-section .sidebar .item_d');

        menuOpen.addEventListener('click', () => {
            sideBar.style.top = '0';
        });

        menuClose.addEventListener('click', () => {
            sideBar.style.top = '-60vh';
        });

        let activeItem = sidebarItems[0];

        sidebarItems.forEach(element => {
            element.addEventListener('click', () => {
                if (activeItem) {
                    activeItem.removeAttribute('id');
                }

                element.setAttribute('id', 'active');
                activeItem = element;

            });
        });

    </script>
</body>

</html>