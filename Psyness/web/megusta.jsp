
<%@page import="org.axocode.dao.InterPub"%>
<%@page import="org.axocode.dao.service.InterPubService"%>
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
    <link rel="stylesheet" href="css/feed3css.css">
    <script src="https://kit.fontawesome.com/54fa9899e2.js" crossorigin="anonymous"></script>
        <!-----Boxicons------->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/jpg" href="images/favicon.jpg"/>    
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("SIUser") != null){}
        else{out.print("<script>location.replace('index.jsp');</script>");}
        
        
        String pub = request.getParameter("pub");
        int pubInt = Integer.parseInt(pub);
        int pubInte = 0;
        pubInte = pubInt + 1;
        


        if (request.getParameter("chest").equals("feed")) {

                InterPubService metod = new InterPubService();
                InterPub metodo = new InterPub();
                metodo.setPubNumId(pubInt);
                boolean successs = metod.updateMgWithPubNum(metodo);
                if (successs) {
                     response.sendRedirect("feed.jsp#"+pubInte);   
                    }

            
          }          
          if (request.getParameter("chest").equals("profile")) {
                
                InterPubService metod = new InterPubService();
                InterPub metodo = new InterPub();
                metodo.setPubNumId(pubInt);
                boolean successs = metod.updateMgWithPubNum(metodo);
        
            response.sendRedirect("profile.jsp?id="+request.getParameter("id"));
              }
        %>
    </body>
</html>
