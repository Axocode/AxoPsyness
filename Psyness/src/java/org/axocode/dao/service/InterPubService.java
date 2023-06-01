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



/**
 *
 * @author gerdoc
 */
public class InterPubService extends Conexion<InterPub>
{
    public List<InterPub> getInterPubList() 
    {
        List<InterPub> pubList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        InterPub pub = null;

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
            resultSet = statement.executeQuery("select * from interpub");
            if (resultSet == null) 
            {
                return null;
            }
            pubList = new ArrayList<>();
            while (resultSet.next()) 
            {
                pub = new InterPub();
                pub.setPubNumId(resultSet.getInt(1));
                pub.setPubCont(resultSet.getString(2));
                pub.setPubMg(resultSet.getInt(3));
                
                pubList.add(pub);
            }
            resultSet.close();
            closeConnection(connection);
            return pubList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    
    public boolean addInterPub( InterPub pub )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into interpub( pubcont ) values( ? )";
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
            preparedStatement.setString(1, pub.getPubCont());

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
        public boolean updateMgWithPubNum( InterPub exp )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interpub set pubmg = pubmg + 1 where pubnumid = ?";
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
            preparedStatement.setInt(1, exp.getPubNumId());
            
            
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
        
    public InterPub getPubByInterPub(int PubNumId) {
    InterPub aux = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        
        preparedStatement = connection.prepareStatement("select * from interpub where pubnumid = ?");
        preparedStatement.setInt(1, PubNumId);
        
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            aux = new InterPub();
            aux.setPubCont(resultSet.getString(1));
            aux.setPubMg(resultSet.getInt(2));
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        // Cerrar los recursos en el orden inverso
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
public boolean deleteUsers( InterPub pub )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "delete from interpub where pubnumid = ?";
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
            preparedStatement.setInt(1, pub.getPubNumId());
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
