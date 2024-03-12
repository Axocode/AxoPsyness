<%-- 
    Document   : eliminarPub
    Created on : 1 jun 2023, 0:58:02
    Author     : chump
--%>

<%@page import="org.axocode.dao.service.InterPubService"%>
<%@page import="org.axocode.dao.InterPub"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Psyness</title>
        <!-----Bootstrap------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-----Bootstrap------->
    <link rel="stylesheet" href="../css/feed3css.css">
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
        <!-----Boxicons------->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/jpg" href="../images/favicon.jpg"/>    
    </head>
    <body>
<%
    HttpSession sesion = request.getSession();
          
          int id = Integer.parseInt(request.getParameter("per"));
          int sesionsita = Integer.parseInt(sesion.getAttribute("SIUserNum").toString());
          
   
    if (id == sesionsita || (sesion.getAttribute("SIRol").toString()).equals("Administrador")) {
    
         if (request.getParameter("direct").equals("0")) {
            int cont = Integer.parseInt(request.getParameter("eliminar"));
            int con2 = cont + 1;
            InterPub publicTDelete = new InterPub();
            publicTDelete.setPubNumId(cont);
            InterPubService borrar = new InterPubService();
            borrar.deleteUsers(publicTDelete);    
            response.sendRedirect("../zSocial/feed-new.jsp#"+con2);
            } else if (request.getParameter("direct").equals("1")) {
                int cont = Integer.parseInt(request.getParameter("eliminar"));
                int con2 = cont + 1;
                InterPub publicTDelete = new InterPub();
                publicTDelete.setPubNumId(cont);
                InterPubService borrar = new InterPubService();
                borrar.deleteUsers(publicTDelete);    
                response.sendRedirect("../zSocial/profile-new.jsp?id="+id+"#"+con2);
                 }
        }
%>
    </body>
</html>
