<%-- 
    Document   : chat1
    Created on : 27 oct. 2023, 0:41:29
    Author     : Admin
--%>

<%@page import="org.axocode.dao.service.InterUsersService"%>
<%@page import="org.axocode.dao.InterUsers"%>
<%@page import="java.util.List"%>
<%@page import="org.axocode.helper.InterUsersHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tailwindcss-colors.css">
    <link rel="stylesheet" href="css/stylechat2.css">
    <title>Chat</title>
</head>
<body>
    <script src="../../recursos/scripts/websocket.js"></script>
<%request.setCharacterEncoding("UTF-8");
                                int hola = 0;
                                HttpSession sesion = request.getSession();%>
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
                            <img src="images/prof1.png" alt="">
                             

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
                                    <img class="content-message-image" src="assets/images/avatars/<%=sesion.getAttribute("SIImgNum")%>" alt="">
                                    <span class="content-message-info">
                                        <span class="content-message-name"><%=sesion.getAttribute("SIUser")%> (Tu)</span>
                                    </span>
                                    <span class="content-message-more">
                                        <span class="content-message-unread">2</span>
                                    </span>
                                </a>
                                
                            </li>
                            <%
                                request.setCharacterEncoding("UTF-8");
                                InterUsersHelper ola = new InterUsersHelper();
                                List<InterUsers> usuarios = ola.getListT();

                                if (usuarios != null&&usuarios.size() > 0) {
                                
                                
                                        for(InterUsers uaaaa : usuarios){
                                        hola++;
                            %>
                            <li>
                                <a href="chat1.jsp?a=chat&i=<%=uaaaa.getIUserNum() %>&n=<%=uaaaa.getIUser()%>">
                                    <img class="content-message-image" src="assets/images/avatars/<%=uaaaa.getIImgNum()%>" alt="">
                                    <span class="content-message-info">
                                        <span class="content-message-name">Chat de Depresión</span>
                                    </span>
                                    <span class="content-message-more">
                                        <span class="content-message-unread">2</span>
                                    </span>
                                </a>
                                
                            </li>
                            <%
                            
                                if (hola == 1) {
                                        break;
                                    }
}
                            }

                            %>
                            
                        </ul>
                        
                    </div>
                </div>
                <!-- end: Content side -->
                <!-- start: Conversation -->
                <%
                    String oli = request.getParameter("i");
                    if (oli == null) {
                            
                        
                    
                    %>
                <div class="conversation conversation-default active">
                    <i class="ri-chat-3-line"></i>
                    <p>Selecciona un chat</p>
                </div>
                
                <% 
                    }else{
                        InterUsers objetito = new InterUsers();
                        InterUsersService objetitoService = new InterUsersService();
                        
                        objetito = objetitoService.getUserByInterUsersNum(Integer.parseInt(oli));
                            

                %>
                <div class="conversation active" id="conversation-1">
                    <div class="conversation-top">
                        <button type="button" class="conversation-back"><i class="ri-arrow-left-line"></i></button>
                        <div class="conversation-user">
                            <img class="conversation-user-image" src="assets/images/avatars/<%=objetito.getIImgNum()%>" alt="">
                            <div>
                                <div class="conversation-user-name">Chat grupal sobre depresion</div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="conversation-main">
                        <ul class="conversation-wrapper">
                            <div class="coversation-divider"><span>Hoy</span>
                            
                                <div id="output"></div>
                            
                            </div>
                            
                            
                        </ul>
                    </div>
                    <div class="conversation-form">
                        <button type="button" class="conversation-form-button" onclick="send()"><i class="ri-emotion-line"></i></button>
                        <div class="conversation-form-group">
                            <input hidden id="username_input" placeholder="Your username">
                            <input id="message_input" type="text">
                            <input hidden id="message_username" value="<%=sesion.getAttribute("SIUser")%>" type="text">
                            <input hidden id="message_usernum" value="<%=sesion.getAttribute("SIUser")%>" type="text">
                            <input hidden id="message_username" value="<%=sesion.getAttribute("SIUser")%>" type="text">
                            
                            <button onclick="send()"type="button" class="conversation-form-button conversation-form-submit"><i class="ri-send-plane-2-line"></i></button>
                        </div>
                    </div>
                </div>
                <%
                    }
                    %>
                
                <!-- end: Conversation -->
            </div>
            <!-- end: Content -->
        </div>
    </section>
    <!-- end: Chat -->
    
        <script src="assets/js/websocket.js"></script>
    <script src="script.js"></script>
</body>
</html>
