<%-- 
    Document   : pages
    Created on : 12 nov. 2023, 18:17:13
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs -->
    <title>Socialite Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">

    <!-- icons-->
    <link rel="stylesheet" href="assets/css/icons.css">

    <!-- CSS  --> 
    <link rel="stylesheet" href="assets/css/uikit.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="assets/css/tailwind.css" rel="stylesheet"> 


</head> 
<body>




    <div id="wrapper">

        <!-- Header -->
        <header>
            <div class="header_wrap">
                <div class="header_inner mcontainer">
                    <div class="left_side">
                        
                        <span class="slide_menu" uk-toggle="target: #wrapper ; cls: is-collapse is-active">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M3 4h18v2H3V4zm0 7h12v2H3v-2zm0 7h18v2H3v-2z" fill="currentColor"></path></svg>
                        </span>

                        <div id="logo">
                            <a href="feed.html"> 
                                <img src="assets/images/avatars/Logo con letras centrado.svg" alt="">
                                <img src="assets/images/avatars/Logo con letras centrado.svg" class="logo_mobile" alt="">
                            </a>
                        </div>
                    </div>
                     
                  <!-- search icon for mobile -->
                    <div class="header-search-icon" uk-toggle="target: #wrapper ; cls: show-searchbox"> </div>
                    <div class="header_search"><i class="uil-search-alt"></i> 
                        <input value="" type="text" class="form-control" placeholder="ayuda" autocomplete="off">
                        
                    </div>
    
                    <div class="right_side">
    
                        <div class="header_widgets">
                            <a href="pages-upgrade.html" class="is_link">  nose pero puede servir </a>   
                            
                           

                            

                            <!-- Message -->
                            <a href="chat1.jsp" class="is_icon" uk-tooltip="title: Message">
                                <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd"></path></svg>
                                <span>4</span>
                            </a>
                            
         
        
                            <a href="#">
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
                               
                                <a href="page-setting.html">
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

        <!-- sidebar -->
        <div class="sidebar">
        
            <div class="sidebar_inner" data-simplebar>
        
                <ul>
                    <li><a href="feed2.html"> 
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="text-blue-600"> 
                            <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                        </svg>
                        <span> Feed </span> </a> 
                    </li>
                    <li class="active"><a href="pages.html"> 
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="text-yellow-500">
                          <path fill-rule="evenodd" d="M3 6a3 3 0 013-3h10a1 1 0 01.8 1.6L14.25 8l2.55 3.4A1 1 0 0116 13H6a1 1 0 00-1 1v3a1 1 0 11-2 0V6z" clip-rule="evenodd"></path>
                        </svg> 
                        <span>SEGUIDOS(esto no va aqaaaaaaaaui) </span> </a> 
                    </li>
                    <li><a href="axochat.html">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="text-green-500">
                            <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm3 2h6v4H7V5zm8 8v2h1v-2h-1zm-2-2H7v4h6v-4zm2 0h1V9h-1v2zm1-4V5h-1v2h1zM5 5v2H4V5h1zm0 4H4v2h1V9zm-1 4h1v2H4v-2z" clip-rule="evenodd" />
                        </svg>
                        <span> xd</span></a> 
                    </li> 
                    <li><a href="#"> 
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="text-blue-500">
                            <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z" />
                        </svg><span> xd </span></a> 
                    </li>
                    <li><a href="#"> 
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="text-pink-500">
                            <path fill-rule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clip-rule="evenodd" />
                            <path d="M2 13.692V16a2 2 0 002 2h12a2 2 0 002-2v-2.308A24.974 24.974 0 0110 15c-2.796 0-5.487-.46-8-1.308z" />
                        </svg> <span> xd</span> </a> 
                    </li> 
                    
                    
                    
                </ul>

                
 
            </div>

            <!-- sidebar overly for mobile -->
            <div class="side_overly" uk-toggle="target: #wrapper ; cls: is-collapse is-active"></div>

        </div> 

        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">

                <div class="lg:flex lg:space-x-10">

                    <div class="lg:w-2/3">
                        <div class="flex justify-between items-center relative md:mb-4 mb-3">
                            <div class="flex-1">
                                <h2 class="text-2xl font-semibold"> Informacion </h2>
                                <nav class="responsive-nav border-b md:m-0 -mx-4">
                                    <ul>
                                        <li class="active"><a href="#" class="lg:px-2">   Usuarios </a></li>
                                        <li ><a href="#" class="lg:px-2"> Pubs Favoritas </a></li>
                                    </ul>
                                </nav>
                            </div>
                            
                        </div>
                        <br>
                        <div class="my-2 flex items-center justify-between pb-3">
                            <div>
                                <h2 class="text-xl font-semibold"> Tus Seguidores</h2>
                            </div>
                            
                         </div>

                        <div class="relative" uk-slider="finite: true">
                            <div class="uk-slider-container px-1 py-3">
                                <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">

                                    <li>
                                        <a href="timeline.html" class="uk-link-reset">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof1.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1"> U1 </h4>
                                                    <p class="font-medium text-sm">n seguirdores
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="timeline.html">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof2.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1">U2 </h4>
                                                    <p class="font-medium text-sm">n seguidores </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="timeline.html">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof3.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1"> U3</h4>
                                                    <p class="font-medium text-sm">n seguidores </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="timeline.html">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof1.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1"> U4 </h4>
                                                    <p class="font-medium text-sm">10 seguidores jaja</p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    
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
                               <h2 class="text-xl font-semibold"> Tus Seguidos</h2>
                           </div>
                        </div>

                        <div class="relative" uk-slider="finite: true">
                            <div class="uk-slider-container px-1 py-3">
                                <ul class="uk-slider-items uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-grid">
                                    <li>
                                        <a href="timeline.html" class="uk-link-reset">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof3.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1"> U5 </h4>
                                                    <p class="font-medium text-sm">843K Following </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="timeline.html">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof4.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1"> U17</h4>
                                                    <p class="font-medium text-sm">843K Following  </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="timeline.html">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof8.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1">U98 </h4>
                                                    <p class="font-medium text-sm">843K Following </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="timeline.html">
                                            <div class="card">
                                                <img src="assets/images/avatars/prof3.png" class="h-44 object-cover rounded-t-md shadow-sm w-full">
                                                <div class="p-4">
                                                    <h4 class="text-base font-semibold mb-1">Jesse Stevens </h4>
                                                    <p class="font-medium text-sm">843K Following </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    
                                
                                </ul>

                                <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -left-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                                    href="#" uk-slider-item="previous"> <i class="icon-feather-chevron-left"></i></a>
                                <a class="absolute bg-white bottom-1/2 flex items-center justify-center p-2 -right-4 rounded-full shadow-md text-xl w-9 z-10 dark:bg-gray-800 dark:text-white"
                                    href="#" uk-slider-item="next"> <i class="icon-feather-chevron-right"></i></a>

                            </div>
                        </div>


                    </div>

                    <!-- Sidebar -->
                    <div class="lg:w-1/3 w-full">
                        <div uk-sticky="media @m ; offset:80 ; bottom : true" class="card">
                        
                        
                            <div class="border-b flex items-center justify-between p-4">
                                <div>
                                    <h2 class="text-lg font-semibold">Top Usuarios</h2>
                                </div>
                                <a href="#" class="text-blue-500"> Ver mas </a>
                            </div>
                        
                            <div class="p-4 -mt-1.5">
                        
                                <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                    <a href="timeline.html" href="timeline.html"iv class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                        <img src="assets/images/avatars/prof3.png" class="absolute w-full h-full inset-0 " alt="">
                                    </a>
                                    <div class="flex-1">
                                        <a href="timeline.html" class="text-base font-semibold capitalize"> U1</a>
                                        <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                    </div>
                                    <a href="timeline.html"
                                        class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold">
                                        Follow
                                    </a>
                                </div>
                                <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                    <a href="timeline.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                        <img src="assets/images/avatars/prof2.png" class="absolute w-full h-full inset-0 " alt="">
                                    </a>
                                    <div class="flex-1">
                                        <a href="timeline.html" class="text-base font-semibold capitalize"> U2 </a>
                                        <div class="text-sm text-gray-500 mt-0.5"> 356k Following </div>
                                    </div>
                                    <a href="timeline.html"
                                        class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold">
                                        Follow
                                    </a>
                                </div>
                                <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                    <a href="timeline.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                        <img src="assets/images/avatars/prof7.png" class="absolute w-full h-full inset-0" alt="">
                                    </a>
                                    <div class="flex-1">
                                        <a href="timeline.html" class="text-base font-semibold capitalize">U3</a>
                                        <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                    </div>
                                    <a href="timeline.html"
                                        class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold">
                                        Follow
                                    </a>
                                </div>
                                
                        
                            </div>
                        
                            <a href="#" class="block text-center pb-4 font-medium text-blue-500"> See all </a>
                        
                        </div>
                    </div>

                </div>


            </div>
        </div>

    </div>



    

    
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

</body>

</html>
