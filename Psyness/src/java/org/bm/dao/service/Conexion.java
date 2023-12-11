/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.bm.dao.service;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Evelyn
 */
public class Conexion <T> implements Serializable

{
    public static String user = "root";
    public static String password = "123";
    public static String db = "KidTaleDB";
    public static String port = "3306";

    public boolean testDriver() 
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            return true;
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }

    public Connection getConnection(String user, String password, String db, String server) 
    {
        String url = null;
        if (user == null || password == null || db == null || server == null) {
            return null;
        }
        if ("".equals(user) || "".equals(password) || "".equals(db) || "".equals(server)) 
        {
            return null;
        }
        url = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", server, port, db, user, password);
        try 
        {
            if (!testDriver()) 
            {
                return null;
            }
            return DriverManager.getConnection(url);
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }

    public Connection getConnection() 
    {
        return getConnection(user, password, db, "127.0.0.1");
    }

    public void closeConnection(Connection connection) 
    {
        try {
            if (connection == null) 
            {
                return;
            }
            if (connection.isClosed()) 
            {
                return;
            }
            connection.close();
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
    }
    
     public Date dateSql2DateUtil( java.sql.Date date )
    {
        return new Date( date.getTime( ) );
    }
    
    public java.sql.Date dateUtil2DateSql( Date date )
    {
        return new java.sql.Date( date.getTime( ) );
    }
    
    
    
}

