import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterUsersService;
import servlets.HtmlEscape;

@WebServlet("/BusquedaServlet")
public class BusquedaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establece el tipo de contenido y codificación de caracteres para la respuesta
        response.setContentType("text/html;charset=UTF-8");

        // Obtiene el término de búsqueda desde el parámetro de la solicitud
        String searchTerm = request.getParameter("term");

        // Realiza la búsqueda utilizando el término de búsqueda
        InterUsersService service = new InterUsersService();
        List<InterUsers> users = service.getInterUsersListByTerm(searchTerm);
        // Escribe los resultados de la búsqueda en la respuesta
        try (PrintWriter out = response.getWriter()) {
            if (users != null && !users.isEmpty()) {
                for (InterUsers user : users) {
                    String usuario = HtmlEscape.escapeHtml(user.getIUser());
                    out.println("<div class='box_profile_search' onclick=\"location.href='profile-new.jsp?id=" + user.getIUserNum() + "'\">");
                    out.println("<img src='../images/" + user.getIImgNum() + "' alt='User Image' class='img_search'>");
                    out.println("<p>" + usuario + "</p>");
                    out.println("<div class='icons_X'><i class='bx bx-x'></i></div></div>");
                }
            } else {
                // Mensaje de no resultados encontrados
                out.println("<p>No se encontraron resultados.</p>");
            }
        }
    }
}

