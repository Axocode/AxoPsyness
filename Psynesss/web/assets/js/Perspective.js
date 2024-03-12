/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function obtenerPuntuacionPerspectiveAPI(texto, claveAPI) {
  const url = 'https://commentanalyzer.googleapis.com/v1alpha1/comments:analyze';

  const params = {
    key: claveAPI,
  };

  const payload = {
    comment: { text: texto },
    languages: ['es'],
    requestedAttributes: { TOXICITY: {} },
  };

  try {
    const respuesta = await axios.post(url, payload, { params });
    const datosRespuesta = respuesta.data;

    if (datosRespuesta.attributeScores && datosRespuesta.attributeScores.TOXICITY) {
      const puntuacionToxicidad = datosRespuesta.attributeScores.TOXICITY.summaryScore.value;
      return puntuacionToxicidad;
    } else {
      return null;
    }
  } catch (error) {
    console.error('Error al realizar la solicitud a Perspective API:', error.message);
    return null;
  }
}

function evaluarToxicidad() {
  const textoAEvaluar = document.getElementById('inputText').value;
  const claveAPIPerspective = "AIzaSyBhcaemBy-DSswtEZplbfxJcOTqrSYmHNw";
  
  obtenerPuntuacionPerspectiveAPI(textoAEvaluar, claveAPIPerspective)
    .then((puntuacion) => {
      const resulttext = document.getElementById('result');
      if (puntuacion !== null) {
          const puntuacionN = parseFloat(puntuacion);
          console.log(puntuacionN);
          localStorage.setItem("validacion", puntuacionN)
      } else {
        resultadoDiv.innerHTML = 'No se pudo obtener la puntuación.';
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
}

let timeoutId; // Declaración global

function cerrarModal() {
  UIkit.modal("#modal_offensive_announce").hide();

  // Limpiar el timeout si ya está configurado
  if (timeoutId) {
    clearTimeout(timeoutId);
    timeoutId = null;
  }

  // Iniciar el timeout para mostrar la modal después de 100 milisegundos
  timeoutId = setTimeout(() => {
    UIkit.modal("#create-post-modal").show();
  }, 100);
}

