<%-- 
    Document   : error
    Created on : 24 may 2023, 18:29:58
    Author     : chump
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (request.getParameter("direct").equals("0")) {response.sendRedirect("../zSocial/feed-new.jsp");}
        else if (request.getParameter("direct").equals("1")) {response.sendRedirect("../zSocial/profile-new.jsp?id="+request.getParameter("perf"));
        }else if (request.getParameter("direct").equals("2")) {response.sendRedirect("../zSocial/feed-new.jsp#"+request.getParameter("place"));
        }
        %>
    </body>
</html>
