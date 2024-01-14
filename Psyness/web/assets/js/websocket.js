var serverIP = "axocode.gerdoc.com"; 
var wsURI = "ws://" + serverIP + ":8080/Psyness/chat";

var websocket = new WebSocket(wsURI);
console.log("WebSocket readyState: " + websocket.readyState);

websocket.onopen = function() {
    onOpen();
};

websocket.onmessage = function(evnt) {
    onMessage(evnt);
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
    var formattedTime = getFormattedTime();
    var isCurrentUser = data.username === document.getElementById("username_in").value;

    var contentMessage = `
        <div class="row">
            <div class="col-11">
                <div class="d-flex flex-row-reverse mb-1">
                    <div class="d-flex flex-column">
                        <div class="conversation-item ${isCurrentUser ? "me" : ""}">
                            <div class="conversation-item-side">
                                <img class="conversation-item-image" src="images/${data.imagen}" alt="">
                            </div>
                            <div class="conversation-item-content">
                                <div class="conversation-item-wrapper">
                                    <div class="conversation-item-box">
                                        <div class="conversation-item-text">
                                            <p>${data.content}</p>
                                            <div class="conversation-item-time">${isCurrentUser ? formattedTime : "12:30"}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1">
                <i class="bi bi-person-circle rounded-full w-12 me-4"></i>
            </div>
        </div>`;

    document.getElementById("output").innerHTML += contentMessage;
}

function getFormattedTime() {
    var fechaHoraActual = new Date();
    var horas = fechaHoraActual.getHours();
    var minutos = fechaHoraActual.getMinutes();
    horas = (horas < 10) ? '0' + horas : horas;
    minutos = (minutos < 10) ? '0' + minutos : minutos;
    return horas + ':' + minutos;
}


function send() {
    if (websocket.readyState === WebSocket.OPEN) {
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
        console.log("Sending"+userin+message);
        websocket.send(JSON.stringify(json));
    } else {
        console.error("WebSocket connection is not open.");
    }
}
