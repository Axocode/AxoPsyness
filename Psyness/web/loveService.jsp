<%-- 
    Document   : loveService
    Created on : 18 nov 2023, 23:45:44
    Author     : chump
--%>

<%@page import="org.axocode.dao.InterPub"%>
<%@page import="org.axocode.dao.service.InterPubService"%>
<%@page import="org.axocode.dao.InterLove"%>
<%@page import="org.axocode.dao.service.InterLoveService"%>
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
        
        
        int pubInt = Integer.parseInt(request.getParameter("pub"));
        int IUserNum = (Integer) sesion.getAttribute("SIUserNum");
        
        
        if (request.getParameter("action1").equals("Love")) {

        if (request.getParameter("chest").equals("feed")) {
        InterLoveService love = new InterLoveService();
        InterLove lov = new InterLove();
        lov.setLoveIdPub(pubInt);
        lov.setLoveIdUser(IUserNum);   
        boolean exist = love.checkIfLoveExists(lov);
        if (!exist) {
                
        boolean successs = love.addInterLove(lov);
        if (successs) {
        InterPubService pubService = new InterPubService();
        pubService.actLove(pubInt);
          
        pubInt = pubInt + 1;
        response.sendRedirect("feed-new.jsp#"+pubInt);}}else {pubInt = pubInt + 1;response.sendRedirect("feed-new.jsp#"+pubInt);}}
          
          
          
        if (request.getParameter("chest").equals("profile")) {
        int pre = Integer.parseInt(request.getParameter("id"));
        InterLoveService love = new InterLoveService();
        InterLove lov = new InterLove();
        lov.setLoveIdPub(pubInt);
        lov.setLoveIdUser(IUserNum);   
        boolean exist = love.checkIfLoveExists(lov);
        if (!exist) {     
        boolean successs = love.addInterLove(lov);
        
        if (successs) {
        InterPubService pubService = new InterPubService();
        pubService.actLove(pubInt);;    
        
        
        response.sendRedirect("profile.jsp?id="+pre);
            }}else response.sendRedirect("profile.jsp?id="+pre);}
         
            
        if (request.getParameter("chest").equals("rufless")) {
        int pre = Integer.parseInt(request.getParameter("id"));
        InterLoveService love = new InterLoveService();
        InterLove lov = new InterLove();
        lov.setLoveIdPub(pubInt);
        lov.setLoveIdUser(IUserNum);   
        boolean exist = love.checkIfLoveExists(lov);
        if (!exist) {
                
        boolean successs = love.addInterLove(lov);
        if (successs) {
        InterPubService pubService = new InterPubService();
        pubService.actLove(pubInt);
            
        response.sendRedirect("favs.jsp?rufless=on&&favs="+request.getParameter("u"));
              }}else{response.sendRedirect("favs.jsp?rufless=on&&favs="+request.getParameter("u"));}}
              
        }

        if (request.getParameter("action1").equals("Lovent")) {
        
        if (request.getParameter("chest").equals("feed")) {
    
        InterLoveService love = new InterLoveService();
        InterLove lov = new InterLove();
        lov.setLoveIdPub(pubInt);
        lov.setLoveIdUser(IUserNum);   
        boolean exist = love.checkIfLoveExists(lov);
        if (exist) {
                 
        boolean successs = love.unfollowLove(lov);
        if (successs) {
        
        InterPubService pubService = new InterPubService();
        pubService.actLove(pubInt); 
        
        pubInt = pubInt + 1;
        response.sendRedirect("feed-new.jsp#"+pubInt);}}else{pubInt = pubInt + 1; response.sendRedirect("feed-new.jsp#"+pubInt);}}
          
          
          
        if (request.getParameter("chest").equals("profile")) {
        String pre = request.getParameter("id");
        int rooot = Integer.parseInt(pre);
        InterLoveService love = new InterLoveService();
        InterLove lov = new InterLove();
        lov.setLoveIdPub(pubInt);
        lov.setLoveIdUser(IUserNum);   
        boolean exist = love.checkIfLoveExists(lov);
        if (exist) {
                
        boolean successs = love.unfollowLove(lov);
        
        if (successs) {
        InterPubService pubService = new InterPubService();
        pubService.actLove(pubInt);
            
        response.sendRedirect("profile.jsp?id="+rooot);
              }}else{response.sendRedirect("profile.jsp?id="+rooot);}}
         
        if (request.getParameter("chest").equals("rufless")) {
        String pre = request.getParameter("id");
        InterLoveService love = new InterLoveService();
        InterLove lov = new InterLove();
        lov.setLoveIdPub(pubInt);
        lov.setLoveIdUser(IUserNum);   
        boolean exist = love.checkIfLoveExists(lov);
        if (exist) {
                
        boolean successs = love.unfollowLove(lov);
        if (successs) {
        InterPubService pubService = new InterPubService();
        pubService.actLove(pubInt); 
            
        
        response.sendRedirect("favs.jsp?rufless=on&&favs="+request.getParameter("u"));}}else{response.sendRedirect("favs.jsp?rufless=on&&favs="+request.getParameter("u"));}}
            }

%>
    </body>
</html>
