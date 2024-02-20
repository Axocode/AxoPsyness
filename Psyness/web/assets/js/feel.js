
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
    }
  }
