<%-- 
    Document   : chat1
    Created on : 27 oct. 2023, 0:41:29
    Author     : Admin
--%>

<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/tailwindcss-colors.css">
    <link rel="stylesheet" href="../css/stylechat2.css">
    <title>Chat</title>
</head>
<body>
<%  
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();

        String accion = request.getParameter("a");
%>
    <!-- start: Chat -->
    <section class="chat-section">
        <div class="chat-container">
            <!-- start: Sidebar -->
            <aside class="chat-sidebar">
                <a href="feed-new.jsp" class="chat-sidebar-logo">
                    <i class="ri-arrow-left-line"></i> 
                </a>
                <ul class="chat-sidebar-menu">
                    <li class="active"><a href="#" data-title="Chats"><i class="ri-chat-3-line"></i></a></li>
                    <li class="chat-sidebar-profile">
                        <button type="button" class="chat-sidebar-profile-toggle">
                            <img src="../images/prof1.png" alt="">
                             

                        </button>
                        
                    </li>
                </ul>
            </aside>
            <!-- end: Sidebar -->
            <!-- start: Content -->
            <div class="chat-content">
                <!-- start: Content side -->
                <div class="content-sidebar">
                    <div class="content-sidebar-title">Chats</div>
                    
                    <div class="content-messages">
                        <ul class="content-messages-list">
                            <li class="content-message-title"><span>Recientes</span></li>
                            <li>
                                <a href="">
                                    <img class="content-message-image" src="../assets/images/avatars/<%=sesion.getAttribute("SIImgNum")%>" alt="">
                                    <span class="content-message-info">
                                        <span class="content-message-name"><%=sesion.getAttribute("SIUser")%> (Tu)</span>
                                    </span>
                                    <span class="content-message-more">
                                        <span class="content-message-unread">2</span>
                                    </span>
                                </a>
                                
                            </li>
                            <%
                                InterUsersHelper ola = new InterUsersHelper();
                                List<InterUsers> usuarios = ola.getListT();

                                if (usuarios != null&&usuarios.size() > 0) {
                                
                                
                                        for(InterUsers uaaaa : usuarios){
                            %>
                            <li>
                                <a href="chat1.jsp?a=chat&i=<%=uaaaa.getIUserNum() %>&n=<%=uaaaa.getIUser()%>">
                                    <img class="content-message-image" src="../assets/images/avatars/<%=uaaaa.getIImgNum()%>" alt="">
                                    <span class="content-message-info">
                                        <span class="content-message-name"><c:out value='<%=uaaaa.getIUser()%>'/> </span>
                                    </span>
                                    <span class="content-message-more">
                                        <span class="content-message-unread">2</span>
                                    </span>
                                </a>
                                
                            </li>
                            <%
                            
                               
}
                            }

                            %>
                            
                        </ul>
                        
                    </div>
                </div>
                <!-- end: Content side -->
                <!-- start: Conversation -->
                <%
                    String o = request.getParameter("i");
                    String ol = request.getParameter("a");
                    String oli = request.getParameter("n");
                    if (o == null || ol == null || oli == null) {
                            
                    
                    %>
                <div class="conversation conversation-default active">
                    <i class="ri-chat-3-line"></i>
                    <p>Selecciona un chat</p>
                </div>
                
                <% 
                    }else if (accion != null) {
                            if ("chat".equals(accion)) {
                                
                                String id_rem = request.getParameter("i");
                                String nom_rem = request.getParameter("n");
                                InterUsers objetito = new InterUsers();
                                InterUsersService objetitoService = new InterUsersService();
                        
                                objetito = objetitoService.getUserByInterUsersNum(Integer.parseInt(o));
                            

                %>
                <div class="conversation active" id="conversation-1">
                    <div class="conversation-top">
                        <button type="button" class="conversation-back"><i class="ri-arrow-left-line"></i></button>
                        <div class="conversation-user">
                            <img class="conversation-user-image" src="../assets/images/avatars/<%=objetito.getIImgNum()%>" alt="">
                            <div>
                                <div class="conversation-user-name"><c:out value='<%=objetito.getIUser()%>'/></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="conversation-main">
                        <ul class="conversation-wrapper">
                            <div class="coversation-divider"><span></span></div>
                                <div id="output">
                                </div>
                        </ul>
                    </div>
                    <div class="conversation-form">
                        <div class="conversation-form-group">
                            <textarea id="message_in" class="conversation-form-input" rows="1" placeholder="Escribe aqui"></textarea>
                            <input id="username_to" type="text" value="<%=id_rem%>" hidden>
                            <input id="nom_to" type="text" value="<%=nom_rem%>" hidden>
                            <input id="username_in" typse="text" value="<%=sesion.getAttribute("SIUserNum")%>" hidden>
                            <input id="nom_in" type="text" value="<%=sesion.getAttribute("SIUser")%>" hidden>
                            <input id="imag" type="text" value="<%=sesion.getAttribute("SIImgNum")%>" hidden>
                        </div>
                        <button onclick="send()" type="button" class="conversation-form-button conversation-form-submit"><i class="ri-send-plane-2-line"></i></button>
                    </div>
                </div>
                <%
                    }}
                    %>
                
                <!-- end: Conversation -->
            </div>
            <!-- end: Content -->
        </div>
    </section>
    <!-- end: Chat -->
    
        <script src="../assets/js/websocket.js"></script>
        <script src="../zProcesos/script.js"></script>
</body>
</html>
