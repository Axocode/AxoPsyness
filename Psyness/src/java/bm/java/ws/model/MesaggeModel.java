/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bm.java.ws.model;
/**
 *
 * @author Jorge
 */
public class MesaggeModel {
    private String conten;
     private String userName;
     private int MensajeID;
     private int UserID;
     private int ChatID;

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getMensajeID() {
        return MensajeID;
    }

    public void setMensajeID(int MensajeID) {
        this.MensajeID = MensajeID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getChatID() {
        return ChatID;
    }

    public void setChatID(int ChatID) {
        this.ChatID = ChatID;
    }

   
}
