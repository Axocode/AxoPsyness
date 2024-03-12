package org.axocode.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.axocode.dao.InterTagPub;
import org.axocode.dao.InterTagPub;

public class InterTagPubService extends Conexion<InterTagPub>{
    public boolean addInterTagPub( InterTagPub users ){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into intertagpub( tagpub, tagpubsensible, tagpubautoestima , tagpubrelaciones, tagpubansiedad, tagpubdepresion, tagpubconflictos, tagpubbienestar, tagpubcrecimiento, tagpubsalud, tagpubtranstornos, tagpubrecaidas, tagpubsueno ) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
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
            preparedStatement.setInt(1, users.getTagPub());
            preparedStatement.setInt(2, users.getTagPubSensible());
            preparedStatement.setInt(3, users.getTagPubAutoestima());
            preparedStatement.setInt(4, users.getTagPubRelaciones());
            preparedStatement.setInt(5, users.getTagPubAnsiedad());
            preparedStatement.setInt(6, users.getTagPubDepresion());
            preparedStatement.setInt(7, users.getTagPubConflictos());
            preparedStatement.setInt(8, users.getTagPubBienestar());
            preparedStatement.setInt(9, users.getTagPubCrecimiento());
            preparedStatement.setInt(10, users.getTagPubSalud());
            preparedStatement.setInt(11, users.getTagPubTranstornos());
            preparedStatement.setInt(12, users.getTagPubRecaidas());
            preparedStatement.setInt(13, users.getTagPubSueno());

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
