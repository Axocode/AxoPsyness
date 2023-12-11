
package bm.java.ws;

import bm.java.ws.model.MesaggeModel;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import com.google.gson.Gson;
import javax.websocket.EndpointConfig;

/**
 *
 * @author Jorge
 */
public class MessageModelEnconder implements Encoder.Text<MesaggeModel>{
    Gson gson = new Gson();
        
    @Override
    public String encode(MesaggeModel message) throws EncodeException {
      if( message == null )
        {
            return "";
        }
        return gson.toJson(message);
    }

    @Override
    public void init(EndpointConfig config) {
       
    }

    @Override
    public void destroy() {
    
    }
}
