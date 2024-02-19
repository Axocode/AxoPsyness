package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterUsersService;

@WebServlet("/BusquedaServlet")
public class BusquedaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String searchTerm = request.getParameter("term");
        System.out.println("Search Term: " + searchTerm);
        
        // Aquí deberías implementar la lógica de búsqueda basada en el searchTerm
        InterUsersService objet = new InterUsersService();
        List<InterUsers> users = objet.getInterUsersListByTerm(searchTerm);

        try (PrintWriter out = response.getWriter()) {
            if (users != null && users.size() > 0) {
                for (InterUsers user : users) {
                    out.println("<div class='box_profile_search' onclick=\"location.href='profile-new.jsp?id=" + user.getIUserNum() + "'\">");
                    out.println("<img src='../images/" + user.getIImgNum() + "' class='img_search'>");
                    out.println("<p>" + user.getIUser() + "<span>" + user.getIAge() + "</span></p>");
                    out.println("<div class='icons_X'><i class='bx bx-x'></i></div></div>");
                }
            } else {
                out.println("<p>   No se encontraron resultados</p>");
            }
        }
    }
}
