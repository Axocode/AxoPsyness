/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.axocode.dao.InterLocation;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterLocationService;
import org.axocode.dao.service.InterUsersService;

/**
 *
 * @author chump
 */
@WebServlet(name = "notificacion", urlPatterns = {"/notificacion"}, loadOnStartup = 1)
public class notificacion extends HttpServlet {

    private notificacion notificacion;
    
    @Override
    public void init() throws ServletException {
        super.init();
        notificacion = new notificacion();

        String relativePath = "assets/js/hola.json";
        String absolutePath = getServletContext().getRealPath("/") + relativePath;

        try (FileInputStream serviceAccount = new FileInputStream(absolutePath)) {
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            FirebaseApp.initializeApp(options);
        } catch (IOException e) {
            throw new ServletException("Failed to initialize Firebase", e);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userToken = request.getParameter("userToken");
        String mensaje = request.getParameter("mensaje");
        String latitudeStr = request.getParameter("latitude");
        String longitudeStr = request.getParameter("longitude");
        if (userId == null || userToken == null || latitudeStr == null || longitudeStr == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing parameters");
            return;
        }

        int userIdInt;
        double latitude;
        double longitude;
        try {
            userIdInt = Integer.parseInt(userId);
            latitude = Double.parseDouble(latitudeStr);
            longitude = Double.parseDouble(longitudeStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid number format");
            return;
        }

        InterLocation location = new InterLocation();
        InterLocationService locationService = new InterLocationService();
        location.setLocationUser(userIdInt);
        location.setLocationToken(userToken);
        location.setLocationLatitud(latitude);
        location.setLocationLongitud(longitude);

        if (mensaje != null) {
            location.setLocationMessage(mensaje);
        } else {
            location.setLocationMessage("");
        }

        locationService.updateLocationInDatabase(location);
        List<InterLocation> nearbyUsers = locationService.findInterLocationsWithinRadius(latitude, longitude, 5);

        for (InterLocation user : nearbyUsers) {
            String supportMessage = locationService.getSupportMessageFromDatabase(userIdInt);
            InterUsersService users = new InterUsersService();
            InterUsers persona = users.getUserByInterUsersNum(userIdInt);
            sendNotification(user.getLocationToken(), supportMessage, persona.getIUser());
        }

        response.getWriter().write("Location updated and support messages sent");
    }


    private void sendNotification(String token, String mensaje, String persona) {
        Notification notification = Notification.builder()
                .setTitle(persona)
                .setBody(mensaje)
                .build();

        Message msg = Message.builder()
                .setToken(token)
                .setNotification(notification)
                .build();

        try {
            String response = FirebaseMessaging.getInstance().send(msg);
            System.out.println("Successfully sent message: " + response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}