package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.axocode.dao.InterImages;
import org.axocode.dao.service.InterImagesService;

@WebServlet(name = "SubirImagenServlet", urlPatterns = {"/SubirImagenServlet"})
@MultipartConfig
public class SubirImagenServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        try {
            Part filePart = request.getPart("file");
            byte[] fileContent = null;
            String fileName = null;

            if (filePart != null) {
                fileName = filePart.getSubmittedFileName();
                fileContent = getBytesFromInputStream(filePart.getInputStream());
            }

            if (fileContent != null && fileName != null) {
                InterImages images = new InterImages();
                InterImagesService imagesService = new InterImagesService();
                images.setImageName(fileName);
                images.setImages(fileContent);
                images.setImagesPubNumId(1); // Ajusta esto según tu lógica

                boolean result = imagesService.addInterImages(images);

                if (result) {
                    response.getWriter().write("Imagen añadida exitosamente.");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al añadir la imagen.");
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No se recibió ninguna imagen.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
        }
    }

    private byte[] getBytesFromInputStream(InputStream is) throws IOException {
        try (ByteArrayOutputStream os = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int len;
            while ((len = is.read(buffer)) != -1) {
                os.write(buffer, 0, len);
            }
            return os.toByteArray();
        }
    }
}
