    function doPub() {
      document.getElementById("guardadito1").disabled = true;
    }
     function resPub() {
      document.getElementById("guardadito1").disabled = false;
    }
    

    function enviarAmor(pub1, action) {
        var url = '/Psyness/MeGustaServlet?pub=' + pub1 + '&action1=' + action;

        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

        return false;
    }

    function agregarFav(pub1, action) {
        var url = '/Psyness/FavoritoServlet?pub=' + pub1 + '&action1=' + action;

        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });

        return false;
    }

    function agregarSeguido(num, action) {
        var url = '/Psyness/SeguidoresServlet?id=' + num + '&action1=' + action;
        console.log("numero:",num,"acccion:",action),
        $.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
            },
            error: function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", status, error);
                console.log(xhr.responseText);
            }
        });
    }
   

    var sonidoReproducido = false; // Variable para rastrear si el sonido ya se ha reproducido

    function actualizarPub(num) {
        var url = '/Psyness/ReaccionesServlet?key2=' + num;
        console.log("Click" + num);

        // Función que realiza la solicitud AJAX
        function hacerSolicitud() {
            $.ajax({
                type: 'GET',
                url: url,
                success: function (data) {
                    $('#pub' + num).html(data);
                    console.log("Actualizada:" + num);

                    // Reproducir el sonido solo la primera vez
                    if (!sonidoReproducido) {
                        reproducirSonido();
                        sonidoReproducido = true;
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", status, error);
                    console.log(xhr.responseText);
                }
            });
        }

        // Ejecutar la función hacerSolicitud dos veces con un intervalo de 1 segundo
        setTimeout(function () {
            hacerSolicitud();
            sonidoReproducido = false; // Restablecer la variable para permitir futuras reproducciones
            setTimeout(hacerSolicitud, 1000); // 1000 milisegundos = 1 segundo
        }, 200); // 1000 milisegundos = 1 segundo

        return false;
    }

    function reproducirSonido() {
        var audioElement = document.getElementById("miSonido");
        if (audioElement) {
            audioElement.play();
        }
    }

$(document).ready(function() {
    $("#axocode123").submit(function(event) {
        console.log("Formulario enviado por AJAX");
        event.preventDefault();

        // Obtiene los datos del formulario
        var formData = {
            PubCont: $("#inputText").val(),
            guardar: $("#guardar").val(),
            PubDate: $("#PubDate").val(),
            PubHour: $("#PubHour").val()
        };
 //aqui va el if
        const valida = localStorage.getItem("validacion");
        console.log(valida);
       if (valida < 0.58){
           console.log("publicacion valida");
        $.ajax({
            type: "POST",
            url: "/Psyness/PublicarServlet",
            data: formData,
            success: function(response) {
                console.log("Formulario enviado por AJAX");
                console.log(response);
                doPub();
                UIkit.modal("#create-post-modal").hide();
                document.getElementById('inputText').value = '';
                var botonPublicar = document.getElementById('guardadito1');
                var colorOriginal = window.getComputedStyle(botonPublicar).backgroundColor;
                botonPublicar.style.backgroundColor = '#CFCFCF';
                setTimeout(function() {
                    resPub();
                    botonPublicar.style.backgroundColor = colorOriginal;
                }, 10000);
            },
            error: function(error) {
                // Maneja los errores aquí
                console.error("Error en la solicitud AJAX: ", error);
            }
        });
    }
      else {
          UIkit.modal("#create-post-modal").hide();
          const modalsita = document.getElementById("modal_offensive_announce");
          modalsita.style.display = 'block';
          modalsita.style.opacity = 1;
          console.log("publicacion invalida");
      }
    });
});