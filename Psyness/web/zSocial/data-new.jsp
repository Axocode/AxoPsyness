<%-- 
    Document   : data-new
    Created on : 30 nov. 2023, 23:29:25
    Author     : admin
--%>

<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Socialite is - Professional A unique and beautiful collection of UI elements">
    <title>Datacenter - Psyness</title>

     <div  hidden id="hiAxogg0"></div>       <!-- Favicon -->
        <link href="../assets/images/Icono.svg" rel="icon" type="image/png">


            <!-- icons ================================================== -->
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
        <link rel="stylesheet" href="../assets/css/uikit.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/style2.css">
        <link href="../assets/css/tailwind.css" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/cambios.css">


</head> 
<body>

<%        request.setCharacterEncoding("UTF-8");          
          HttpSession sesion = request.getSession();
          String nombreper = null;
          String seguidormain = null;
          InterUsersHelper userHelper = new InterUsersHelper();       
          InterUsersService dao = new InterUsersService();
          List<InterUsers>listita = userHelper.getListT();
          int postK = 0;
        
        if( listita != null && listita.size() > 0)
        {
        for(InterUsers suko : listita)
        {
           
           InterUsers interUsers = dao.getUserByInterUsersNum(suko.getIUserNum());
           if (interUsers != null) {
           if ((request.getParameter("follows").toString()).equals(interUsers.getIUserNum().toString())) {
            nombreper = (interUsers.getIUser());
            postK = interUsers.getIUserNum();
    }}}}
     if (nombreper.equals(session.getAttribute("SIUser"))) {
            seguidormain = "sigue";
        }
%>
          


    <div id="wrapper">

              <%String data = (String) sesion.getAttribute("SIImgNum");%>
       
    <jsp:include page="sidebar.jsp"/>


        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">
                <div class="contenedor_datacenter">
                    
                    <div class="lg:flex lg:space-x-10">
                        
                        <div class="lg:w-2/3">
                            <div class="flex justify-between items-center relative md:mb-4 mb-3">
                                <div class="flex-1">
                                    <h2 class="text-2xl font-semibold"> Informacion </h2>
                                    <nav class="responsive-nav border-b md:m-0 -mx-4">
                                        <ul uk-switcher="connect: #timeline-tab; animation: uk-animation-fade">
                                            <li><a href="#" class="lg:px-2"> Publica</a></li>
                                            <li><a href="#" class="lg:px-2"> Privada</a></li>                              
                                        </ul>
                                    </nav>
                                </div>
                                
                            </div>

                                <!-- button actions -->
                                <div class="flex items-center space-x-1.5 flex-shrink-0 pr-4 mb-2 justify-center order-1 relative"></div> 

                            <div class="uk-switcher lg:mt-8 mt-4" id="timeline-tab">

                                <!---------------------INFORMACIÓN PÚBLICA --------------------------------->

                                <div class="card lg:mx-0 uk-animation-slide-bottom-small" id="boxes_datacenter">
                                    <div class="bg-white py-24 sm:py-32">
                                        <div class="mx-auto max-w-7xl px-6 lg:px-8">
                                            <div class="mx-auto max-w-2xl sm:text-center">
                                                <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Instituciones Públicas</h2>
                                                <p class="mt-6 text-lg leading-8 text-gray-600">En caso de requerirlas</p>
                                            </div>
                                                    
                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between  py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof3.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <!--<img class="w-10 h-10 " src="assets/images/avatars/prof1.png" alt="">-->
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Servicio de Orientacion Psicologica</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Servicio de Orientación Psicológica (S.O.S)</p>
                                                                </div>
                                                            </div>
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Acerca de</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">
                                                                        Brindar información u orientación psicológica vía telefónica o chat a niñas, niños, adolescentes, jóvenes, padres de familia, personal docente y 
                                                                        público en general sobre diversas temas como: Relaciones Familiares, Relaciones Interpersonales, Sexualidad, Pareja, Depresión, Ansiedad, 
                                                                        Ideación Suicida, Métodos Anticonceptivos, etc.
                                                                    </dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">800 710 24 96</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 9:00 a 20:00 horas.</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Website</dt>
                                                                  <a class="hover:text-gray-500" href="https://difem.edomex.gob.mx/mujeres_servicio_orientacion_psicologica">sos.com</a>
                                                                </div>
                                                              </dl>
                                                            </div>
                                                          </div>    
                                                    </li>
                                                </ul>                                                       
                                            </div>
                                            <hr class="-mx-2 my-2 bg-gray-500 dark:border-gray-800">

                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof5.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <!--<img class="w-10 h-10 " src="assets/images/avatars/prof1.png" alt="">-->
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">SAPTEL</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Sistema Nacional de Apoyo en Crisis por Teléfono</p>
                                                                </div>

                                                            </div>
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Acerca de</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">
                                                                        Brindar atención para los usuarios que acuden a esta modalidad para obtener ayuda psicológica y por diferentes tipos de crisis.
                                                                    </dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">01 800 472 7835</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 11:00 - 21:00</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Website</dt>
                                                                  <a class="hover:text-gray-500" href="https://www.saptel.org.mx/">saptel.com</a>
                                                                </div>
                                                              </dl>
                                                            </div>
                                                          </div>    
                                                    </li>
                                                </ul>                                                       
                                            </div>
                                            <hr class="-mx-2 my-2 bg-gray-500 dark:border-gray-800">

                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof4.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <!--<img class="w-10 h-10 " src="assets/images/avatars/prof1.png" alt="">-->
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Instituto Nacional de Psiquiatría</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Ramón de la Fuente Muñiz</p>
                                                                </div>

                                                            </div>
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Acerca de</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">
                                                                        Proporcionar información suficiente, clara, oportuna y veraz con trato digno y humano, establecer un diagnóstico probable o de certeza,
                                                                        realizar los estudios urgentes que el personal médico juzgue necesarios, otorgar el tratamiento requerido de acuerdo al diagnóstico.
                                                                    </dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">800 710 24 96</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">Todos los días 8:00 a 21:00 horas.</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Website</dt>
                                                                  <a class="hover:text-gray-500" href="https://www.inprf.gob.mx/">inprf.com</a>
                                                                </div>
                                                              </dl>
                                                            </div>
                                                          </div>    
                                                    </li>
                                                </ul>                                                       
                                            </div>

                                        </div>
                                    </div>                      
                                </div>   


                                <!---------------------INFORMACIÓN PRIVADA --------------------------------->

                                <div class="card lg:mx-0 uk-animation-slide-bottom-small" id="boxes_datacenter">
                                    <div class="bg-white py-24 sm:py-32">
                                        <div class="mx-auto max-w-7xl px-6 lg:px-8">
                                            <div class="mx-auto max-w-2xl sm:text-center">
                                                <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Ayuda Privada</h2>
                                                <p class="mt-6 text-lg leading-8 text-gray-600">En caso de requerirlas</p>
                                            </div>
                                                    
                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof5.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Ramírez López Ricardo Manuel</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Psicología infantil</p>
                                                                </div>

                                                            </div>
                                                            
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">01 800 472 7835</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 11:00 - 21:00</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Ubicación</dt>
                                                                  <a class="hover:text-gray-500" href="#">ubi.com</a>
                                                                </div>

                                                                <div class="px-4 sm:flex sm:flex-row-reverse ">
                                                                    <button type="button" class=" button bg-blue-700 inline-flex w-full justify-center rounded-md px-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 sm:ml-3 sm:w-auto"> Contactar </button>
                                                                </div> 
                                                              </dl>
                                                            </div>
                                                          </div>  
                                                    </li>
                                                </ul>                                                       
                                            </div>

                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof1.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Nogueron Ramo Emilio</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Psicología infantil</p>
                                                                </div>

                                                            </div>
                                                            
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">01 800 233 3289</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 11:00 - 21:00</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Ubicación</dt>
                                                                  <a class="hover:text-gray-500" href="#">ubi.com</a>
                                                                </div>

                                                                <div class="px-4 sm:flex sm:flex-row-reverse ">
                                                                    <button type="button" class=" button bg-blue-700 inline-flex w-full justify-center rounded-md px-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 sm:ml-3 sm:w-auto"> Contactar </button>
                                                                </div> 
                                                              </dl>
                                                            </div>
                                                          </div>  
                                                    </li>
                                                </ul>                                                       
                                            </div>

                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof2.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Fuentes Carbajal Romeo</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Psicología infantil</p>
                                                                </div>

                                                            </div>
                                                            
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">01 800 472 2343</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 11:00 - 21:00</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Ubicación</dt>
                                                                  <a class="hover:text-gray-500" href="#">ubi.com</a>
                                                                </div>

                                                                <div class="px-4 sm:flex sm:flex-row-reverse ">
                                                                    <button type="button" class=" button bg-blue-700 inline-flex w-full justify-center rounded-md px-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 sm:ml-3 sm:w-auto"> Contactar </button>
                                                                </div> 
                                                              </dl>
                                                            </div>
                                                          </div>  
                                                    </li>
                                                </ul>                                                       
                                            </div>

                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof3.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Gomez Torres Claudia Sofia</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Psicología infantil</p>
                                                                </div>

                                                            </div>
                                                            
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">55 800 435 7835</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 11:00 - 21:00</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Ubicación</dt>
                                                                  <a class="hover:text-gray-500" href="#">ubi.com</a>
                                                                </div>

                                                                <div class="px-4 sm:flex sm:flex-row-reverse ">
                                                                    <button type="button" class=" button bg-blue-700 inline-flex w-full justify-center rounded-md px-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 sm:ml-3 sm:w-auto"> Contactar </button>
                                                                </div> 
                                                              </dl>
                                                            </div>
                                                          </div>  
                                                    </li>
                                                </ul>                                                       
                                            </div>

                                            <div class="boxes_info_public_data">
                                                <ul role="list" class="divide-y divide-gray-100" id="busquedas_users_contenedor_data">
                                                    <li class="flex justify-between gap-x-6 py-5" >

                                                        <div>
                                                            <div class="flex flex-1 items-center space-x-4 ">
                                                                <div class="px-8 sm:px-0">
                                                                    <img src="../assets/images/avatars/prof4.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                                </div>
                                                                <div class="px-4 sm:px-0">
                                                                    <h3 class="text-base font-semibold leading-7 text-gray-900">Duran Hernandez Anahí</h3>
                                                                    <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Psicología infantil</p>
                                                                </div>

                                                            </div>
                                                            
                                                            <div class="mt-6 border-t border-gray-100">
                                                              <dl class="divide-y divide-gray-100">
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Contacto</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">55 123 736 7835</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                    <dt class="text-sm font-medium leading-6">Horario de Atención</dt>
                                                                    <dd class="mt-1 text-sm leading-6 text-gray-900 sm:col-span-2 sm:mt-0">De lunes a viernes de 11:00 - 21:00</dd>
                                                                </div>
                                                                <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                                                  <dt class="text-sm font-medium leading-6 ">Ubicación</dt>
                                                                  <a class="hover:text-gray-500" href="#">ubi.com</a>
                                                                </div>

                                                                <div class="px-4 sm:flex sm:flex-row-reverse ">
                                                                    <button type="button" class=" button bg-blue-700 inline-flex w-full justify-center rounded-md px-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-500 sm:ml-3 sm:w-auto"> Contactar </button>
                                                                </div> 
                                                              </dl>
                                                            </div>
                                                          </div>  
                                                    </li>
                                                </ul>                                                       
                                            </div>

                                            

                                        </div>
                                    </div>                      
                                </div>   


                            </div>
                        </div>
                    
                   

                        <!-- Sidebar -->
                        <div class="lg:w-1/3 w-full" id="sidebar_seguidos">
                            <div uk-sticky="media @m ; offset:80 ; bottom : true" class="card">
                            
                            
                                <div class="border-b flex items-center justify-between p-4">
                                    <div>
                                        <h2 class="text-lg font-semibold">Usuarios más seguidos</h2>
                                    </div>
                                </div>
                            
                                <div class="p-4 -mt-1.5">
                            <%
                            InterUsersService masFav=  new InterUsersService();
                            List<InterUsers>list = masFav.getInterUsersMoreFav();
                            if (list!=null && list.size() > 0) {
                                    for(InterUsers usersList : list ){
                                  if (!usersList.getIUser().equals(sesion.getAttribute("SIUser"))) {
                                            InterFlowService flowww = new InterFlowService();
                                            int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");
                                            boolean seguir = flowww.isUserFollowing(usersList.getIUserNum(), FlowSeguidorID );        
                                            if (seguir == true ) {
                                        %>
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="../assets/images/avatars/<%=usersList.getIImgNum()%>" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" class="text-base font-semibold capitalize"
                                            onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"> 
                                            <%=usersList.getIUser()%></a>
                                            <div class="text-sm text-gray-500 mt-0.5"><%=usersList.getIUserSeguidores()%> Seguidores</div>
                                        </div>
                                            <a href="../zProcesos/seguirnt.jsp?follows=<%=request.getParameter("follows")%>&&id=<%=usersList.getIUserNum()%>&&chest=follows&&idP=<%=sesion.getAttribute("SIUserNum")%>"
                                           class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold" style="color:#EB74DB;">
                                            Siguiendo   
                                        </a>
                                    </div>
                                    
                                    <%}else{%>
                                    
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                           <img src="../assets/images/avatars/<%=usersList.getIImgNum()%>" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="profile-new.jsp?follows=<%=request.getParameter("follows")%>&&id=<%=usersList.getIUserNum()%>" class="text-base font-semibold capitalize"
                                            onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"> 
                                            <%=usersList.getIUser()%></a>
                                            <div class="text-sm text-gray-500 mt-0.5"><%=usersList.getIUserSeguidores()%> Seguidores</div>
                                        </div>
                                        <a href="../zProcesos/seguir.jsp?follows=<%=request.getParameter("follows")%>&&id=<%=usersList.getIUserNum()%>&&chest=follows&&idP=<%=sesion.getAttribute("SIUserNum")%>"
                                            class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold"
                                            onmouseover="this.style.color='#EB74DB'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#EB74DB')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"> 
                                            Seguir   
                                        </a>
                                    </div>
                                    
                                    <%}} if (usersList.getIUserNum().toString().equals(sesion.getAttribute("SIUserNum").toString())) {%>
                            
                                    <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                        <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" iv class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                            <img src="../assets/images/avatars/<%=usersList.getIImgNum()%>" class="absolute w-full h-full inset-0 " alt="">
                                        </a>
                                        <div class="flex-1">
                                            <a href="profile-new.jsp?id=<%=usersList.getIUserNum()%>" class="text-base font-semibold capitalize"
                                            onmouseover="this.style.color='#6B64F4'; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '#6B64F4')" 
                                            onmouseout="this.style.color=''; this.querySelectorAll('svg').forEach(svg => svg.style.fill = '')"><%=usersList.getIUser()%></a>
                                            <div class="text-sm text-gray-500 mt-0.5"><%=usersList.getIUserSeguidores()%> Seguidores</div>
                                        </div>
                                    </div>
                            
                                    <%}}}%>                                   
                            
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
    <!-- si lees esto tqm -->
    <!-- att: axelito mix -->
    <!-- att: Yorch  -->

</body>
</html>

