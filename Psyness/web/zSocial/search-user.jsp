<%-- 
    Document   : search-user
    Created on : Mar 11, 2024, 1:39:16 AM
    Author     : makak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
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
    
    

    <body>
        <div id="wrapper">
           
        <jsp:include page="sidebar.jsp"/>
        
                <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">
                <div class="contenedor_datacenter">
                    
                    <div class="lg:flex lg:space-x-10">
                        
                        <div class="lg:w-2/3">
                            <div class="flex justify-between items-center relative md:mb-4 mb-3">
                                <div class="flex-1">
                                    <h2 class="text-2xl font-semibold"> Clínicas </h2>
                                    <nav class="responsive-nav border-b md:m-0 -mx-4">
                                        <ul uk-switcher="connect: #timeline-tab; animation: uk-animation-fade">
                                            <li><a href="#" class="lg:px-2"> Psicólogos</a></li>
                                            <li><a href="#" class="lg:px-2"> Pacientes</a></li>                              
                                        </ul>
                                    </nav>
                                </div>
                                
                            </div>
                                
                            <style>
                                .boton-select-menusito {
                                    padding: 10px 15px;
                                    font-size: 16px;
                                    font-weight: bold;
                                    color: #fff;
                                    background-color: #99d1ff;
                                    border: none;
                                    border-radius: 5px;
                                    cursor: pointer;
                                    transition: background-color 0.3s ease;
                                  }

                                  .boton-select-menusito:hover {
                                    background-color: #787df1;
                                  }

                            </style>
                            
                                    <!--BOXES PUB-->

                                <div class="card lg:mx-0 uk-animation-slide-bottom-small" id="contenedor_busqueda">
                                    <div class="bg-white py-24 sm:py-">
                                        <div class="mx-auto max-w-2xl px-2 lg:px-8">

                                            <div class="border-b flex items-center justify-between p-4">
                                                <div>
                                                    <h2 class="text-lg font-semibold">Búsqueda de Usuarios</h2>
                                                </div>
                                            </div>
                                            <nav>
                                                <input class="box-search" type="text" placeholder="Buscar">
                                            </nav>

                                            <ul role="list" class="overflow-auto divide-y divide-gray-100 border-b" id="busquedas_users_contenedor">
                                                <li class="flex justify-between gap-x-6 py-5" >
                                                  <div class="flex min-w-0 gap-x-4" id="busquedas_users">
                                                    <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="images/prof1.png" alt="">
                                                    <div class="min-w-0 flex-auto">
                                                      <p class="text-sm font-semibold leading-6 text-gray-900" id="texto_busqeuda_user">Yorch1234</p>
                                                      <p class="mt-1 truncate text-xs leading-5 text-gray-500">Yorch</p>
                                                    </div>
                                                  </div>   
                                                    <div class="select-menusito">
                                                        <select id="miSelect" class="select-menu">
                                                            <option value="opcion1">Psicologos</option>
                                                            <option value="opcion2">Pacientes</option>
                                                            <option value="opcion3">Ye</option>
                                                        </select>
                                                        <button class="boton-select-menusito">Dar de Alta</button>

                                                    </div>
                                                </li>
                                                <li class="flex justify-between gap-x-6 py-5" id="busquedas_users_contenedor">
                                                    <div class="flex min-w-0 gap-x-4" id="busquedas_users">
                                                      <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="images/prof2.png" alt="">
                                                      <div class="min-w-0 flex-auto">
                                                        <p class="text-sm font-semibold leading-6 text-gray-900"  id="texto_busqeuda_user">Vargas1341</p>
                                                        <p class="mt-1 truncate text-xs leading-5 text-gray-500">FerVargas</p>
                                                      </div>
                                                    </div>
                                                    <div class="select-menusito">
                                                        <select id="miSelect" class="select-menu">
                                                            <option value="opcion1">Psicologos</option>
                                                            <option value="opcion2">Pacientes</option>
                                                            <option value="opcion3">Ye</option>
                                                        </select>
                                                        <button class="boton-select-menusito">Dar de Alta</button>
                                                    </div>
                                                  </li>
                                                  <li class="flex justify-between gap-x-6 py-5" id="busquedas_users_contenedor">
                                                    <div class="flex min-w-0 gap-x-4" id="busquedas_users">
                                                      <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="images/prof3.png" alt="">
                                                      <div class="min-w-0 flex-auto">
                                                        <p class="text-sm font-semibold leading-6 text-gray-900"  id="texto_busqeuda_user">JohanUwW</p>
                                                        <p class="mt-1 truncate text-xs leading-5 text-gray-500">Yohan</p>
                                                      </div>
                                                    </div>
                                                    <div class="select-menusito">
                                                        <select id="miSelect" class="select-menu">
                                                            <option value="opcion1">Psicologos</option>
                                                            <option value="opcion2">Pacientes</option>
                                                            <option value="opcion3">Ye</option>
                                                        </select>
                                                        <button class="boton-select-menusito">Dar de Alta</button>
                                                    </div>
                                                  </li>
                                                  <li class="flex justify-between gap-x-6 py-5" id="busquedas_users_contenedor">
                                                    <div class="flex min-w-0 gap-x-4" id="busquedas_users">
                                                      <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="images/prof4.png" alt="">
                                                      <div class="min-w-0 flex-auto">
                                                        <p class="text-sm font-semibold leading-6 text-gray-900"  id="texto_busqeuda_user">Axel42891</p>
                                                        <p class="mt-1 truncate text-xs leading-5 text-gray-500">Nextle</p>
                                                      </div>
                                                    </div>
                                                    <div class="select-menusito">
                                                        <select id="miSelect" class="select-menu">
                                                            <option value="opcion1">Psicologos</option>
                                                            <option value="opcion2">Pacientes</option>
                                                            <option value="opcion3">Ye</option>
                                                        </select>
                                                        <button class="boton-select-menusito">Dar de Alta</button>
                                                    </div>
                                                  </li>
                                                  <li class="flex justify-between gap-x-6 py-5" id="busquedas_users_contenedor">
                                                    <div class="flex min-w-0 gap-x-4" id="busquedas_users">
                                                      <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="images/prof5.png" alt="">
                                                      <div class="min-w-0 flex-auto">
                                                        <p class="text-sm font-semibold leading-6 text-gray-900"  id="texto_busqeuda_user">Perro_NAOH</p>
                                                        <p class="mt-1 truncate text-xs leading-5 text-gray-500">Doggy</p>
                                                      </div>
                                                    </div>
                                                     <div class="select-menusito">
                                                        <select id="miSelect" class="select-menu">
                                                            <option value="opcion1">Psicologos</option>
                                                            <option value="opcion2">Pacientes</option>
                                                            <option value="opcion3">Ye</option>
                                                        </select>
                                                         <button class="boton-select-menusito">Dar de Alta</button>
                                                    </div>
                                                  </li>
                                                  <li class="flex justify-between gap-x-6 py-5" id="busquedas_users_contenedor">
                                                    <div class="flex min-w-0 gap-x-4" id="busquedas_users">
                                                      <img class="h-12 w-12 flex-none rounded-full bg-gray-50" src="images/prof6.png" alt="">
                                                      <div class="min-w-0 flex-auto">
                                                        <p class="text-sm font-semibold leading-6 text-gray-900"  id="texto_busqeuda_user">Yael48392</p>
                                                        <p class="mt-1 truncate text-xs leading-5 text-gray-500">Valentain</p>
                                                      </div>
                                                    </div>
                                                    <div class="select-menusito">
                                                        <select id="miSelect" class="select-menu">
                                                            <option value="opcion1">Psicologos</option>
                                                            <option value="opcion2">Pacientes</option>
                                                            <option value="opcion3">Ye</option>
                                                        </select>
                                                        <button class="boton-select-menusito">Dar de Alta</button>
                                                    </div>
                                                  </li>
                                              </ul>


                                        </div>      
                                    </div>
                                </div>
                            
                            

                        </div>
                    
                   


                        <!----------------- Sidebar - Profile---------------------->
                        <div class="lg:w-1/3 w-full" id="sidebar_registros">
                            <div uk-sticky="media @m ; offset:80 ; bottom : true" class="card">
                            
                            
                                <div class="border-b flex items-center justify-between p-4">
                                    <div>
                                        <h2 class="text-lg font-semibold">Usuarios Registrados</h2>
                                    </div>
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
                                            <div class="boton-tipo-user font-semibold">
                                                <h2>Psicologo</h2>
                                             </div>
                                    </div>
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="timeline.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="assets/images/avatars/prof2.png" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="timeline.html" class="text-base font-semibold capitalize"> U2 </a>
                                            <div class="text-sm text-gray-500 mt-0.5"> 356k Following </div>
                                        </div>
                                            <div class="boton-tipo-user font-semibold">
                                                <h2>Paciente</h2>
                                             </div>
                                    </div>
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="timeline.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="assets/images/avatars/prof7.png" class="absolute w-full h-full inset-0" alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="timeline.html" class="text-base font-semibold capitalize">U3</a>
                                            <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                        </div>
                                            <div class="boton-tipo-user font-semibold">
                                                <h2>Paciente</h2>
                                             </div>
                                    </div>
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="timeline.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="assets/images/avatars/prof7.png" class="absolute w-full h-full inset-0" alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="timeline.html" class="text-base font-semibold capitalize">U4</a>
                                            <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                        </div>
                                            <div class="boton-tipo-user font-semibold">
                                                <h2>Ye</h2>
                                             </div>
                                    </div>
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="timeline.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="assets/images/avatars/prof7.png" class="absolute w-full h-full inset-0" alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="timeline.html" class="text-base font-semibold capitalize">U5</a>
                                            <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                        </div>
                                            <div class="boton-tipo-user font-semibold">
                                                <h2>Psicologo</h2>
                                             </div>
                                    </div>
                                    
                            
                                </div>
                            

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
            
        </div>
    </body>
    
    
</html>
