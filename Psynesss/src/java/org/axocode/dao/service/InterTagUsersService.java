/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.axocode.dao.InterTagUsers;

/**
 *
 * @author chump
 */
public class InterTagUsersService extends Conexion<InterTagUsers>{
    
    public boolean addInterTagUsers( InterTagUsers users ){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into intertagusers( taguser ) values( ? )";
        int row = 0;
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setInt(1, users.getTagUser());

            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean modificarTagUsuario(InterTagUsers usuario) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE intertagusers SET tagusersensible = ?, taguserautoestima = ?, taguserrelaciones = ?, taguseransiedad = ?, taguserdepresion = ?, taguserconflictos = ?, taguserbienestar = ?, tagusercrecimiento = ?, tagusersalud = ?, tagusertranstornos = ?, taguserrecaidas = ?, tagusersueno = ? WHERE taguser = ?")) {

            statement.setInt(1, usuario.getTagUserSensible());
            statement.setInt(2, usuario.getTagUserAutoestima());
            statement.setInt(3, usuario.getTagUserRelaciones());
            statement.setInt(4, usuario.getTagUserAnsiedad());
            statement.setInt(5, usuario.getTagUserbDepresion());
            statement.setInt(6, usuario.getTagUserConflictos());
            statement.setInt(7, usuario.getTagUserBienestar());
            statement.setInt(8, usuario.getTagUserCrecimiento());
            statement.setInt(9, usuario.getTagUserSalud());
            statement.setInt(10, usuario.getTagUserTranstornos());
            statement.setInt(11, usuario.getTagUserRecaidas());
            statement.setInt(12, usuario.getTagUserSueno());
            statement.setInt(13, usuario.getTagUser());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("El usuario ha sido modificado exitosamente.");
                return true;
            } else {
                System.out.println("No se encontró el usuario con el número " + usuario.getTagUser());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

}
