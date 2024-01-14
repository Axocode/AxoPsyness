package com.axocode.ws;


import com.google.gson.Gson;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import org.axocode.model.MessageModel;

public class MessageModelDecoder implements Decoder.Text<MessageModel>{

    Gson gson = new Gson();
    
    @Override
    public MessageModel decode(String s) throws DecodeException {
        return gson.fromJson(s,MessageModel.class);
    }

    @Override
    public boolean willDecode(String s) {
        return s != null;
    }

    @Override
    public void init(EndpointConfig config) {
    }

    @Override
    public void destroy() {
    }
    
}
