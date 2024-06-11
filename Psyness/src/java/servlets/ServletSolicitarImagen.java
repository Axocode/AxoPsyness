package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.axocode.dao.InterImages;
import org.axocode.dao.service.InterImagesService;

@WebServlet(name = "ServletSolicitarImagen", urlPatterns = {"/ServletSolicitarImagen"})
public class ServletSolicitarImagen extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imageIdStr = request.getParameter("pubimageid");
        if (imageIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el parámetro pubimageid.");
            return;
        }

        int imageId = Integer.parseInt(imageIdStr);
        InterImagesService imageService = new InterImagesService();
        InterImages image = imageService.getImageById(imageId);

        if (image != null && image.getImages() != null) {
            response.setContentType(getServletContext().getMimeType(image.getImageName()));
            response.setContentLength(image.getImages().length);
            response.getOutputStream().write(image.getImages());
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Imagen no encontrada.");
        }
    }
}
