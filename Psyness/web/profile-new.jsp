<%-- 
    Document   : profile-new
    Created on : 23 nov. 2023, 19:01:23
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs
        ================================================== -->
    <title>Perfil</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">

    <!-- icons
    ================================================== -->
    <link rel="stylesheet" href="assets/css/icons.css">


    <!-- Bootstrap
    ================================================== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- CSS 
    ================================================== --> 
        <link rel="stylesheet" href="assets/css/uikit.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/style2.css">
        <link href="assets/css/tailwind.css" rel="stylesheet"> 
        <link rel="stylesheet" href="assets/css/cambios.css">


     <!-----Boxicons------->
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-----Fontawesome------->
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
    <!-----JQuery------->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
 
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
                <div class="contenerdor_perfiluser">

                    <!-- Profile cover -->
                    <div class="profile user-profile">
    
                        <div class="profiles_banner">
                            <img src="assets/images/avatars/fondomorado.png" alt="">
                            <div class="profile_action absolute bottom-0 right-0 space-x-1.5 p-3 text-sm z-50 hidden lg:flex">
                            
                        </div>
                        </div>
                        <div class="profiles_content">

                            <div class="profile_avatar">
                                <div class="profile_avatar_holder"> 
                                    <img src="assets/images/avatars/prof1.png" alt="">
                                </div>
                                <div class="icon_change_photo" hidden> <ion-icon name="camera" class="text-xl"></ion-icon> </div>
                            </div>

                            <div class="profile_info">
                                <h1> Axelito mix </h1>
                                <p> descripcion en palabras </p>
                            </div>

                        </div>

                        <div class="flex justify-between lg:border-t border-gray-100 flex-col-reverse lg:flex-row pt-2">
                            <nav class="responsive-nav pl-3">
                                <ul  uk-switcher="connect: #timeline-tab; animation: uk-animation-fade">
                                    <li><a href="#">Perfil</a></li>
                                    <li><a href="#">Pubs Favoritas <span>n cantidad jiji</span> </a></li>
                                    
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
        
                            <!-- Crear publiccion  -->
                            <div class="card lg:mx-0 p-4" uk-toggle="target: #create-post-modal" id="card_posting">
                                <div class="flex space-x-3">
                                    <img src="assets/images/avatars/prof1.png" class="w-10 h-10 rounded-full">
                                    <input placeholder="Que estas pensando" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full"> 
                                </div>
                                <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                                        <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                            <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                            Photo/Video 
                                        </div>
                                        <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                            <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                            Tags
                                        </div>
                                        <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer"> 
                                            <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                        </div>
                                </div> 
                            </div>
                            
                            <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                    
                                <!-- post header-->
                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                    <div class="flex flex-1 items-center space-x-4">
                                        <a href="#">
                                            <img src="assets/images/avatars/prof1.png" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                        </a>
                                        <div class="flex-1 font-semibold capitalize">
                                            <a href="#" class="text-black dark:text-gray-100">  Axelito Mix  </a>
                                            <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                        </div>
                                    </div>
                                <div>
                                    <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                    <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                
                                        <ul class="space-y-1">
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-share-alt mr-1"></i> Share
                                            </a> 
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                            </a> 
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-comment-slash mr-1"></i>   Disable comments
                                            </a> 
                                        </li> 
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-favorite mr-1"></i>  Add favorites 
                                            </a> 
                                        </li>
                                        <li>
                                            <hr class="-mx-2 my-2 dark:border-gray-800">
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                            <i class="uil-trash-alt mr-1"></i>  Delete
                                            </a> 
                                        </li>
                                        </ul>
                                    
                                    </div>
                                </div>
                                </div>
                                
                    
                    
                                <div class="p-5 pt-0 border-b dark:border-gray-700">
                    
                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat
                    
                                </div>
                                
                    
                                <div class="p-4 space-y-3"> 
                                
                                    <div class="flex space-x-4 lg:font-bold">
                                        <a href="#" class="flex items-center space-x-2">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                                </svg>
                                            </div>
                                            <div> Like</div>
                                        </a>
                                        <a href="#" class="flex items-center space-x-2">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div> Comentario</div>
                                        </a>
                                        <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                                </svg>
                                            </div>
                                            <div> Compartir</div>
                                        </a>
                                    </div>
                                    
                    
                                    <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                        <div class="flex">
                                            <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                <img src="assets/images/avatars/prof2.png" alt="" class="absolute h-full rounded-full">
                                            </div>
                                            <div>
                                                <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                    <p class="leading-6">Un comentario <urna class="i uil-heart"></urna> <i
                                                            class="uil-grin-tongue-wink"> </i> </p>
                                                    <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                </div>
                                                <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                    <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                    <a href="#"> Replay </a>
                                                    <span> 3d </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                        <input placeholder="Agregar un comentario" class="bg-transparent max-h-10 shadow-none px-5">
                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                            
                                            
                                        </div>
                                    </div>
                    
                                </div>
                    
                            </div>  
                            
                            
                            <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                    
                                <!-- post header-->
                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                    <div class="flex flex-1 items-center space-x-4">
                                        <a href="#">
                                            <img src="assets/images/avatars/prof1.png" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                        </a>
                                        <div class="flex-1 font-semibold capitalize">
                                            <a href="#" class="text-black dark:text-gray-100">  Axelito Mix  </a>
                                            <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                        </div>
                                    </div>
                                <div>
                                    <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                    <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                
                                        <ul class="space-y-1">
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-share-alt mr-1"></i> Share
                                            </a> 
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                            </a> 
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-comment-slash mr-1"></i>   Disable comments
                                            </a> 
                                        </li> 
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-favorite mr-1"></i>  Add favorites 
                                            </a> 
                                        </li>
                                        <li>
                                            <hr class="-mx-2 my-2 dark:border-gray-800">
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                            <i class="uil-trash-alt mr-1"></i>  Delete
                                            </a> 
                                        </li>
                                        </ul>
                                    
                                    </div>
                                </div>
                                </div>
                                
                    
                    
                                <div class="p-5 pt-0 border-b dark:border-gray-700">
                    
                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat
                    
                                </div>
                                
                    
                                <div class="p-4 space-y-3"> 
                                
                                    <div class="flex space-x-4 lg:font-bold">
                                        <a href="#" class="flex items-center space-x-2">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                                </svg>
                                            </div>
                                            <div> Like</div>
                                        </a>
                                        <a href="#" class="flex items-center space-x-2">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div> Comentario</div>
                                        </a>
                                        <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                                </svg>
                                            </div>
                                            <div> Compartir</div>
                                        </a>
                                    </div>
                                    
                    
                                    <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                        <div class="flex">
                                            <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                <img src="assets/images/avatars/prof2.png" alt="" class="absolute h-full rounded-full">
                                            </div>
                                            <div>
                                                <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                    <p class="leading-6">Un comentario <urna class="i uil-heart"></urna> <i
                                                            class="uil-grin-tongue-wink"> </i> </p>
                                                    <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                </div>
                                                <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                    <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                    <a href="#"> Replay </a>
                                                    <span> 3d </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                        <input placeholder="Agregar un comentario" class="bg-transparent max-h-10 shadow-none px-5">
                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                            
                                            
                                        </div>
                                    </div>
                    
                                </div>
                    
                            </div>  
                            <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                    
                                <!-- post header-->
                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                    <div class="flex flex-1 items-center space-x-4">
                                        <a href="#">
                                            <img src="assets/images/avatars/prof1.png" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                        </a>
                                        <div class="flex-1 font-semibold capitalize">
                                            <a href="#" class="text-black dark:text-gray-100"> Axelito Mix </a>
                                            <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                        </div>
                                    </div>
                                <div>
                                    <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                    <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                
                                        <ul class="space-y-1">
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-share-alt mr-1"></i> Share
                                            </a> 
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                            </a> 
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-comment-slash mr-1"></i>   Disable comments
                                            </a> 
                                        </li> 
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-favorite mr-1"></i>  Add favorites 
                                            </a> 
                                        </li>
                                        <li>
                                            <hr class="-mx-2 my-2 dark:border-gray-800">
                                        </li>
                                        <li> 
                                            <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                            <i class="uil-trash-alt mr-1"></i>  Delete
                                            </a> 
                                        </li>
                                        </ul>
                                    
                                    </div>
                                </div>
                                </div>
                                
                    
                    
                                <div class="p-5 pt-0 border-b dark:border-gray-700">
                    
                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat
                    
                                </div>
                                
                    
                                <div class="p-4 space-y-3"> 
                                
                                    <div class="flex space-x-4 lg:font-bold">
                                        <a href="#" class="flex items-center space-x-2">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                                </svg>
                                            </div>
                                            <div> Like</div>
                                        </a>
                                        <a href="#" class="flex items-center space-x-2">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div> Comentario</div>
                                        </a>
                                        <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                            <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                    <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                                </svg>
                                            </div>
                                            <div> Compartir</div>
                                        </a>
                                    </div>
                                    
                    
                                    <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                        <div class="flex">
                                            <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                <img src="assets/images/avatars/prof2.png" alt="" class="absolute h-full rounded-full">
                                            </div>
                                            <div>
                                                <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                    <p class="leading-6">Un comentario <urna class="i uil-heart"></urna> <i
                                                            class="uil-grin-tongue-wink"> </i> </p>
                                                    <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                </div>
                                                <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                    <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                    <a href="#"> Replay </a>
                                                    <span> 3d </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                        <input placeholder="Agregar un comentario" class="bg-transparent max-h-10 shadow-none px-5">
                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                            
                                            
                                        </div>
                                    </div>
                    
                                </div>
                    
                            </div>  
                            </div>
                            
                            <div class="right_side_profile">
                            <!-- Sidebar -->
                                <div class="w-full space-y-6" id="feauturings_user_perfil">
                                
                                    <div class="widget card p-5">
                                        <h4 class="text-lg font-semibold"> About </h4>
                                        <ul class="text-gray-600 space-y-3 mt-3">
                                            <li class="flex items-center space-x-2"> 
                                                <ion-icon name="home-sharp" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                Seguidores <strong> 777  </strong>
                                            </li>
                                            <li class="flex items-center space-x-2"> 
                                                <ion-icon name="globe" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                Seguidos <strong> 777 </strong>
                                            </li>
                                                                    
                                        </ul>
                                        
                                    </div>
                                </div> 

                                <div class="w-full space-y-6" id="feauturings_user_perfil">

                                    <!--------------BOLITA ESTADO DE ANIMO------------->
                                    
                                    <div class="widget card p-4">
                                        <h4 class="text-center font-semibold"> ESTADO DE ÁNIMO </h4>


                                        <h2 class="text-center p-1 mr-3"> ¿Cómo te sientes el día de hoy? </h2>

                                        <div class="flex items-center justify-between border-t border-gray-200 bg-white px-4 py-2 sm:px-6">
                                            <img src="assets/images/avatars/esfera-gradiente.png" class="object-cover rounded-lg col-span-full">
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


                        <!-- PUBS FAVS  -->
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                    
                            <!-- post header-->
                            <div class="flex justify-between items-center lg:p-4 p-2.5">
                                <div class="flex flex-1 items-center space-x-4">
                                    <a href="#">
                                        <img src="assets/images/avatars/prof1.png" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                    </a>
                                    <div class="flex-1 font-semibold capitalize">
                                        <a href="#" class="text-black dark:text-gray-100"> Axelito mix </a>
                                        <div class="text-gray-700 flex items-center space-x-2"> 5 <span> hrs </span> <ion-icon name="people"></ion-icon></div>
                                    </div>
                                </div>
                            <div>
                                <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                            
                                    <ul class="space-y-1">
                                    <li> 
                                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                        <i class="uil-share-alt mr-1"></i> Share
                                        </a> 
                                    </li>
                                    <li> 
                                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                        <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                        </a> 
                                    </li>
                                    <li> 
                                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                        <i class="uil-comment-slash mr-1"></i>   Disable comments
                                        </a> 
                                    </li> 
                                    <li> 
                                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                        <i class="uil-favorite mr-1"></i>  Add favorites 
                                        </a> 
                                    </li>
                                    <li>
                                        <hr class="-mx-2 my-2 dark:border-gray-800">
                                    </li>
                                    <li> 
                                        <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                        <i class="uil-trash-alt mr-1"></i>  Delete
                                        </a> 
                                    </li>
                                    </ul>
                                
                                </div>
                            </div>
                            </div>
                            
                
                
                            <div class="p-5 pt-0 border-b dark:border-gray-700">
                
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat
                
                            </div>
                            
                
                            <div class="p-4 space-y-3"> 
                            
                                <div class="flex space-x-4 lg:font-bold">
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                            </svg>
                                        </div>
                                        <div> Like</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <div> Comentario</div>
                                    </a>
                                    <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                        <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                                <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                            </svg>
                                        </div>
                                        <div> Compartir</div>
                                    </a>
                                </div>
                                
                
                                <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                    <div class="flex">
                                        <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                            <img src="assets/images/avatars/prof1.png" alt="" class="absolute h-full rounded-full w-full">
                                        </div>
                                        <div>
                                            <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                <p class="leading-6">Un comentario <urna class="i uil-heart"></urna> <i
                                                        class="uil-grin-tongue-wink"> </i> </p>
                                                <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                            </div>
                                            <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                <a href="#"> Replay </a>
                                                <span> 3d </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                    <input placeholder="Agregar un comentario" class="bg-transparent max-h-10 shadow-none px-5">
                                    <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                        
                                        
                                    </div>
                                </div>
                
                            </div>
                
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    
    

    <!-- Craete post modal -->
    <div id="create-post-modal" class="create-post" uk-modal>
        <div
            class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
    
            <div class="text-center py-4 border-b">
                <h3 class="text-lg font-semibold"> Crear post </h3>
                <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
            </div>
            <div class="flex flex-1 items-start space-x-4 p-5">
                <img src="assets/images/avatars/prof1.png"
                    class="bg-gray-200 border border-white rounded-full w-11 h-11">
                <div class="flex-1 pt-2">
                    <textarea class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5"
                        placeholder="Escribe"></textarea>
                </div>
    
            </div>
            <div class="bsolute bottom-0 p-4 space-x-4 w-full">
                <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-3 shadow-sm items-center">
                    <div class="lg:block hidden"> Agregar post </div>
                    <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">
                    
                        <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                        <svg class="text-red-600 h-9 p-1.5 rounded-full bg-red-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z"> </path></svg>
                        <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                        <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"> </path></svg>
                        
                        <!-- view more -->
                        <svg class="hover:bg-gray-200 h-9 p-1.5 rounded-full w-9 cursor-pointer" id="veiw-more" uk-toggle="target: #veiw-more; animation: uk-animation-fade" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"> </path></svg>
                    
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
