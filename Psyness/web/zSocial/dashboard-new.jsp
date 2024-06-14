<%-- 
    Document   : dashboard-new.jsp
    Created on : 26 feb. 2024, 00:13:01
    Author     : admin
--%>

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
        <title>Dashboard - Psyness</title>
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
        <link href="../assets/css/dashboard.css" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/cambios.css">

 </head>

<body>
    <div id="wrapper">
                    <!-- Header -->
        <jsp:include page="sidebar.jsp"/>
        
       
        <div class="main_content">
            <div class="mcontainer" id="contenedor_dash">

                <!--**********************************
                    Main wrapper start
                ***********************************-->           
                    
                    <!--**********************************
                        Content body start                   AQUI COLOCAR LAS STATS DE LOS USUARIOS
                    ***********************************-->
                        <!-- row -->
                         
                        <div class="container-fluid">
                            <div class="row invoice-card-row">
                                <div class="col-xl-3 col-xxl-3 col-sm-6">
                                    <div class="card bg-warning invoice-card">
                                        <div class="card-body d-flex">
                                            <div class="icon me-4">
                                                <svg  width="43px" height="42px">
                                                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                                                 d="M31.963,30.931 C31.818,31.160 31.609,31.342 31.363,31.455 C31.175,31.538 30.972,31.582 30.767,31.583 C30.429,31.583 30.102,31.463 29.845,31.243 L25.802,27.786 L21.758,31.243 C21.502,31.463 21.175,31.583 20.837,31.583 C20.498,31.583 20.172,31.463 19.915,31.243 L15.872,27.786 L11.829,31.243 C11.622,31.420 11.370,31.534 11.101,31.572 C10.832,31.609 10.558,31.569 10.311,31.455 C10.065,31.342 9.857,31.160 9.710,30.931 C9.565,30.703 9.488,30.437 9.488,30.167 L9.488,17.416 L2.395,17.416 C2.019,17.416 1.658,17.267 1.392,17.001 C1.126,16.736 0.976,16.375 0.976,16.000 L0.976,6.083 C0.976,4.580 1.574,3.139 2.639,2.076 C3.703,1.014 5.146,0.417 6.651,0.417 L26.511,0.417 C28.016,0.417 29.459,1.014 30.524,2.076 C31.588,3.139 32.186,4.580 32.186,6.083 L32.186,30.167 C32.186,30.437 32.109,30.703 31.963,30.931 ZM9.488,6.083 C9.488,5.332 9.189,4.611 8.657,4.080 C8.125,3.548 7.403,3.250 6.651,3.250 C5.898,3.250 5.177,3.548 4.645,4.080 C4.113,4.611 3.814,5.332 3.814,6.083 L3.814,14.583 L9.488,14.583 L9.488,6.083 ZM29.348,6.083 C29.348,5.332 29.050,4.611 28.517,4.080 C27.985,3.548 27.263,3.250 26.511,3.250 L11.559,3.250 C12.059,4.111 12.324,5.088 12.325,6.083 L12.325,27.092 L14.950,24.840 C15.207,24.620 15.534,24.500 15.872,24.500 C16.210,24.500 16.537,24.620 16.794,24.840 L20.837,28.296 L24.880,24.840 C25.137,24.620 25.463,24.500 25.802,24.500 C26.140,24.500 26.467,24.620 26.724,24.840 L29.348,27.092 L29.348,6.083 ZM25.092,20.250 L16.581,20.250 C16.205,20.250 15.844,20.101 15.578,19.835 C15.312,19.569 15.162,19.209 15.162,18.833 C15.162,18.457 15.312,18.097 15.578,17.831 C15.844,17.566 16.205,17.416 16.581,17.416 L25.092,17.416 C25.469,17.416 25.829,17.566 26.096,17.831 C26.362,18.097 26.511,18.457 26.511,18.833 C26.511,19.209 26.362,19.569 26.096,19.835 C25.829,20.101 25.469,20.250 25.092,20.250 ZM25.092,14.583 L16.581,14.583 C16.205,14.583 15.844,14.434 15.578,14.168 C15.312,13.903 15.162,13.542 15.162,13.167 C15.162,12.791 15.312,12.430 15.578,12.165 C15.844,11.899 16.205,11.750 16.581,11.750 L25.092,11.750 C25.469,11.750 25.829,11.899 26.096,12.165 C26.362,12.430 26.511,12.791 26.511,13.167 C26.511,13.542 26.362,13.903 26.096,14.168 C25.829,14.434 25.469,14.583 25.092,14.583 ZM25.092,8.916 L16.581,8.916 C16.205,8.916 15.844,8.767 15.578,8.501 C15.312,8.236 15.162,7.875 15.162,7.500 C15.162,7.124 15.312,6.764 15.578,6.498 C15.844,6.232 16.205,6.083 16.581,6.083 L25.092,6.083 C25.469,6.083 25.829,6.232 26.096,6.498 C26.362,6.764 26.511,7.124 26.511,7.500 C26.511,7.875 26.362,8.236 26.096,8.501 C25.829,8.767 25.469,8.916 25.092,8.916 Z"/>
                                                </svg>
                                                
                                            </div>
                                            <div>
                                                <h2 class="text-white invoice-num">2478</h2>
                                                <span class="text-white fs-18">Total publicaciones</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-xxl-3 col-sm-6">
                                    <div class="card bg-success invoice-card">
                                        <div class="card-body d-flex">
                                            <div class="icon me-3">
                                                <svg width="35px" height="34px">
                                                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                                                 d="M32.482,9.730 C31.092,6.789 28.892,4.319 26.120,2.586 C22.265,0.183 17.698,-0.580 13.271,0.442 C8.843,1.458 5.074,4.140 2.668,7.990 C0.255,11.840 -0.509,16.394 0.514,20.822 C1.538,25.244 4.224,29.008 8.072,31.411 C10.785,33.104 13.896,34.000 17.080,34.000 L17.286,34.000 C20.456,33.960 23.541,33.044 26.213,31.358 C26.991,30.866 27.217,29.844 26.725,29.067 C26.234,28.291 25.210,28.065 24.432,28.556 C22.285,29.917 19.799,30.654 17.246,30.687 C14.627,30.720 12.067,29.997 9.834,28.609 C6.730,26.671 4.569,23.644 3.752,20.085 C2.934,16.527 3.546,12.863 5.486,9.763 C9.488,3.370 17.957,1.418 24.359,5.414 C26.592,6.808 28.360,8.793 29.477,11.157 C30.568,13.460 30.993,16.016 30.707,18.539 C30.607,19.448 31.259,20.271 32.177,20.371 C33.087,20.470 33.911,19.820 34.011,18.904 C34.363,15.764 33.832,12.591 32.482,9.730 L32.482,9.730 Z"/>
                                                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                                                 d="M22.593,11.237 L14.575,19.244 L11.604,16.277 C10.952,15.626 9.902,15.626 9.250,16.277 C8.599,16.927 8.599,17.976 9.250,18.627 L13.399,22.770 C13.725,23.095 14.150,23.254 14.575,23.254 C15.001,23.254 15.427,23.095 15.753,22.770 L24.940,13.588 C25.592,12.937 25.592,11.888 24.940,11.237 C24.289,10.593 23.238,10.593 22.593,11.237 L22.593,11.237 Z"/>
                                                </svg>
                                                
                                            </div>
                                            <div>
                                                <h2 class="text-white invoice-num">983</h2>
                                                <span class="text-white fs-18">Total likes</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-xxl-3 col-sm-6">
                                    <div class="card bg-info invoice-card">
                                        <div class="card-body d-flex">
                                            <div class="icon me-3">
                                                <svg  width="35px" height="34px">
                                                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                                                 d="M33.002,9.728 C31.612,6.787 29.411,4.316 26.638,2.583 C22.781,0.179 18.219,-0.584 13.784,0.438 C9.356,1.454 5.585,4.137 3.178,7.989 C0.764,11.840 -0.000,16.396 1.023,20.825 C2.048,25.247 4.734,29.013 8.584,31.417 C11.297,33.110 14.409,34.006 17.594,34.006 L17.800,34.006 C20.973,33.967 24.058,33.050 26.731,31.363 C27.509,30.872 27.735,29.849 27.243,29.072 C26.751,28.296 25.727,28.070 24.949,28.561 C22.801,29.922 20.314,30.660 17.761,30.693 C15.141,30.726 12.581,30.002 10.346,28.614 C7.241,26.675 5.080,23.647 4.262,20.088 C3.444,16.515 4.056,12.850 5.997,9.748 C10.001,3.353 18.473,1.401 24.876,5.399 C27.110,6.793 28.879,8.779 29.996,11.143 C31.087,13.447 31.513,16.004 31.227,18.527 C31.126,19.437 31.778,20.260 32.696,20.360 C33.607,20.459 34.432,19.809 34.531,18.892 C34.884,15.765 34.352,12.591 33.002,9.728 L33.002,9.728 Z"/>
                                                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                                                 d="M23.380,11.236 C22.728,10.585 21.678,10.585 21.026,11.236 L17.608,14.656 L14.190,11.243 C13.539,10.592 12.488,10.592 11.836,11.243 C11.184,11.893 11.184,12.942 11.836,13.593 L15.254,17.006 L11.836,20.420 C11.184,21.071 11.184,22.120 11.836,22.770 C12.162,23.096 12.588,23.255 13.014,23.255 C13.438,23.255 13.864,23.096 14.190,22.770 L17.608,19.357 L21.026,22.770 C21.352,23.096 21.777,23.255 22.203,23.255 C22.629,23.255 23.054,23.096 23.380,22.770 C24.031,22.120 24.031,21.071 23.380,20.420 L19.962,17.000 L23.380,13.587 C24.031,12.936 24.031,11.887 23.380,11.236 L23.380,11.236 Z"/>
                                                </svg>
                                                
                                            </div>
                                            <div>
                                                <h2 class="text-white invoice-num">1256</h2>
                                                <span class="text-white fs-18">Total favoritos</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-xxl-3 col-sm-6">
                                    <div class="card bg-secondary invoice-card">
                                        <div class="card-body d-flex">
                                            <div class="icon me-3">
                                                <svg  width="33px" height="32px">
                                                <path fill-rule="evenodd"  fill="rgb(255, 255, 255)"
                                                 d="M31.963,30.931 C31.818,31.160 31.609,31.342 31.363,31.455 C31.175,31.538 30.972,31.582 30.767,31.583 C30.429,31.583 30.102,31.463 29.845,31.243 L25.802,27.786 L21.758,31.243 C21.502,31.463 21.175,31.583 20.837,31.583 C20.498,31.583 20.172,31.463 19.915,31.243 L15.872,27.786 L11.829,31.243 C11.622,31.420 11.370,31.534 11.101,31.572 C10.832,31.609 10.558,31.569 10.311,31.455 C10.065,31.342 9.857,31.160 9.710,30.931 C9.565,30.703 9.488,30.437 9.488,30.167 L9.488,17.416 L2.395,17.416 C2.019,17.416 1.658,17.267 1.392,17.001 C1.126,16.736 0.976,16.375 0.976,16.000 L0.976,6.083 C0.976,4.580 1.574,3.139 2.639,2.076 C3.703,1.014 5.146,0.417 6.651,0.417 L26.511,0.417 C28.016,0.417 29.459,1.014 30.524,2.076 C31.588,3.139 32.186,4.580 32.186,6.083 L32.186,30.167 C32.186,30.437 32.109,30.703 31.963,30.931 ZM9.488,6.083 C9.488,5.332 9.189,4.611 8.657,4.080 C8.125,3.548 7.403,3.250 6.651,3.250 C5.898,3.250 5.177,3.548 4.645,4.080 C4.113,4.611 3.814,5.332 3.814,6.083 L3.814,14.583 L9.488,14.583 L9.488,6.083 ZM29.348,6.083 C29.348,5.332 29.050,4.611 28.517,4.080 C27.985,3.548 27.263,3.250 26.511,3.250 L11.559,3.250 C12.059,4.111 12.324,5.088 12.325,6.083 L12.325,27.092 L14.950,24.840 C15.207,24.620 15.534,24.500 15.872,24.500 C16.210,24.500 16.537,24.620 16.794,24.840 L20.837,28.296 L24.880,24.840 C25.137,24.620 25.463,24.500 25.802,24.500 C26.140,24.500 26.467,24.620 26.724,24.840 L29.348,27.092 L29.348,6.083 ZM25.092,20.250 L16.581,20.250 C16.205,20.250 15.844,20.101 15.578,19.835 C15.312,19.569 15.162,19.209 15.162,18.833 C15.162,18.457 15.312,18.097 15.578,17.831 C15.844,17.566 16.205,17.416 16.581,17.416 L25.092,17.416 C25.469,17.416 25.829,17.566 26.096,17.831 C26.362,18.097 26.511,18.457 26.511,18.833 C26.511,19.209 26.362,19.569 26.096,19.835 C25.829,20.101 25.469,20.250 25.092,20.250 ZM25.092,14.583 L16.581,14.583 C16.205,14.583 15.844,14.434 15.578,14.168 C15.312,13.903 15.162,13.542 15.162,13.167 C15.162,12.791 15.312,12.430 15.578,12.165 C15.844,11.899 16.205,11.750 16.581,11.750 L25.092,11.750 C25.469,11.750 25.829,11.899 26.096,12.165 C26.362,12.430 26.511,12.791 26.511,13.167 C26.511,13.542 26.362,13.903 26.096,14.168 C25.829,14.434 25.469,14.583 25.092,14.583 ZM25.092,8.916 L16.581,8.916 C16.205,8.916 15.844,8.767 15.578,8.501 C15.312,8.236 15.162,7.875 15.162,7.500 C15.162,7.124 15.312,6.764 15.578,6.498 C15.844,6.232 16.205,6.083 16.581,6.083 L25.092,6.083 C25.469,6.083 25.829,6.232 26.096,6.498 C26.362,6.764 26.511,7.124 26.511,7.500 C26.511,7.875 26.362,8.236 26.096,8.501 C25.829,8.767 25.469,8.916 25.092,8.916 Z"/>
                                                </svg>
                                            
                                            </div>
                                            <div>
                                                <h2 class="text-white invoice-num">652</h2>
                                                <span class="text-white fs-18">Total follows</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--**********************************
                                    AQUI COLOCAR LAS PREFERENCIAS DE CONTENIDO RELACIONADO CON LAS ETIQUETAS DE PUBLICACIONES
                            ***********************************-->


                            <div class="row">
                                <div class="col-xl-12 col-xxl-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row align-items-center">
                                                <div class="col-xl-4">
                                                    <div class=" lg:mx-0 p-9" id="contenedor_side_right_pf">
                                                        <div class="boxesita_rights_feed">
                    
                                                            <img src="images/pattern/circle.png" class="mb-4" alt="">
                                                            <a href="profile-new.jsp">
                                                                <img src="../assets/images/avatars/prof1.png" class="bg-gray-200 border border-white rounded-full w-14 h-14">
                                                            </a>
                                                            <div class="flex-1 font-semibold capitalize">
                                                                <a href="profile-new.jsp?>" class="text-black dark:text-white" id="name_user_feed">Yoyoyoyoy</a>
                                                                <div class="text-gray-500 flex items-center space-x-2"><span>Edad</span></div>
                                                            </div>
                                                        </div>
                    
                                                        <a href="follow-new.jsp">
                                                            <ul class="text-gray-600 space-y-3 mt-3">
                                                                <li class="flex items-center space-x-2"> 
                                                                    <ion-icon name="home-sharp" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                                    Seguidores <strong>14  </strong>
                                                                </li>
                                                                <li class="flex items-center space-x-2"> 
                                                                    <ion-icon name="globe" class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                                                    Seguidos <strong>14</strong>
                                                                </li>                                         
                                                            </ul>
                                                        </a>
                                                    </div>      
                                                </div>

                                                <div class="col-xl-8">
                                                    <div class="row mt-xl-0 mt-4">
                                                        <div class="col-md-6">
                                                            <h4 class="card-title align-items-center">Preferencia de Contenido</h4>
                                                            <span>Publicaciones que preferentemente son mostradas en el feed</span>
                                                            <ul class="card-list mt-4">
                                                                <li><span class="bg-blue circle"></span>Depresion<span>20%</span></li>
                                                                <li><span class="bg-success circle"></span>Autoestima<span>40%</span></li>
                                                                <li><span class="bg-warning circle"></span>Problemas de Sueño<span>15%</span></li>
                                                                <li><span class="bg-light circle"></span>Otros<span>15%</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <canvas id="polarChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    

                            <!--**********************************
                                    AQUI COLOCAR LA ACTIVIDAD RECIENTE DEL USUARIO
                            ***********************************-->
                                
                            <div class="row">
                                    
                                <div class="col-xl-12 col-xxl-12">
                                    <div class="card">
                                        <div class="card-header p-3 d-block d-sm-flex border-0" style="background-color: #fff;">
                                            <div class="me-3">
                                                <h4 class="card-title mb-2">Actividad Reciente</h4>
                                                <span class="fs-12">Ultimas interacciones</span>
                                            </div>
                                            <div class="card-tabs mt-3 mt-sm-0">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" data-bs-toggle="tab" href="#Today" role="tab">Hoy</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-bs-toggle="tab" href="#Weekly" role="tab">Semanales</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-bs-toggle="tab" href="#monthly" role="tab">Mensuales</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-body tab-content p-0">
                                            <div class="tab-pane active show fade" id="Today" role="tabpanel">
                                                <div class="table-responsive">
                                                    <table class="table table-responsive-md card-table transactions-table">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <svg class="bgl-success tr-icon" width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                        <g><path d="M35.2219 42.9875C34.8938 42.3094 35.1836 41.4891 35.8617 41.1609C37.7484 40.2531 39.3453 38.8422 40.4828 37.0758C41.6477 35.2656 42.2656 33.1656 42.2656 31C42.2656 24.7875 37.2125 19.7344 31 19.7344C24.7875 19.7344 19.7344 24.7875 19.7344 31C19.7344 33.1656 20.3523 35.2656 21.5117 37.0813C22.6437 38.8477 24.2461 40.2586 26.1328 41.1664C26.8109 41.4945 27.1008 42.3094 26.7727 42.993C26.4445 43.6711 25.6297 43.9609 24.9461 43.6328C22.6 42.5063 20.6148 40.7563 19.2094 38.5578C17.7656 36.3047 17 33.6906 17 31C17 27.2594 18.4547 23.743 21.1016 21.1016C23.743 18.4547 27.2594 17 31 17C34.7406 17 38.257 18.4547 40.8984 21.1016C43.5453 23.7484 45 27.2594 45 31C45 33.6906 44.2344 36.3047 42.7852 38.5578C41.3742 40.7508 39.3891 42.5063 37.0484 43.6328C36.3648 43.9555 35.55 43.6711 35.2219 42.9875Z" fill="#2BC155"></path><path d="M36.3211 31.7274C36.5891 31.9953 36.7203 32.3453 36.7203 32.6953C36.7203 33.0453 36.5891 33.3953 36.3211 33.6633L32.8812 37.1031C32.3781 37.6063 31.7109 37.8797 31.0055 37.8797C30.3 37.8797 29.6273 37.6008 29.1297 37.1031L25.6898 33.6633C25.1539 33.1274 25.1539 32.2633 25.6898 31.7274C26.2258 31.1914 27.0898 31.1914 27.6258 31.7274L29.6437 33.7453L29.6437 25.9742C29.6437 25.2196 30.2562 24.6071 31.0109 24.6071C31.7656 24.6071 32.3781 25.2196 32.3781 25.9742L32.3781 33.7508L34.3961 31.7328C34.9211 31.1969 35.7852 31.1969 36.3211 31.7274Z" fill="#2BC155"></path>
                                                                        </g>
                                                                    </svg>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 font-w600 mb-0"><a href="javascript:void(0);" class="text-black">Usuario</a></h6>
                                                                    <span class="fs-14">Ver</span>
                                                                </td>
                                                                <td>
                                                                    <span>
                                                                        <a class="hover:text-gray-400" href="post.jsp"> Hola quiero decir que ando triste porque...<!--Haz un metodo para extrar solo 5 palabras--> </a>
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 text-black font-w600 mb-0">June 4, 2020</h6>
                                                                    <span class="fs-14">05:34:45 AM</span>
                                                                </td>
                                                                <td>
                                                                    <span class="fs-16 font-w500 text-end d-block" style="color: #787df1;">Publicación</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <svg class="bgl-success tr-icon" width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g><path d="M35.2219 42.9875C34.8938 42.3094 35.1836 41.4891 35.8617 41.1609C37.7484 40.2531 39.3453 38.8422 40.4828 37.0758C41.6477 35.2656 42.2656 33.1656 42.2656 31C42.2656 24.7875 37.2125 19.7344 31 19.7344C24.7875 19.7344 19.7344 24.7875 19.7344 31C19.7344 33.1656 20.3523 35.2656 21.5117 37.0813C22.6437 38.8477 24.2461 40.2586 26.1328 41.1664C26.8109 41.4945 27.1008 42.3094 26.7727 42.993C26.4445 43.6711 25.6297 43.9609 24.9461 43.6328C22.6 42.5063 20.6148 40.7563 19.2094 38.5578C17.7656 36.3047 17 33.6906 17 31C17 27.2594 18.4547 23.743 21.1016 21.1016C23.743 18.4547 27.2594 17 31 17C34.7406 17 38.257 18.4547 40.8984 21.1016C43.5453 23.7484 45 27.2594 45 31C45 33.6906 44.2344 36.3047 42.7852 38.5578C41.3742 40.7508 39.3891 42.5063 37.0484 43.6328C36.3648 43.9555 35.55 43.6711 35.2219 42.9875Z" fill="#2BC155"></path><path d="M36.3211 31.7274C36.5891 31.9953 36.7203 32.3453 36.7203 32.6953C36.7203 33.0453 36.5891 33.3953 36.3211 33.6633L32.8812 37.1031C32.3781 37.6063 31.7109 37.8797 31.0055 37.8797C30.3 37.8797 29.6273 37.6008 29.1297 37.1031L25.6898 33.6633C25.1539 33.1274 25.1539 32.2633 25.6898 31.7274C26.2258 31.1914 27.0898 31.1914 27.6258 31.7274L29.6437 33.7453L29.6437 25.9742C29.6437 25.2196 30.2562 24.6071 31.0109 24.6071C31.7656 24.6071 32.3781 25.2196 32.3781 25.9742L32.3781 33.7508L34.3961 31.7328C34.9211 31.1969 35.7852 31.1969 36.3211 31.7274Z" fill="#2BC155"></path>
									</g>
                                                                    </svg>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 font-w600 mb-0"><a href="javascript:void(0);" class="text-black">Usuario</a></h6>
                                                                    <span class="fs-14">Ver</span>
                                                                </td>
                                                                <td>
                                                                    <span>
                                                                        <a class="hover:text-gray-400" href="post.jsp"> Hola quiero decir que ando triste porque...<!--Haz un metodo para extrar solo 5 palabras--> </a>
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 text-black font-w600 mb-0">June 4, 2020</h6>
                                                                    <span class="fs-14">05:34:45 AM</span>
                                                                </td>
                                                                <td>
                                                                    <span class="fs-16 font-w500 text-end d-block" style="color: #007bff;">Dio Like</span>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td>
                                                                    <svg class="bgl-success tr-icon" width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g><path d="M35.2219 42.9875C34.8938 42.3094 35.1836 41.4891 35.8617 41.1609C37.7484 40.2531 39.3453 38.8422 40.4828 37.0758C41.6477 35.2656 42.2656 33.1656 42.2656 31C42.2656 24.7875 37.2125 19.7344 31 19.7344C24.7875 19.7344 19.7344 24.7875 19.7344 31C19.7344 33.1656 20.3523 35.2656 21.5117 37.0813C22.6437 38.8477 24.2461 40.2586 26.1328 41.1664C26.8109 41.4945 27.1008 42.3094 26.7727 42.993C26.4445 43.6711 25.6297 43.9609 24.9461 43.6328C22.6 42.5063 20.6148 40.7563 19.2094 38.5578C17.7656 36.3047 17 33.6906 17 31C17 27.2594 18.4547 23.743 21.1016 21.1016C23.743 18.4547 27.2594 17 31 17C34.7406 17 38.257 18.4547 40.8984 21.1016C43.5453 23.7484 45 27.2594 45 31C45 33.6906 44.2344 36.3047 42.7852 38.5578C41.3742 40.7508 39.3891 42.5063 37.0484 43.6328C36.3648 43.9555 35.55 43.6711 35.2219 42.9875Z" fill="#2BC155"></path><path d="M36.3211 31.7274C36.5891 31.9953 36.7203 32.3453 36.7203 32.6953C36.7203 33.0453 36.5891 33.3953 36.3211 33.6633L32.8812 37.1031C32.3781 37.6063 31.7109 37.8797 31.0055 37.8797C30.3 37.8797 29.6273 37.6008 29.1297 37.1031L25.6898 33.6633C25.1539 33.1274 25.1539 32.2633 25.6898 31.7274C26.2258 31.1914 27.0898 31.1914 27.6258 31.7274L29.6437 33.7453L29.6437 25.9742C29.6437 25.2196 30.2562 24.6071 31.0109 24.6071C31.7656 24.6071 32.3781 25.2196 32.3781 25.9742L32.3781 33.7508L34.3961 31.7328C34.9211 31.1969 35.7852 31.1969 36.3211 31.7274Z" fill="#2BC155"></path>
									</g>
                                                                    </svg>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 font-w600 mb-0"><a href="javascript:void(0);" class="text-black">Usuario</a></h6>
                                                                    <span class="fs-14">Ver</span>
                                                                </td>
                                                                <td>
                                                                    <span>
                                                                        <a class="hover:text-gray-400" href="post.jsp"> Hola quiero decir que ando triste porque...<!--Haz un metodo para extrar solo 5 palabras--> </a>
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 text-black font-w600 mb-0">June 4, 2020</h6>
                                                                    <span class="fs-14">05:34:45 AM</span>
                                                                </td>
                                                                <td>
                                                                    <span class="fs-16 font-w500 text-end d-block" style="color: #ffc400;">Añadio a Favorito</span>
                                                                </td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="Weekly" role="tabpanel">
                                                <div class="table-responsive">
                                                    <table class="table table-responsive-md card-table transactions-table">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <svg class="bgl-success tr-icon" width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                        <g><path d="M35.2219 42.9875C34.8938 42.3094 35.1836 41.4891 35.8617 41.1609C37.7484 40.2531 39.3453 38.8422 40.4828 37.0758C41.6477 35.2656 42.2656 33.1656 42.2656 31C42.2656 24.7875 37.2125 19.7344 31 19.7344C24.7875 19.7344 19.7344 24.7875 19.7344 31C19.7344 33.1656 20.3523 35.2656 21.5117 37.0813C22.6437 38.8477 24.2461 40.2586 26.1328 41.1664C26.8109 41.4945 27.1008 42.3094 26.7727 42.993C26.4445 43.6711 25.6297 43.9609 24.9461 43.6328C22.6 42.5063 20.6148 40.7563 19.2094 38.5578C17.7656 36.3047 17 33.6906 17 31C17 27.2594 18.4547 23.743 21.1016 21.1016C23.743 18.4547 27.2594 17 31 17C34.7406 17 38.257 18.4547 40.8984 21.1016C43.5453 23.7484 45 27.2594 45 31C45 33.6906 44.2344 36.3047 42.7852 38.5578C41.3742 40.7508 39.3891 42.5063 37.0484 43.6328C36.3648 43.9555 35.55 43.6711 35.2219 42.9875Z" fill="#2BC155"></path><path d="M36.3211 31.7274C36.5891 31.9953 36.7203 32.3453 36.7203 32.6953C36.7203 33.0453 36.5891 33.3953 36.3211 33.6633L32.8812 37.1031C32.3781 37.6063 31.7109 37.8797 31.0055 37.8797C30.3 37.8797 29.6273 37.6008 29.1297 37.1031L25.6898 33.6633C25.1539 33.1274 25.1539 32.2633 25.6898 31.7274C26.2258 31.1914 27.0898 31.1914 27.6258 31.7274L29.6437 33.7453L29.6437 25.9742C29.6437 25.2196 30.2562 24.6071 31.0109 24.6071C31.7656 24.6071 32.3781 25.2196 32.3781 25.9742L32.3781 33.7508L34.3961 31.7328C34.9211 31.1969 35.7852 31.1969 36.3211 31.7274Z" fill="#2BC155"></path>
                                                                        </g>
                                                                    </svg>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 font-w600 mb-0"><a href="javascript:void(0);" class="text-black">Usuario</a></h6>
                                                                    <span class="fs-14">Ver</span>
                                                                </td>
                                                                <td>
                                                                    <span>
                                                                        <a class="hover:text-gray-400" href="post.jsp"> Hola quiero decir que ando triste porque...<!--Haz un metodo para extrar solo 5 palabras--> </a>
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 text-black font-w600 mb-0">June 4, 2020</h6>
                                                                    <span class="fs-14">05:34:45 AM</span>
                                                                </td>
                                                                <td>
                                                                    <span class="fs-16 font-w500 text-end d-block" style="color: #787df1;">Publicación</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <svg class="bgl-success tr-icon" width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g><path d="M35.2219 42.9875C34.8938 42.3094 35.1836 41.4891 35.8617 41.1609C37.7484 40.2531 39.3453 38.8422 40.4828 37.0758C41.6477 35.2656 42.2656 33.1656 42.2656 31C42.2656 24.7875 37.2125 19.7344 31 19.7344C24.7875 19.7344 19.7344 24.7875 19.7344 31C19.7344 33.1656 20.3523 35.2656 21.5117 37.0813C22.6437 38.8477 24.2461 40.2586 26.1328 41.1664C26.8109 41.4945 27.1008 42.3094 26.7727 42.993C26.4445 43.6711 25.6297 43.9609 24.9461 43.6328C22.6 42.5063 20.6148 40.7563 19.2094 38.5578C17.7656 36.3047 17 33.6906 17 31C17 27.2594 18.4547 23.743 21.1016 21.1016C23.743 18.4547 27.2594 17 31 17C34.7406 17 38.257 18.4547 40.8984 21.1016C43.5453 23.7484 45 27.2594 45 31C45 33.6906 44.2344 36.3047 42.7852 38.5578C41.3742 40.7508 39.3891 42.5063 37.0484 43.6328C36.3648 43.9555 35.55 43.6711 35.2219 42.9875Z" fill="#2BC155"></path><path d="M36.3211 31.7274C36.5891 31.9953 36.7203 32.3453 36.7203 32.6953C36.7203 33.0453 36.5891 33.3953 36.3211 33.6633L32.8812 37.1031C32.3781 37.6063 31.7109 37.8797 31.0055 37.8797C30.3 37.8797 29.6273 37.6008 29.1297 37.1031L25.6898 33.6633C25.1539 33.1274 25.1539 32.2633 25.6898 31.7274C26.2258 31.1914 27.0898 31.1914 27.6258 31.7274L29.6437 33.7453L29.6437 25.9742C29.6437 25.2196 30.2562 24.6071 31.0109 24.6071C31.7656 24.6071 32.3781 25.2196 32.3781 25.9742L32.3781 33.7508L34.3961 31.7328C34.9211 31.1969 35.7852 31.1969 36.3211 31.7274Z" fill="#2BC155"></path>
									</g>
                                                                    </svg>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 font-w600 mb-0"><a href="javascript:void(0);" class="text-black">Usuario</a></h6>
                                                                    <span class="fs-14">Ver</span>
                                                                </td>
                                                                <td>
                                                                    <span>
                                                                        <a class="hover:text-gray-400" href="post.jsp"> Hola quiero decir que ando triste porque...<!--Haz un metodo para extrar solo 5 palabras--> </a>
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 text-black font-w600 mb-0">June 4, 2020</h6>
                                                                    <span class="fs-14">05:34:45 AM</span>
                                                                </td>
                                                                <td>
                                                                    <span class="fs-16 font-w500 text-end d-block" style="color: #007bff;">Dio Like</span>
                                                                </td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="monthly" role="tabpanel">
                                                <div class="table-responsive">
                                                    <table class="table table-responsive-md card-table transactions-table">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <svg class="bgl-success tr-icon" width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g><path d="M35.2219 42.9875C34.8938 42.3094 35.1836 41.4891 35.8617 41.1609C37.7484 40.2531 39.3453 38.8422 40.4828 37.0758C41.6477 35.2656 42.2656 33.1656 42.2656 31C42.2656 24.7875 37.2125 19.7344 31 19.7344C24.7875 19.7344 19.7344 24.7875 19.7344 31C19.7344 33.1656 20.3523 35.2656 21.5117 37.0813C22.6437 38.8477 24.2461 40.2586 26.1328 41.1664C26.8109 41.4945 27.1008 42.3094 26.7727 42.993C26.4445 43.6711 25.6297 43.9609 24.9461 43.6328C22.6 42.5063 20.6148 40.7563 19.2094 38.5578C17.7656 36.3047 17 33.6906 17 31C17 27.2594 18.4547 23.743 21.1016 21.1016C23.743 18.4547 27.2594 17 31 17C34.7406 17 38.257 18.4547 40.8984 21.1016C43.5453 23.7484 45 27.2594 45 31C45 33.6906 44.2344 36.3047 42.7852 38.5578C41.3742 40.7508 39.3891 42.5063 37.0484 43.6328C36.3648 43.9555 35.55 43.6711 35.2219 42.9875Z" fill="#2BC155"></path><path d="M36.3211 31.7274C36.5891 31.9953 36.7203 32.3453 36.7203 32.6953C36.7203 33.0453 36.5891 33.3953 36.3211 33.6633L32.8812 37.1031C32.3781 37.6063 31.7109 37.8797 31.0055 37.8797C30.3 37.8797 29.6273 37.6008 29.1297 37.1031L25.6898 33.6633C25.1539 33.1274 25.1539 32.2633 25.6898 31.7274C26.2258 31.1914 27.0898 31.1914 27.6258 31.7274L29.6437 33.7453L29.6437 25.9742C29.6437 25.2196 30.2562 24.6071 31.0109 24.6071C31.7656 24.6071 32.3781 25.2196 32.3781 25.9742L32.3781 33.7508L34.3961 31.7328C34.9211 31.1969 35.7852 31.1969 36.3211 31.7274Z" fill="#2BC155"></path>
									</g>
                                                                    </svg>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 font-w600 mb-0"><a href="javascript:void(0);" class="text-black">Usuario</a></h6>
                                                                    <span class="fs-14">Ver</span>
                                                                </td>
                                                                <td>
                                                                    <span>
                                                                        <a class="hover:text-gray-400" href="post.jsp"> Hola quiero decir que ando triste porque...<!--Haz un metodo para extrar solo 5 palabras--> </a>
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <h6 class="fs-16 text-black font-w600 mb-0">June 4, 2020</h6>
                                                                    <span class="fs-14">05:34:45 AM</span>
                                                                </td>
                                                                <td>
                                                                    <span class="fs-16 font-w500 text-end d-block" style="color: #787df1;">Publicación</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                       
                                </div>
                            </div>

                            
                            <!--**********************************
                                    AQUI COLOCAR LAS HORAS O MINUTOS (NO SE QUE CONVENGA MAS) DEL USUARIO EN LA APP 
                            ***********************************-->
                                
                            
                            <div class="row">
                                <div class="col-xl-12 col-xxl-12">
                                    <div class="card">
                                        <div class="card-header p-3 d-block d-sm-flex border-0" style="background-color: #fff;">
                                            <div class="me-auto mb-sm-0 mb-3">
                                                <h4 class="card-title mb-2">Cronograma Semanal</h4>
                                                <span class="fs-12">Actividad durante la Semana</span>
                                            </div>
                                            
                                        </div>
                                        <div class="card-body pb-2">
                                            <div class="d-sm-flex d-block" style="display: flex; justify-content: flex-end;">
                                                <ul class="card-list d-flex mt-sm-0 mt-3">
                                                    <li class="me-3"><span class="bg-success circle"></span>Real</li>
                                                    <li><span class="bg-danger circle"></span>Esperada</li>
                                                </ul>
                                            </div>
                                            <div id="chartBar2" class="bar-chart">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!--**********************************
                        Content body end
                    ***********************************-->
                    
            
                </div>
                <!--**********************************
                    Main wrapper end
                ***********************************-->
            
                <!--**********************************
                    Scripts
                ***********************************-->
                <!-- Required vendors -->
                <script src="../assets/vendor/global-min/global-min.js"></script>
                <script src="../assets/vendor/chart/chart.js"></script>
                <script src="../assets/vendor/jquery-nice/jquery-nice.js"></script>
                
                <!-- Apex Chart -->
                <script src="../assets/vendor/apexchart/apexchart.js"></script>
                <script src="../assets/vendor/nouslider/nouslider-min.js"></script>
                <script src="../assets/vendor/wNumb/wNumb.js"></script>
                
                <!-- Dashboard 1 -->
                <script src="../assets/vendor/dashboard/dashboard.js"></script>
            
                <script src="../assets/vendor/dashboard/custom.min.js"></script>
                <script src="../assets/vendor/dashboard/dlavnav.lt.js"></script>
                <script src="../assets/vendor/dashboard/demo.js"></script>
                <script src="../assets/vendor/dashboard/style-Switcher.js"></script>

        </div>
    </div>
    
</body>

</html>