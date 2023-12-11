
package bm.java.ws;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import bm.java.ws.model.MesaggeModel;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author Evelyn El codigo sera comentado para que todos le entendamos 
 */
@ServerEndpoint(value="/chat",decoders = MessageModelDecoder.class,encoders = MessageModelEnconder.class)

public class WebChatHome implements Serializable
        
{

    private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

   
    @OnMessage
    public String onMessage(Session session,MesaggeModel message) {
        //Solo para depurar o sea no solo para depurar pero ayuda a depurar
        System.out.println("Manejo de Masajes: " + message);
        for(Session s: sessions){
            try {
                s.getBasicRemote().sendObject(message);
            } catch (IOException ex) {
                Logger.getLogger(WebChatHome.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EncodeException ex) {
                Logger.getLogger(WebChatHome.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    //Abrir Conexion
    @OnOpen
    public void onOpen (Session session)
    {
        //Solo para depurar o sea no solo para depurar pero ayuda a depurar
        System.out.println("On open: "  + session.getId());
        sessions.add(session);
    }  
     //Cerrar Conexion
    @OnClose
   public void onClose(Session session){
    //Solo para depurar o sea no solo para depurar pero ayuda a depurar
    System.out.println("On close: "  + session.getId());
    sessions.remove(session);
}
}
 