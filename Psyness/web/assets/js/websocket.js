var wsURI = "ws://40.86.11.134:8080/Psyness/chat";
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
        
    var contentMessage = "<div class=\"conversation-item-content\">"+ "<div class=\"conversation-item-wrapper\">"+
                                        "<div class=\"conversation-item-box\"><strong>"+data.userName+
                                            "</strong><div class=\"conversation-item-text\">"+data.conten+
                                            "</div>"+
                                        "</div>"+
                                    "</div>"+
                                    "</div>"+"<br>";
                        
    document.getElementById("output").innerHTML += contentMessage;
}

function send() {
    if (websocket.readyState === WebSocket.OPEN) {
        var message = document.getElementById("message_input").value;
        var username = document.getElementById("message_username").value;
        var json = {
            "conten": message,
            "userName": username
        };
        console.log("Sending"+username+message);
        websocket.send(JSON.stringify(json));
    } else {
        console.error("WebSocket connection is not open.");
    }
}
