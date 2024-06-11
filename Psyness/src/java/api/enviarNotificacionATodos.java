package api;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.axocode.dao.InterLocation;
import org.axocode.dao.service.InterLocationService;

@WebServlet(name = "enviarNotificacionATodos", urlPatterns = {"/enviarNotificacionATodos"}, loadOnStartup = 1)
public class enviarNotificacionATodos extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();

        String relativePath = "path/to/serviceAccountKey.json";
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InterLocationService locationService = new InterLocationService();
        List<InterLocation> locations = locationService.findAll();

        for (InterLocation location : locations) {
            String token = location.getLocationToken();
            if (token != null && !token.isEmpty() && !token.equals("NULL")) {
                sendNotification(token, location.getLocationMessage());
            }
        }

        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();
        out.write("Notifications sent.");
        out.close();
    }

    private void sendNotification(String token, String message) {
        Notification notification = Notification.builder()
                .setTitle("New Message")
                .setBody(message)
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
