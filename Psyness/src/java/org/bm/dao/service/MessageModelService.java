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
import bm.java.ws.model.MesaggeModel;

/**
 *
 * @author Evelyn
 */

public class MessageModelService extends Conexion<MesaggeModel>
{
    
     public List<MesaggeModel> getMensahModelsList() 
     {  
        List<MesaggeModel> mesaggeList =null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        MesaggeModel message = null;
        try {
            connection = getConnection();
            if (connection == null) { 
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT * FROM Mensaje");
            if (resultSet == null) {
                return null;
            }
            mesaggeList = new ArrayList<>();
            while (resultSet.next()) {
                message = new MesaggeModel();
                message.setMensajeID(resultSet.getInt("MensajeID"));
                message.setChatID(resultSet.getInt("ChatID"));
                message.setUserID(resultSet.getInt("UserID"));
                message.setConten(resultSet.getString("Contenido"));
                mesaggeList.add(message);
            }
            resultSet.close();
            closeConnection(connection);
            return mesaggeList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return mesaggeList; 
     }
     
      public boolean addMessage(MesaggeModel message) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO Mensaje (ChatID, UserID,Contenido) VALUES (?, ?, ?)";
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
            preparedStatement.setInt(1, message.getChatID());
            preparedStatement.setInt(2, message.getUserID());
            preparedStatement.setString(3, message.getConten());
            row = preparedStatement.executeUpdate();

            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return row < 0;
    } 
}
