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
}
