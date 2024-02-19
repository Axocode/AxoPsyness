   function doPub() {
        $("#guardadito1").prop('disabled', true);
    }

    function resPub() {
        $("#guardadito1").prop('disabled', false);
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
    
var notificacionEnCooldown = false;

function mostrarNotificacion(mensaje, tipo, numero) {
    if (!notificacionEnCooldown) {
        notificacionEnCooldown = true;
        Toastify({
            text: mensaje,
            duration: 4000,
            close: true,
            gravity: "bottom",
            position: 'center',
            style: {
                background: tipo === "success" ? "#6B64F4" : "#FF6347",
            },
            onClick: function () {
                window.open("profile-new.jsp?id=" + numero, '_blank');
            },
            onHidden: function () {
                setTimeout(function () {
                    notificacionEnCooldown = false;
                }, 5000); // 5 segundos de cooldown
            }
        }).showToast();
    }
}

function mostrarNotificacionComent(mensaje, tipo, numero) {
    if (!notificacionEnCooldown) {
        notificacionEnCooldown = true;
        Toastify({
            text: mensaje,
            duration: 4000,
            close: true,
            gravity: "bottom",
            position: 'center',
            style: {
                background: tipo === "success" ? "#6B64F4" : "#FF6347",
            },
            onClick: function () {
                window.open("post.jsp?id=" + numero, '_blank');
            },
            onHidden: function () {
                setTimeout(function () {
                    notificacionEnCooldown = false;
                }, 5000); // 5 segundos de cooldown
            }
        }).showToast();
    }
}

    
$(document).ready(function () {
    $("#axocode123").submit(function (event) {
        event.preventDefault();
        console.log("Enviado y esperando resultado...");
        const textoAEvaluar = $("#inputText").val();
        const claveAPIPerspective = "AIzaSyBhcaemBy-DSswtEZplbfxJcOTqrSYmHNw";

        obtenerPuntuacionPerspectiveAPI(textoAEvaluar, claveAPIPerspective)
            .then((puntuacion) => {
                const resulttext = document.getElementById('result');
                if (puntuacion !== null) {
                    const puntuacionN = parseFloat(puntuacion);
                    // Ahora puedes utilizar puntuacionN en tu lógica
                    if (puntuacionN < 0.58) {
                        console.log("publicacion valida");
                        var numero1  = $("#numero123").val();
                        // Resto de la lógica para publicación válida
                        $.ajax({
                            type: "POST",
                            url: "/Psyness/PublicarServlet",
                            data: {
                                PubCont: $("#inputText").val(),
                                guardar: $("#guardar").val(),
                                PubDate: $("#PubDate").val(),
                                PubHour: $("#PubHour").val()
                            },
                            success: function (response) {
                                console.log("Formulario enviado por AJAX", numero1);
                                console.log(response);
                                doPub();
                                UIkit.modal("#create-post-modal").hide();
                                document.getElementById('inputText').value = '';
                                var botonPublicar = document.getElementById('guardadito1');
                                var colorOriginal = window.getComputedStyle(botonPublicar).backgroundColor;
                                botonPublicar.style.backgroundColor = '#CFCFCF';
                                
                                setTimeout(function () {
                                    resPub();
                                    botonPublicar.style.backgroundColor = colorOriginal;
                                }, 10000);

                                  // Ejemplo de uso
                                  mostrarNotificacion("Publicación válida. Ver Publicacion", "success", numero1);

                            },
                            error: function (error) {
                                // Maneja los errores aquí
                                console.error("Error en la solicitud AJAX: ", error);
                            }
                        });
                    } else {
                        console.log("publicacion invalida");
                        UIkit.modal("#create-post-modal").hide();
                        const modalsita = document.getElementById("modal_offensive_announce");
                        modalsita.style.display = 'block';
                        modalsita.style.opacity = 1;
                    }
                } else {
                    resultadoDiv.innerHTML = 'No se pudo obtener la puntuación.';
                }
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    });
    
    $("#comentariosAxo").submit(function (event) {
        event.preventDefault();
        console.log("Enviado y esperando resultado...");
        const textoAEvaluar = $("#inputText1").val();
        const claveAPIPerspective = "AIzaSyBhcaemBy-DSswtEZplbfxJcOTqrSYmHNw";

        obtenerPuntuacionPerspectiveAPI(textoAEvaluar, claveAPIPerspective)
            .then((puntuacion) => {
                const resulttext = document.getElementById('result');
                if (puntuacion !== null) {
                    const puntuacionN = parseFloat(puntuacion);
                    // Ahora puedes utilizar puntuacionN en tu lógica
                    if (puntuacionN < 0.58) {
                        console.log("publicacion valida");
                        var numero1  = $("#numero23").val();
                        // Resto de la lógica para publicación válida
                        $.ajax({
                            type: "POST",
                            url: "/Psyness/PublicarComentarioServlet",
                            data: {
                                guardar: $("#guardar").val(),
                                ComentCont: $("#inputText1").val(),
                                ComentDate: $("#ComentDate").val(),
                                ComentHour: $("#ComentHour").val(),
                                ComentPubNumId: $("#ComentPubNumId").val(),
                                ComentIUserNum: $("#ComentIUserNum").val()
                            },
                            success: function (response) {
                                console.log("Formulario enviado por AJAX", numero1);
                                console.log(response);
                                doPub();
                                UIkit.modal("#create-post-modal").hide();
                                document.getElementById('inputText').value = '';
                                var botonPublicar = document.getElementById('guardadito1');
                                var colorOriginal = window.getComputedStyle(botonPublicar).backgroundColor;
                                botonPublicar.style.backgroundColor = '#CFCFCF';
                                
                                setTimeout(function () {
                                    resPub();
                                    botonPublicar.style.backgroundColor = colorOriginal;
                                }, 10000);

                                  // Ejemplo de uso
                                    mostrarNotificacionComent("Publicación Realizada. Ver comentario", "success", numero1);

                            },
                            error: function (error) {
                                // Maneja los errores aquí
                                console.error("Error en la solicitud AJAX: ", error);
                            }
                        });
                    } else {
                        console.log("publicacion invalida");
                        UIkit.modal("#create-post-modal").hide();
                        const modalsita = document.getElementById("modal_offensive_announce");
                        modalsita.style.display = 'block';
                        modalsita.style.opacity = 1;
                    }
                } else {
                    resultadoDiv.innerHTML = 'No se pudo obtener la puntuación.';
                }
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    });
});

//volver comandos 

/*
    function guardarPosicionEnHistorial() {
        const posicionActual = window.scrollY || window.pageYOffset;
        history.replaceState({ scrollPos: posicionActual }, "");
      }

      window.addEventListener("popstate", function(event) {
        if (event.state && typeof event.state.scrollPos !== "undefined") {
          window.scrollTo(0, event.state.scrollPos);
        }
      });


 document.getElementById('botonVolver').addEventListener('click', function() {
  // Volver atrás en el historial
  history.go(-1);
});

*/