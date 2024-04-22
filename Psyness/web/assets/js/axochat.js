document.getElementById('send-btn').addEventListener('click', function(e) {
    e.preventDefault(); // Previene el comportamiento por defecto del botón (en caso de estar dentro de un formulario)
    let userMessage = document.getElementById('user-input').value;

    // Mostrar el mensaje del usuario en el chat
    displayMessage('user', userMessage);

    fetch('http://FerV24.pythonanywhere.com/ask', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({message: userMessage}),
    })
    .then(response => response.json())
    .then(data => {
        // Mostrar la respuesta del bot en el chat
        displayMessage('bot', data.message);
    })
    .catch((error) => {
        console.error('Error:', error);
        // Opcional: Mostrar un mensaje de error en el chat
        displayMessage('bot', 'Error al obtener respuesta.');
    });

    // Limpiar el campo de entrada del usuario
    document.getElementById('user-input').value = '';
});
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