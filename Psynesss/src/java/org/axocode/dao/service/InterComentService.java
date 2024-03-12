/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.axocode.dao.InterComent;


/**
 *
 * @author chump
 */
public class InterComentService extends Conexion<InterComent>{
    
    
    public boolean addInterComent(InterComent coment) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "insert into intercoment (comentcontenido, comentdate, comenthour, iusernum, pubnumid) values (?, ?, ?, ?, ?)";
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

        // Configurar los parámetros de la consulta SQL
        preparedStatement.setString(1, coment.getComentCont());
        preparedStatement.setString(2, coment.getComentDate());
        preparedStatement.setString(3, coment.getComentHour());
        preparedStatement.setInt(4, coment.getComentIUserNum());
        preparedStatement.setInt(5, coment.getComentPubNumId());

        // Ejecutar la actualización y verificar el resultado
        row = preparedStatement.executeUpdate();
        closeConnection(connection);
        System.out.println("publicado");
        return row == 1;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
        System.out.println("error1");
    return false;
}

    
  
    
    public List<InterComent> getInterComentListWithNum(int num, int count, int offset) {
    List<InterComent> comentList = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    InterComent coment = null;

    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        
        String query = "SELECT * FROM intercoment WHERE pubnumid = ? ORDER BY idcoment DESC LIMIT ? OFFSET ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, num);
        preparedStatement.setInt(2, count);
        preparedStatement.setInt(3, offset);

        resultSet = preparedStatement.executeQuery();

        comentList = new ArrayList<>();
        while (resultSet.next()) {
            coment = new InterComent();
            coment.setComentId(resultSet.getInt(1));
            coment.setComentCont(resultSet.getString(2));
            coment.setComentLikes(resultSet.getInt(3));
            coment.setComentDislikes(resultSet.getInt(4));
            coment.setComentDate(resultSet.getString(5));
            coment.setComentHour(resultSet.getString(6));
            coment.setComentIUserNum(resultSet.getInt(7));
            coment.setComentPubNumId(resultSet.getInt(8));
            
            comentList.add(coment);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        return null;
    } finally {
        // Cierra los recursos en un bloque finally
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return comentList;
}


    

}
