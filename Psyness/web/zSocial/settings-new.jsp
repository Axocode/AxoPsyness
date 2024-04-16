<%-- 
    Document   : settings-new
    Created on : 23 nov. 2023, 19:00:41
    Author     : axelitomixxxddd
--%>

<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<div  hidden id="hiAxogg0"></div>
    <!-- Favicon -->
    <link href="../assets/images/Icono.svg" rel="icon" type="image/png">

    <!-- Basic Page Needs
        ================================================== -->
        <title>Configuración</title>
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

    <!-- CSS ================================================== --> 
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
%>

    <div id="wrapper">

              
        <!-- Header -->
    <jsp:include page="sidebar.jsp"/>

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
                            <a href="fotoprofile.jsp">
                            <img src="../assets/images/avatars/<%=sesion.getAttribute("SIImgNum")%>" class="card-img-top" alt="...">
                        </a>
                            <div class="card-body">
                            <h3 >Selecciona una imagen</h3>
                            <p class="card-text">Tu imagen de perfil dice mucho de ti, asegurate de escoger la que mas te guste :D</p>
                            
                            </div>
                        </div>


                        <div class="bg-white rounded-md lg:shadow-md shadow col-span-2 lg:mx-16">
                            <form action="../zProcesos/actualizarUser.jsp" method="POST" accept-charset="UTF-8">
                            <div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
                                <div>
                                    <label for="">Nombre de Usuario</label>
                                    <input type="text" name="nombre"value="<c:out value='<%=sesion.getAttribute("SIUser")%>'/>" placeholder="Ingresa Algo" class="shadow-none with-border" maxlength="20" required>
                                </div>
                                
                                <div>
                                    <label for=""> Edad</label>
                                    <input hidden type="text" name="edad" value="<c:out value='<%=sesion.getAttribute("SIAge")%>'/>" maxlength="2" required placeholder="Ingresa Algo" class="shadow-none with-border">
                                </div>
                                <div class="col-span-2">
                                    <label for="about"> Descripcion</label>
                                    <input type="text" name="descripcion" value="<c:out value='<%=sesion.getAttribute("SIUserDescription")%>'/>" minlength="5" maxlength="100" required placeholder="Ingresa Algo" class="with-border">
                                </div>
                            </div> 
        
                            <div class="bg-gray-10 p-6 pt-0 flex justify-end space-x-3">
                                <button type="submit" class="button bg-blue-700"> Modificar </button>
                            </div>
                            </form>
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

</body>
</html>