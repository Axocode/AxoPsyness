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
                pub.setPubDate(resultSet.getString(4));
                pub.setPubHour(resultSet.getString(5));
                
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
        String sql = "insert into interpub( pubcont, pubdate, pubhour ) values( ?, ?, ? )";
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
            preparedStatement.setString(2, pub.getPubDate());
            preparedStatement.setString(3, pub.getPubHour());

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
            aux.setPubDate(resultSet.getString(3));
            aux.setPubHour(resultSet.getString(4));
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
    
    public boolean getPubLateDay(String pubdate) {
    InterPub aux = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return false;  
        }
        
        preparedStatement = connection.prepareStatement("select * from interpub where pubdate = ?");
        preparedStatement.setString(1, pubdate);
        
        resultSet = preparedStatement.executeQuery();
        
        if (resultSet.next()) {
            aux = new InterPub();
            aux.setPubCont(resultSet.getString("pubcont"));
            aux.setPubMg(resultSet.getInt("pubmg"));
            aux.setPubDate(resultSet.getString("pubdate"));
            
        
            System.out.println("Publicación encontrada: " + aux.getPubCont());
            
        
            return true;
        } else {
        
            System.out.println("No se encontró ninguna publicación para la fecha: " + pubdate);
            
        
            return false;
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    } finally {
        
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    public InterPub getMostLikedPubByDate(String pubdate) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    String sql = "select * from interpub where pubdate = ? order by pubmg desc limit 1";

    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, pubdate);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            InterPub mostLikedPub = new InterPub();
            mostLikedPub.setPubNumId(resultSet.getInt("pubnumid"));
            mostLikedPub.setPubCont(resultSet.getString("pubcont"));
            mostLikedPub.setPubMg(resultSet.getInt("pubmg"));
            mostLikedPub.setPubDate(resultSet.getString("pubdate"));
            mostLikedPub.setPubHour(resultSet.getString("pubhour"));

            return mostLikedPub;
        }

    } catch (SQLException ex) {
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

    return null;
}
    
    public InterPub getLastPub() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String sql = "select * from interpub order by pubnumid desc limit 1";
        
        try {
            connection = getConnection(); // Implementa tu propio método para obtener la conexión
            if (connection == null) {
                return null;
            }

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Crear un objeto InterPub con los datos del resultado
                InterPub lastPub = new InterPub();
                lastPub.setPubNumId(resultSet.getInt("pubnumid"));
                // Añadir el resto de los campos según la estructura de tu clase InterPub

                return lastPub;
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

        return null;
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
    
public boolean updateLovePubNum( InterPub interPub )
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
            preparedStatement.setInt(1, interPub.getPubNumId());
            
            
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
        
    public boolean unLovePubNum( InterPub interPub )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interpub set pubmg = pubmg - 1 where pubnumid = ?";
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
            preparedStatement.setInt(1, interPub.getPubNumId());
            
            
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
