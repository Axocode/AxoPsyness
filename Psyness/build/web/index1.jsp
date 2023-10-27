<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
  
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="css/maincss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <title>Psyness</title>
        <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>
    
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        if (request.getParameter("cerrar")!= null) {
                    session.invalidate();
        %>
                    <script>window.location.href = "feed.jsp";</script>
                    <%
                }
        response.sendRedirect("Session.jsp?accion=Nuevo");
        %>
        <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-md-6 side-image">
                    <!-------Image-------->
                    <img src="images/Icono.svg" alt="">
                    <div class="text">
                        <p>Unete a la comunidad de Psyness<i> -Axocode</i></p>
                    </div>
                </div>
                <div class="col-md-6 right">
                     <div class="input-box">
                        <header>Crear cuenta</header>
                        <form id="form1" action="Session.jsp" >
                            <div class="input-field">
                                <input id="IUser" name="IUser" value="${param.IUser}"${param.readonly} type="text" class="input"  minlength="6" maxlength="13" required/>
                                <label for="user">Nombre de Usuario</label>
                            </div>
                            <div class="input-field">
                                <input id="IAge" name="IAge" value="${param.IAge}" type="text" class="input" required   maxlength="2"  />
                                <label for="edad">Edad</label>
                            </div>
                            <div class="input-field">
                                <input id="IEmail" name="IEmail" value="${param.IEmail}" type="email" class="input" required onblur="validar(form.correo.value)" maxlength="40" />
                                <label for="correo">Correo</label>
                            </div>
                            <div class="input-field">
                                <input id="IPassword" name="IPassword" value="${param.IPassword}" type="password" class="input" required maxlength="25"/> 
                                <label for="pass">Contraseña</label>
                            </div>
                            <div class="input-field">
                                <input id="accion" type="hidden" value="Guardar" name="accion"  class="submit" value="${param.accion}">
                                <input id="action" type="submit" value="Empezar" name="action" class="submit" value="${param.accion}"> 
                            </div>
                            <div class="signin">
                                <span>Ya tienes una cuenta? <a href="login.jsp">Iniciar Sesion</a></span>
                            </div>
                        </form>
                     </div>
                </div>
            </div>
        </div>
    </div>
                                
    <script>
        <!--
        function validateTexto( obj , textoError, campoError )
        {
            if( obj.value === undefined || obj.value.length <= 0 )
            {
                campoError.innerHTML = "<b>" + textoError + "</b>";
                return false;
            }
            campoError.innerHTML = " ";
            return true;
        
        }
        
        function validateForm( )
        {
            const arr = ['IUser' , 'IAge', 'IEmail' , 'IPassword'];
            let obj1, obj2;
            
            var flag = true;
            for( const aux of arr )
            {
                obj1 = document.getElementById( aux );
                obj2 = document.getElementById( aux + 'Error' );
                if( !validateTexto( obj1 , "El campo " + aux + " es requerido" , obj2 ) )
                {
                    flag = false;
                }
            }
            return flag;
        }
        -->
    </script>
        
         <script>
            function validar(correo){
                 var expReg= /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
                 var esValido= expReg.test(correo);
                 if(esValido !== false) {

                    }else{
                    alert("Correo invalido"); location.reload(true);
                    }
            }
        </script>
    </body>
</html>
