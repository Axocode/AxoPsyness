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
                background: tipo === "success" ? "#787DF1" : "#FFFFF",
            },
            onClick: function () {
                window.open("post.jsp?id=" + numero, '_blank');
            },
        }).showToast();
            setTimeout(function () {
                    notificacionEnCooldown = false;
                }, 5000); // 5 segundos de cooldown
    }
}

function mostrarNotificacionErorr(mensaje, tipo) {
    if (!notificacionEnCooldown) {
        notificacionEnCooldown = true;
        Toastify({
            text: mensaje,
            duration: 4000,
            close: true,
            gravity: "bottom",
            position: 'center',
            style: {
                background: tipo === "success" ? "#99D1FF" : "#FFFFF",
            },
        }).showToast();
            setTimeout(function () {
                    notificacionEnCooldown = false;
                }, 5000); // 5 segundos de cooldown
    }
}

    function recolectarEstadosCheckboxes() {
        let estados = {};
        $(".boton-desactivable input[type='checkbox']").each(function() {
            estados[this.id] = $(this).is(':checked') ? 5 : 0;
        });
        return estados;
    }
    
$(document).ready(function () {
    $("#axocode123").submit(function (event) {
        event.preventDefault();
        console.log("Enviado y esperando resultado...");
        const textoAEvaluar = $("#inputText").val();
        const claveAPIPerspective = "AIzaSyBhcaemBy-DSswtEZplbfxJcOTqrSYmHNw";
        const estadosCheckboxes = recolectarEstadosCheckboxes();
        
        translateAndAnalyze(textoAEvaluar);
        
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
                            type: "GET",
                            url: "/Psyness/PublicarServlet",
                            data: {
                                PubCont: $("#inputText").val(),
                                guardar: $("#guardar").val(),
                                PubDate: $("#PubDate").val(),
                                PubHour: $("#PubHour").val(),
                                PubRol: $("#PubRol").val(),
                                TagPubSensible: $("#TagPubSensible").is(':checked') ? 1 : 0,
                                TagPubAutoestima: $("#TagPubAutoestima").is(':checked') ? 5 : 0,
                                TagPubRelaciones: $("#TagPubRelaciones").is(':checked') ? 5 : 0,
                                TagPubAnsiedad: $("#TagPubAnsiedad").is(':checked') ? 5 : 0,
                                TagPubDepresion: $("#TagPubDepresion").is(':checked') ? 5 : 0,
                                TagPubConflictos: $("#TagPubConflictos").is(':checked') ? 5 : 0,
                                TagPubBienestar: $("#TagPubBienestar").is(':checked') ? 5 : 0,
                                TagPubCrecimiento: $("#TagPubCrecimiento").is(':checked') ? 5 : 0,
                                TagPubSalud: $("#TagPubSalud").is(':checked') ? 5 : 0,
                                TagPubTranstornos: $("#TagPubTranstornos").is(':checked') ? 5 : 0,
                                TagPubRecaidas: $("#TagPubRecaidas").is(':checked') ? 5 : 0,
                                TagPubSueno: $("#TagPubSueno").is(':checked') ? 5 : 0
                            },
                            success: function (data) {
                                $('#hiAxogg').html(data);
                                $('#hiAxogg1').html(data);
                                console.log("Formulario enviado por AJAX", numero1);
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
                                var elemento = document.getElementById('resultadoPublicacion');
                                var contenido = elemento.textContent || elemento.innerText;
                                if (contenido === "error") {
                                    mostrarNotificacionErorr("Espera un poco para volver a publicar", "success");
                                    $(".boton-desactivable input[type='checkbox']").each(function() {
                                      $(this).prop('checked', false);
                                    });
                                } else {
                                    mostrarNotificacion("Publicación válida. Ver Publicacion", "success", contenido);
                                    $(".boton-desactivable input[type='checkbox']").each(function() {
                                      $(this).prop('checked', false);
                                    }); 
                                }
                                },
                                error: function (error) {
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


async function fetchWithBackoff(url, options, maxAttempts = 5, attempt = 1) {
   const backoffDelay = (attempt) => Math.min(1000 * Math.pow(2, attempt), 30000);
   try {
     const response = await fetch(url, options);
     if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
     return await response.json();
   } catch (error) {
     console.log(`Attempt ${attempt}: Failed - ${error.message}`);
     if (attempt >= maxAttempts) throw new Error('Max attempts reached');
     const delay = backoffDelay(attempt);
     console.log(`Waiting ${delay}ms before next attempt`);
     await new Promise(resolve => setTimeout(resolve, delay));
     return await fetchWithBackoff(url, options, maxAttempts, attempt + 1);
   }
 }
 var textureSrc = '5687053.jpg'; // Reemplaza con el camino correcto a tu imagen de textura
async function translateAndAnalyze() {
   const API_TOKEN = "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";
   const translationModel = "Helsinki-NLP/opus-mt-es-en";
   const emotionModel = "itzo/distilbert-base-uncased-fine-tuned-on-emotion-dataset";
 
   const textToTranslate = document.getElementById("inputText").value;
 
   try {
     const translationData = {
       inputs: textToTranslate,
     };
 
     const translationResult = await fetchWithBackoff(
       `https://api-inference.huggingface.co/models/${translationModel}`, {
         method: "POST",
         headers: {
           Authorization: `Bearer ${API_TOKEN}`,
           "Content-Type": "application/json",
         },
         body: JSON.stringify(translationData),
       }
     );
 
     if (Array.isArray(translationResult) && translationResult.length > 0) {
       const translatedText = translationResult[0].translation_text;
       console.log("Texto original:", textToTranslate);
       console.log("Traducción:", translatedText);
 
       const emotionData = { text: translatedText };
 
       const emotionResult = await fetchWithBackoff(
         `https://api-inference.huggingface.co/models/${emotionModel}`, {
           method: "POST",
           body: JSON.stringify({ inputs: emotionData }),
           headers: {
             'Content-Type': 'application/json',
             'Authorization': `Bearer ${API_TOKEN}`
           }
         }
       );
 
       console.log("Resultado del análisis de emoción:", emotionResult);
 
       const scores = emotionResult.reduce((acc, curr) => {
         acc[curr.label] = curr.score;
         return acc;
       }, {});
 
       // Actualización para imprimir el enlace en la consola
       loadTextureAndGenerateCircle(scores, [200, 200], textureSrc);
     }
   } catch (error) {
     console.error("Error durante la traducción o análisis de emoción:", error.message);
   }
 }
 
 function loadTextureAndGenerateCircle(scores, size, textureSrc) {
  var texture = new Image();
  texture.src = textureSrc;
  texture.onload = function() {
    var circleDataURL = generateSmoothGradientCircle(scores, size, texture);
    // Crea un nuevo elemento de imagen
    var imgElement = new Image();
    imgElement.src = circleDataURL; // Establece el Data URL como fuente de la imagen
    // Encuentra el div donde quieres mostrar la imagen
    var container = document.getElementById("imagengen");
    container.innerHTML = ''; // Limpia el contenido anterior del div
    container.appendChild(imgElement); // Añade la imagen al div
  };
}

function generateSmoothGradientCircle(scores, size) {
  var canvas = document.createElement('canvas');
  canvas.width = size[0];
  canvas.height = size[1];
  var ctx = canvas.getContext('2d');

  // Configura la sombra para profundidad
  ctx.shadowBlur = 1;
    ctx.shadowColor = 'rgba(0, 0, 0, 0.5)';
  
  var colors = {
    'LABEL_0': 'rgb(134, 198, 238)', //azul | tristeza
    'LABEL_1': 'rgb(255,218,91)', //amarillo | felicidad
    'LABEL_2': 'rgb(242,154,186)', //rosa | amor
    'LABEL_3': 'rgb(255,44,33)', //enojo | rojo
    'LABEL_4': 'rgb(201,201,255)', //miedo | morado
    'LABEL_5': 'rgb(218,218,210)', //sorpresa | gris
  };

  // Ordenar los sentimientos por score descendente y tomar solo los dos primeros
  var sortedScores = Object.keys(scores).sort(function(a, b) {
    return scores[b] - scores[a];
  }).slice(0, 2); // Solo tomar los dos primeros

  // Selecciona un punto aleatorio dentro del círculo para el centro del gradiente radial
  var angle = Math.random() * Math.PI * 2;
  var radius = Math.random() * (size[0] / 4); // hasta 1/4 del ancho total para mantenerlo dentro
  var x = (size[0] / 2) + radius * Math.cos(angle);
  var y = (size[1] / 2) + radius * Math.sin(angle);

  // Define los radios para el gradiente radial
  var innerRadius = 0; // Comienza desde el centro
  var outerRadius = size[0] / 2; // El radio máximo para el gradiente radial

  ctx.filter = 'blur(2px)';
  // Crear el degradado radial
  var gradient = ctx.createRadialGradient(x, y, innerRadius, x, y, outerRadius);

  // Aquí invertimos los colores al establecer los puntos de parada del gradiente
  gradient.addColorStop(0, colors[sortedScores[1]]); // Usar el segundo color (amarillo) en el centro
  gradient.addColorStop(scores[sortedScores[0]] / (scores[sortedScores[0]] + scores[sortedScores[1]]), colors[sortedScores[0]]); // El primer color (rosa) comienza en la posición calculada

  // Rellenar el canvas con el gradiente radial
  ctx.fillStyle = gradient;
  ctx.fillRect(0, 0, size[0], size[1]);

  // Crear una máscara circular para mantener la forma del círculo
  ctx.globalCompositeOperation = 'destination-in';
  ctx.beginPath();
  ctx.arc(size[0] / 2, size[1] / 2, outerRadius, 0, Math.PI * 2);
  ctx.closePath();
  ctx.fill();

  ctx.shadowBlur = 0;
  ctx.filter = 'none';
  return canvas.toDataURL();
}