
  async function translateAndAnalyze() {
    const API_TOKEN = "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"; // Reemplaza con tu clave de API de Hugging Face
    const translationModel = "Helsinki-NLP/opus-mt-es-en";
    const emotionModel = "itzo/distilbert-base-uncased-fine-tuned-on-emotion-dataset";

    const textToTranslate = document.getElementById("inputText").value;

    // Traducción del texto
    const translationData = {
      inputs: textToTranslate,
    };

    const translationResponse = await fetch(
      `https://api-inference.huggingface.co/models/${translationModel}`,
      {
        headers: {
          Authorization: `Bearer ${API_TOKEN}`,
          "Content-Type": "application/json",
        },
        method: "POST",
        body: JSON.stringify(translationData),
      }
    );

    const translationResult = await translationResponse.json();

    // Verifica si la respuesta es un array y tiene al menos un elemento
    if (Array.isArray(translationResult) && translationResult.length > 0) {
      // Accede a la propiedad "translation_text" en el primer elemento del array
      const translatedText = translationResult[0].translation_text;

      // Muestra la traducción en la consola del navegador
      console.log("Texto original:", textToTranslate);
      console.log("Traducción:", translatedText);

      // Análisis de emoción en el texto traducido
      const emotionData = { text: translatedText };
      const emotionResponse = await fetch(
        `https://api-inference.huggingface.co/models/${emotionModel}`,
        {
          method: "POST",
          body: JSON.stringify({ inputs: emotionData }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${API_TOKEN}`
          }
        }
      );

      const emotionResult = await emotionResponse.json();
      console.log("Resultado del análisis de emoción:", emotionResult);
    } else {
      console.error("Error en la estructura de la respuesta de traducción");
      
      // Transforma emotionResult a un objeto de scores
      const scores = emotionResult.reduce((acc, curr) => {
        acc[curr.label] = curr.score;
        return acc;
      }, {});

      // Llama a la función para cargar la textura y generar el círculo con la textura aplicada
        loadTextureAndGenerateCircle(scores, [200, 200], textureSrc);
      }

      // Función para cargar la imagen de textura y luego generar el círculo con la textura aplicada
      function loadTextureAndGenerateCircle(scores, size, textureSrc) {
        var texture = new Image();
        texture.src = textureSrc;
        texture.onload = function() {
          // Una vez que la textura esté cargada, genera el círculo con gradiente
          var circleDataURL = generateSmoothGradientCircle(scores, size, texture);
          var img = new Image();
          img.src = circleDataURL;
          document.getElementById('gradientImageContainer').appendChild(img);
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
    'LABEL_0': 'rgb(134, 198, 238)', //azul
    'LABEL_1': 'rgb(255,218,91)', //amarillo
    'LABEL_2': 'rgb(242,154,186)', //rosa
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
}
