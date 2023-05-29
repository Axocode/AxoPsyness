<%-- 
    Document   : seguir
    Created on : 28 may 2023, 16:18:56
    Author     : chump
--%>

<%@page import="org.axocode.dao.service.InterFlowService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterFlow"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
        
        
        
    if (request.getParameter("chest").equals("feed")) {
        String pub = request.getParameter("pub");
        int pubInt = Integer.parseInt(pub);
        pubInt = pubInt + 1;
        
        int FlowSeguidoresID = Integer.parseInt(request.getParameter("id"));
        int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");


                InterFlowService flower = new InterFlowService();
                InterFlow flow = new InterFlow();
                flow.setFlowSeguidoresID(FlowSeguidoresID);
                flow.setFlowSeguidorID(FlowSeguidorID);
                
        boolean successs = flower.addInterFlow(flow);

        InterUsersService usersService = new InterUsersService();
        InterUsers user = new InterUsers();

        user.setIUserNum((FlowSeguidoresID));
        usersService.updateFlowSeguidoresNum(user);
        
        InterUsers userr = new InterUsers();
        userr.setIUserNum(FlowSeguidorID);
        usersService.updateFlowSeguidoNum(userr);
        
            response.sendRedirect("feed.jsp#"+pubInt);
          }
          
          
          
          if (request.getParameter("chest").equals("profile")) {
        
        int FlowSeguidoresID = Integer.parseInt(request.getParameter("id"));
        int FlowSeguidorID = (Integer) sesion.getAttribute("SIUserNum");


                InterFlowService flower = new InterFlowService();
                InterFlow flow = new InterFlow();
                flow.setFlowSeguidoresID(FlowSeguidoresID);
                flow.setFlowSeguidorID(FlowSeguidorID);
                
        boolean successs = flower.addInterFlow(flow);
    


        InterUsersService usersService = new InterUsersService();
        InterUsers user = new InterUsers();

        user.setIUserNum((FlowSeguidoresID));
        usersService.updateFlowSeguidoresNum(user);
        
        InterUsers userr = new InterUsers();
        userr.setIUserNum(FlowSeguidorID);
        usersService.updateFlowSeguidoNum(userr);
        
            response.sendRedirect("profile.jsp?id="+FlowSeguidoresID);
              }

%>
    </body>
</html>
