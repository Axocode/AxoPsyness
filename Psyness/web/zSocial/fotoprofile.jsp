<%-- 
    Document   : fotoprofile
    Created on : 30 nov. 2023, 1:46:11
    Author     : Admin
--%>

<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link href="../assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs
        ================================================== -->
    <title>ProfileImg</title>
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

    <!-----Fontawesome------->
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-----JQuery------->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!-- CSS 
    ================================================== --> 
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
    
        String img = request.getParameter("img");
        int iUserNum = (Integer) sesion.getAttribute("SIUserNum");
        
        if (img != null) {         
            if (img.equals("profilesidebar3.png" ) || img.equals("prof1.png") || img.equals("prof2.png") || img.equals("prof3.png") 
            || img.equals("prof4.png") || img.equals("prof5.png") || img.equals("prof6.png") || img.equals("prof7.png") || img.equals("prof8.png")){
            InterUsers Object  = new InterUsers();
            InterUsersService container = new InterUsersService();
            Object.setIImgNum(img);
            Object.setIUserNum(iUserNum);
            boolean cont = container.updateUsuario(Object);
            if (cont) {
                    session.setAttribute("SIImgNum", img);
                    response.sendRedirect("settings-new.jsp");
                }}else response.sendRedirect("setttings-new.jsp");
        }
%>    

    <div id="wrapper">

        <jsp:include page="sidebar.jsp"/>
                    
        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">


                <div class="flex justify-between items-center relative md:mb-4 mb-3">
                    <div class="flex-1">
                        <h2 class="text-2xl font-semibold"> Imagenes de Perfil </h2>
                        
                    </div>
                    
                </div>

                <div class="grid md:grid-cols-4 grid-cols-2 gap-3 mt-5">
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof1.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof1.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof2.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof2.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof3.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof3.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof4.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof4.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof5.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof5.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof6.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof6.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof7.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof7.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="bg-green-400 max-w-full lg:h-56 h-48 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
                            <img src="../assets/images/avatars/prof8.png" class="w-full h-full absolute object-cover inset-0">
                            <!-- overly-->
                            <div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
                            <div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small flex items-center">
                                <div class="flex-1"> 
                                    <div class="text-lg"> Establecer Imagen  </div>
                                    <div class="flex space-x-3 lg:flex-initial text-sm">
                                      
                                    </div>
                                </div> 
                                <a href="fotoprofile.jsp?img=prof8.png"><i class="btn-down text-2xl uil-cloud-download px-1"></i></a>
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

</body>
<script>
  function buscarEnEnter(event) {
    if (event.key === "Enter") {
      buscarEnTiempoReal();
    }
  }

  function buscarEnTiempoReal() {
    var campoBusqueda = document.getElementById("campoBusqueda");
    var valor = campoBusqueda.value;

    location.href = "settings-new.jsp?term=" + encodeURIComponent(valor);
  }
</script>


</html>
