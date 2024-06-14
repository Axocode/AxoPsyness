document.getElementById('btn1').addEventListener('click', function() {
    activateElements('Claro,puedo darte un consejo si así lo deseas,cuentame tu situación y con gusto te aconsejaré.');
});
document.getElementById('btn2').addEventListener('click', function() {
    activateElements('Me encantaría poder ayudarte,cuentame ¿qué es lo que pasa?');
});
document.getElementById('btn3').addEventListener('click', function() {
    activateElements('Por supuesto!,dime que es lo que sientes y con gusto te ayudaré a relajarte');
});

function activateElements(message) {
    document.getElementById('user-input').disabled = false;
    document.getElementById('send-btn').disabled = false;

    // Mostrar el indicador de que el bot está escribiendo
    var typingIndicator = displayTypingIndicator();

    // Esperar 1.2 segundos antes de quitar el indicador y mostrar el mensaje del bot
    setTimeout(() => {
        // Quitar el indicador de escritura
        removeTypingIndicator(typingIndicator);

        // Mostrar el mensaje del bot en el chat
        displayBotMessage(message);
    }, 1200);
}

function displayBotMessage(message) {
    displayMessage('bot', message);
}




var endpointVariable = "";

var boton = document.getElementById('btn1');
// Agrega un evento de click al botón
boton.addEventListener('click', function() {
    // Incrementa el valor de la variable
    endpointVariable = "conse";
    // Imprime el nuevo valor en la consola
    console.log("Nuevo valor de la variable:", endpointVariable);
});

var boton2 = document.getElementById('btn2');
// Agrega un evento de click al botón
boton2.addEventListener('click', function() {
    // Incrementa el valor de la variable
    endpointVariable = "apo";
    // Imprime el nuevo valor en la consola
    console.log("Nuevo valor de la variable:", endpointVariable);
});

var boton3 = document.getElementById('btn3');
// Agrega un evento de click al botón
boton3.addEventListener('click', function() {
    // Incrementa el valor de la variable
    endpointVariable = "act";
    // Imprime el nuevo valor en la consola
    console.log("Nuevo valor de la variable:", endpointVariable);
});


document.getElementById('send-btn').addEventListener('click', function(e) {
    e.preventDefault(); 
    let userMessage = document.getElementById('user-input').value;
    
    // Aquí asumo que obtienes la variable de algún lugar, por ejemplo, de otro input o una variable global
    /*let endpointVariable = 'apo'; // Cambiar esto por la fuente de tu variable*/

    // Construye la URL incorporando la variable
    let url = `http://FerV24.pythonanywhere.com/${endpointVariable}`;

    // Mostrar el mensaje del usuario en el chat
    displayMessage('user', userMessage);

    // Mostrar el indicador de que el bot está escribiendo
    var typingIndicator = displayTypingIndicator();

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({message: userMessage}),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.text(); // Primero lo obtenemos como texto
    })
    .then(text => {
        console.log('Response text:', text); // Para ver el contenido de la respuesta
        try {
            const data = JSON.parse(text); // Intentamos parsear el texto como JSON
            // Quitar el indicador de escritura antes de mostrar la respuesta
            removeTypingIndicator(typingIndicator);

            // Mostrar la respuesta del bot en el chat
            displayMessage('bot', data.message);
        } catch (error) {
            console.error('Error parsing JSON:', error);
            throw new Error('Response is not valid JSON');
        }
    })
    .catch((error) => {
        console.error('Error:', error);
        // Quitar el indicador de escritura incluso en caso de error
        removeTypingIndicator(typingIndicator);

        // Opcional: Mostrar un mensaje de error en el chat
        displayMessage('bot', 'Error al obtener respuesta.');
    });

    // Limpiar el campo de entrada del usuario
    document.getElementById('user-input').value = '';
    // Incrementa el valor de la variable
    endpointVariable = "norm";
    // Imprime el nuevo valor en la consola
    console.log("Nuevo valor de la variable:", endpointVariable);
});

function displayTypingIndicator() {
    var chatWindow = document.getElementById('contento');
    
    var messageElement = document.createElement('div');
    messageElement.className = 'message-bubble';
    var messageBubbleInner = document.createElement('div');
    messageBubbleInner.className = 'message-bubble-inner';

    var avatarDiv = document.createElement('div');
    avatarDiv.className = 'message-avatar';
    var avatarImg = document.createElement('img');
    avatarImg.src = '../assets/images/avatars/axo.jpg'; // Ajusta la ruta al avatar del bot
    avatarImg.alt = 'avatar';
    avatarDiv.appendChild(avatarImg);

    var messageTextDiv = document.createElement('div');
    messageTextDiv.className = 'message-text';
    var typingIndicatorDiv = document.createElement('div');
    typingIndicatorDiv.className = 'typing-indicator';
    for (let i = 0; i < 3; i++) {
        let span = document.createElement('span');
        typingIndicatorDiv.appendChild(span);
    }

    messageTextDiv.appendChild(typingIndicatorDiv);
    messageBubbleInner.appendChild(avatarDiv);
    messageBubbleInner.appendChild(messageTextDiv);
    messageElement.appendChild(messageBubbleInner);

    var clearfixDiv = document.createElement('div');
    clearfixDiv.className = 'clearfix';
    messageElement.appendChild(clearfixDiv);

    chatWindow.appendChild(messageElement);
    chatWindow.scrollTop = chatWindow.scrollHeight;

    return messageElement; // Devuelve el elemento del mensaje para poder quitarlo más tarde
}

function removeTypingIndicator(typingIndicatorElement) {
    if (typingIndicatorElement && typingIndicatorElement.parentNode) {
        typingIndicatorElement.parentNode.removeChild(typingIndicatorElement);
    }
}

function displayMessage(sender, message) {
    var chatWindow = document.getElementById('contento');
    var messageElement = document.createElement('div');
    messageElement.className = sender === 'user' ? 'message-bubble me' : 'message-bubble';
    
    var messageBubbleInner = document.createElement('div');
    messageBubbleInner.className = 'message-bubble-inner';
    
    // Crear el div del avatar
    var avatarDiv = document.createElement('div');
    avatarDiv.className = 'message-avatar';
    var avatarImg = document.createElement('img');

    // Puedes ajustar la ruta del avatar aquí. Por ejemplo, usar diferentes avatares para el usuario y el bot
    if (sender === 'user') {
        avatarImg.src = '../assets/images/avatars/prof3.png'; // Ruta a la imagen del avatar del usuario
    } else {
        avatarImg.src = '../assets/images/avatars/axo.jpg'; // Ruta a la imagen del avatar del bot
    }
    avatarImg.alt = 'avatar'; // Texto alternativo para la imagen

    avatarDiv.appendChild(avatarImg);
    messageBubbleInner.appendChild(avatarDiv);
    
    var messageText = document.createElement('div');
    messageText.className = 'message-text';
    
    var paragraph = document.createElement('p');
    paragraph.innerHTML = message; // Aquí efectivamente asignamos el mensaje
    messageText.appendChild(paragraph);
    messageBubbleInner.appendChild(messageText);
    messageElement.appendChild(messageBubbleInner);
    
    var clearfixDiv = document.createElement('div');
    clearfixDiv.className = 'clearfix';
    messageElement.appendChild(clearfixDiv);
    
    chatWindow.appendChild(messageElement);
    chatWindow.scrollTop = chatWindow.scrollHeight; // Desplazarse automáticamente al último mensaje
}