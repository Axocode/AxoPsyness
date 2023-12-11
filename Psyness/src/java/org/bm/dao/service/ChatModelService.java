/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.bm.dao.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import bm.java.ws.model.ChatModel;



/**
 *
 * @author Evelyn
 */
public class ChatModelService extends Conexion<ChatModel>
{
    public List<ChatModel> getMensahModelsList() 
     {  
        List<ChatModel> chatModelslist =null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ChatModel chat = null;
        try {
            connection = getConnection();
            if (connection == null) { 
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM Chat");
            if (resultSet == null) {
                return null;
            }
            chatModelslist = new ArrayList<>();
            while (resultSet.next()) {
                chat = new ChatModel();
                chat.setChatID(resultSet.getInt("ChatID"));
                chat.setPadreID(resultSet.getInt("PadreID"));
                chat.setSoporteTecnicoID(resultSet.getInt("SoporteTecnicoID"));
                chatModelslist.add(chat);
            }
            resultSet.close();
            closeConnection(connection);
            return chatModelslist;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return chatModelslist; 
     }
    
     public boolean addChat(ChatModel message) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO Chat (PadreID, SoporteTecnicoID) VALUES (?, ?)";
        int row = 0;
        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, message.getPadreID());
            preparedStatement.setInt(2, message.getSoporteTecnicoID());
            row = preparedStatement.executeUpdate();

            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return row < 0;
    }
}
