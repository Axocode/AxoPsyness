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
import org.axocode.dao.InterCodes;
import org.axocode.dao.InterUsers;

/**
 *
 * @author chump
 */
public class InterCodesService extends Conexion<InterUsers>{
    public List<InterCodes> getInterCodesList() 
    {
        List<InterCodes> codesList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        InterCodes codes = null;

        try 
        {
            connection = getConnection();
            if (connection == null) 
            {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("select * from intercodes");
            if (resultSet == null) 
            {
                return null;
            }
            codesList = new ArrayList<>();
            while (resultSet.next()) 
            {
                codes = new InterCodes();
                codes.setCodescode(resultSet.getString(1));
                codes.setCodesstatus(resultSet.getString(2));
                
                codesList.add(codes);
            }
            resultSet.close();
            closeConnection(connection);
            return codesList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    
    public String getStatusbyCodes(String codescode) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String codesstatus = null;

    try {
        connection = getConnection();
        if (connection == null) {
            return "Error: No se pudo conectar a la base de datos.";
        }

        preparedStatement = connection.prepareStatement("select codesstatus from intercodes where codescode = ?");
        preparedStatement.setString(1, codescode);

        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            codesstatus = resultSet.getString("codesstatus");
        } else {
            codesstatus = "Código no encontrado";
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        return "Error: Excepción SQL";
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    return codesstatus;
}
    
    public boolean modificarCodigo(String Code, String Tipo) {
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement("update intercodes set codesstatus = ? where codescode = ?")) {
        
        statement.setString(1, Tipo);
        statement.setString(2, Code);

        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("El codigo ha sido modificado exitosamente.");
            return true;
        } else {
            System.out.println("No se encontró el codigo con la clave " + Code);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return false;
}

}
