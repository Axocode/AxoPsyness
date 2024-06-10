<%@page import="java.util.Locale"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
  
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="../css/maincss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <title>Psyness</title>
        <link rel="icon" type="image/jpg" href="../images/favicon.svg"/>
    
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            ZoneId zonaCiudadMexico = ZoneId.of("America/Mexico_City");
            ZonedDateTime horaCiudadMexico = ZonedDateTime.now(zonaCiudadMexico);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d 'de' MMMM yyyy HH:mm:ss", new Locale("es", "MX"));
            String horaFormateada = horaCiudadMexico.format(formatter);
            DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyyMMddHHmmss", new Locale("es", "MX"));
            String horaFormateada2 = horaCiudadMexico.format(formatter2);
            String[] partes =horaFormateada.split(" ");
            String fecha12 = partes[0] + " " + partes[1] + " " + partes[2] + " " + partes[3] + " " + partes[4];
            String hora12 = partes[5]; 
        %>
        <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-md-6 side-image">
                    <!-------Image-------->
                    <img src="../images/Icono.svg" alt="">
                    <div class="text">
                        <p>Unete a la comunidad de Psyness<i> -Axocode</i></p>
                    </div>
                </div>
                <div class="col-md-6 right">
                     <div class="input-box">
                        <header>Crear cuenta sin codigo</header>
                        <form id="form1" action="SessionSin.jsp" onsubmit="subir()" >
                            <div class="input-field">
                                <input id="IUser" name="IUser" value="${param.IUser}"${param.readonly} type="text" class="input" maxlength="20" required/>
                                <label for="user">Nombre de Usuario</label>
                            </div>
                            <div class="input-field">
                                <input id="IAge" name="IAge" value="${param.IAge}" type="text" class="input" required oninput="validateAge(this)" maxlength="2" required min="14" />
                                <label for="edad">Edad</label>
                            </div>
                            <div class="input-field">
                                <input id="IEmail" name="IEmail" value="${param.IEmail}" type="email" class="input" required onblur="validar(form.correo.value)" maxlength="70" />
                                <label for="correo">Correo</label>
                            </div>
                            <div class="input-field">
                                <input id="IPassword" name="IPassword" value="${param.IPassword}" type="password" class="input" required maxlength="25"/> 
                                <label for="pass">Contraseña</label>
                            </div>
                            <div class="input-field">
                                <input id="Apoyo" name="Apoyo" value="${param.Apoyo}" type="text" class="input" required maxlength="25"/> 
                                <label for="pass">Mensaje de apoyo</label>
                            </div>    
                            <div class="input-field">
                                <input id="IRol" type="hidden" value="Visitante" name="IRol"  class="submit" value="${param.IRol}">
                                <input id="accion" type="hidden" value="Guardar" name="accion"  class="submit" value="${param.accion}">
                                <input id="action" type="hidden" value="Empezar" name="action" class="submit" value="${param.accion}"> 
                                <input id="actionsita" type="submit" value="Empezar" name="action" class="submit" value="${param.accion}"> 
                                <input id="IUserDate" name="IUserDate" type="hidden"  value="<%=fecha12%>" class="submit" value="${param.IUserDate}"/>
                                <input id="IUserHour" name="IUserHour" type="hidden" value="<%=hora12%>" class="submit" value="${param.IUserHour}"/>
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
    </body>
    
                    <style>
                         #actionsita:hover{
                             background: #787df1;
                             color: #fff;
                         }
                    </style> 
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
    function subir() {
      document.getElementById("actionsita").disabled = true;
    }
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
            <script>
                        function validateAge(input) {
                            // Reemplaza cualquier caracter que no sea un dígito por una cadena vacía
                            input.value = input.value.replace(/\D/g, '');

                            // Opcional: limita el valor máximo
                            if (parseInt(input.value, 10) > 99) {
                                input.value = "99";
                            }
                        }
                        </script>
                        <script>
                        document.getElementById('form1').onsubmit = function(event) {
                            var ageInput = document.getElementById('IAge');
                            var age = parseInt(ageInput.value, 10);
                            if (age < 13) {
                                alert('Debes tener más de 13 años para enviar este formulario.');
                                event.preventDefault();
                            }
                        };
                        </script>
</html>
