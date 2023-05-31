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
import org.axocode.dao.InterPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.InterUsersPub;

/**
 *
 * @author ruizl
 */
public class InterUsersPubService extends Conexion<InterUsersPub>{
    
    
    public List<InterUsersPub> getUsersPubList() 
    {
        List<InterUsersPub> contextList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        InterUsersPub context = null;

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
            resultSet = statement.executeQuery("select * from interuserspub");
            if (resultSet == null) 
            {
                return null;
            }
            contextList = new ArrayList<>();
            while (resultSet.next()) 
            {
                context = new InterUsersPub();
                context.setiUserNum(new InterUsers(resultSet.getInt(1) ) );
                context.setPubNumId(new InterPub(resultSet.getInt(2) ) );
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
    
    public boolean addUsersPub( InterUsersPub contextInterses )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into interuserspub( iusernum ) values( ? )";
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
            preparedStatement.setInt(1, contextInterses.getiUserNum().getIUserNum());
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
    
    public boolean updateInterUsersPub( InterUsersPub contextInterses )
    {
        return false;
    }
    
    public boolean deleteInterUsersPub( InterUsersPub contextInterses )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "deelete from interuserspub where pubnumid = ? and iusernum = ?";
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
            preparedStatement.setInt(1, contextInterses.getPubNumId().getPubNumId());
            preparedStatement.setInt(2, contextInterses.getiUserNum().getIUserNum());
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
    
    public InterUsersPub getInterUsersByInterUsersPub( int PubNumId ) 
    {
        InterUsersPub aux = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
            preparedStatement = connection.prepareStatement("select iusernum from interuserspub where pubnumid = ? " );
            preparedStatement.setInt(1,  PubNumId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) 
            {
                aux = new InterUsersPub();
            aux.setPubNumId(new InterPub(resultSet.getInt(1)));
            aux.setiUserNum(new InterUsers(resultSet.getInt(2)));
            
            }
        }catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                }
            }
        }
        return aux;
    }
    
    
}
