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
import org.axocode.dao.InterUsersCodes;

/**
 *
 * @author chump
 */
public class InterCodesUsersService extends Conexion<InterUsersCodes>{
    public List<InterUsersCodes> getUsersCodesList() 
    {
        List<InterUsersCodes> contextList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        InterUsersCodes context = null;

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
            resultSet = statement.executeQuery("select * from interuserscode");
            if (resultSet == null) 
            {
                return null;
            }
            contextList = new ArrayList<>();
            while (resultSet.next()) 
            {
                context = new InterUsersCodes();
                context.setIUserNum(new InterUsers(resultSet.getInt(1) ) );
                context.setCodesCode(new InterCodes(resultSet.getString(2) ) );
                contextList.add(context);
            }
            resultSet.close();
            closeConnection(connection);
            return contextList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    public boolean addUsersCode( InterUsersCodes contextInterses )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into interuserscodes( codescodee ) values( ? )";
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
            preparedStatement.setInt(1, contextInterses.getIUserNum().getIUserNum());
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
    
    public boolean addCodesUsers( InterUsersCodes contextInterses )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into interuserscode(iusernum,codescode) values( ?, ? )";
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
            preparedStatement.setInt(1, contextInterses.getIUserNum().getIUserNum());
            preparedStatement.setString(2, contextInterses.getCodesCode().getCodescode());
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
