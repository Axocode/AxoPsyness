var serverIP = "axocode.gerdoc.com"; 
var wsURI = "ws://" + serverIP + ":8080/Psyness/chat";


var websocket = new WebSocket(wsURI);

websocket.onopen = function() {
    onOpen();
};

websocket.onmessage = function(evnt) {
    onMessage(evnt);
    console.log("Received message:", event.data);
};


websocket.onerror = function(event) {
    console.error("WebSocket error:", event.message);
};

websocket.onclose = onClose;

function onOpen() {
    console.log("Opened connection: " + wsURI);
}

function onClose() {
    console.log("Closed connection: " + wsURI);
}

function onMessage(event) {
    console.log(event);
    display(event.data);
}

function display(dataString) {
    var data = JSON.parse(dataString);
    if (data.username === document.getElementById("username_to").value) {
        var fechaHoraActual = new Date();
// Extrae la hora, minutos y segundos
        var horas = fechaHoraActual.getHours();
        var minutos = fechaHoraActual.getMinutes();
// Formatea la salida para asegurarte de que siempre tenga dos dígitos
        horas = (horas < 10) ? '0' + horas : horas;
        minutos = (minutos < 10) ? '0' + minutos : minutos;
// Crea una cadena con la hora formateada
        var horaFormateada = horas + ':' + minutos;
        
        var contentMessage = `
            <li class="conversation-item me">
                <div class="conversation-item-side">
                    <img class="conversation-item-image" src="images/${data.imag}" alt="">
                </div>
                <div class="conversation-item-content">
                    <div class="conversation-item-wrapper">
                        <div class="conversation-item-box">
                            <div class="conversation-item-text">
                                <p>${data.content}</p>
                                <div class="conversation-item-time">${horaFormateada}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>`;
        document.getElementById("output").innerHTML += contentMessage;
        
    } 
    
    if (data.username === document.getElementById("username_in").value) {
        var fechaHoraActual = new Date();
// Extrae la hora, minutos y segundos
        var horas = fechaHoraActual.getHours();
        var minutos = fechaHoraActual.getMinutes();
// Formatea la salida para asegurarte de que siempre tenga dos dígitos
        horas = (horas < 10) ? '0' + horas : horas;
        minutos = (minutos < 10) ? '0' + minutos : minutos;
// Crea una cadena con la hora formateada
        var horaFormateada = horas + ':' + minutos;
        var contentMessage = `
            <li class="conversation-item">
                <div class="conversation-item-side">
                    <img class="conversation-item-image" src="images/prof1.png" alt="">
                </div>
                <div class="conversation-item-content">
                    <div class="conversation-item-wrapper">
                        <div class="conversation-item-box">
                            <div class="conversation-item-text">
                                <p>Hasta mañana</p>
                                <div class="conversation-item-time">12:30</div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>`;

        document.getElementById("output").innerHTML += contentMessage;
    }
   
}

function send() {
    var userto = document.getElementById("username_to").value;
    var nomto = document.getElementById("nom_to").value;
    var message = document.getElementById("message_in").value;
    var userin = document.getElementById("username_in").value;
    var nomin = document.getElementById("nom_in").value;
    var imag = document.getElementById("imag").value;

    var json = {
        "touser": userto,
        "tonom": nomto,
        "content": message,
        "username": userin,
        "usernom": nomin,
        "imagen": imag
    };

    console.log(nomin + " enviando: " + message + " a: " + nomto);
    websocket.send(JSON.stringify(json));
}
