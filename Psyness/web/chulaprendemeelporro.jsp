<%-- 
    Document   : chula prendeme el porro
    Created on : 30 nov. 2023, 08:19:34
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Detector de Comentarios Ofensivos</title>
</head>
<body>
    <h1>Detector de Comentarios Ofensivos</h1>
    <input type="text" id="inputText" placeholder="Ingrese un texto aquí...">
    <button onclick="evaluateText()">Evaluar Texto</button>
    <p id="result"></p>

    <!-- Referencias a TensorFlow.js y tu script JS -->
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
    <script src="ia.js"></script>
</body>
</html>
