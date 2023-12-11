var wsURI = "ws://" + document.location.host + document.location.pathname + "chat";

var websocket = new WebSocket(wsURI);

websocket.onmessage = function(event) {
    
    onMessage(event);
    
};

websocket.onopen = function() {
    
    onOpen();
    
};

function onOpen() {
    
    console.log("Conexion abierta: " + wsURI);
    
    
}

function onClose() {
    
    console.log("Conexion cerrada: " + wsURI);
    
}

function onMessage(event) {
    
    console.log(event);
    display(event.data);
    
}

function display(dataString) {
    var data = JSON.parse(dataString);

    
    if (data.username === document.getElementById("username_to").value) {
        
        var contentMessage = "<p>" + data.usernom + ": " + data.content + "</p>";
        document.getElementById("output").innerHTML += contentMessage + "</br>";
        
    }
    if (data.username === document.getElementById("username_in").value) {
        
        var contentMessage = "<p>" + data.usernom + ": " + data.content + "</p>";
        document.getElementById("output").innerHTML += contentMessage + "</br>";
        
    }
    
}

function send() {
    
    var userto = document.getElementById("username_to").value;
    var nomto = document.getElementById("nom_to").value;
    var message = document.getElementById("message_in").value;
    var userin = document.getElementById("username_in").value;
    var nomin = document.getElementById("nom_in").value;
    
    var json = {
        "touser": userto,
        "tonom": nomto,
        "content": message,
        "username": userin,
        "usernom": nomin
    };
    
    console.log(nomin + " enviando: " + message + " a: " + nomto);
    websocket.send(JSON.stringify(json));
    
}