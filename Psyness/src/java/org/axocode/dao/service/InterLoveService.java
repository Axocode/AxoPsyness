/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.axocode.dao.InterFav;
import org.axocode.dao.InterLove;

/**
 *
 * @author chump
 */
public class InterLoveService extends Conexion<InterLove> {
    
    
        public List<InterLove> getInterLoveList(int userId) {
    List<InterLove> loveList = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }

        String sql = "select * from interlove where loveiduser = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userId);
        resultSet = preparedStatement.executeQuery();

        if (resultSet == null) {
            return null;
        }

        loveList = new ArrayList<>();
        while (resultSet.next()) {
            InterLove love = new InterLove();
            love.setLoveIdPub(resultSet.getInt("favidpub"));
            love.setLoveIdUser(resultSet.getInt("faviduser"));
            loveList.add(love);
        }

        resultSet.close();
        closeConnection(connection);
        return loveList;
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

    
    
    public boolean addInterLove( InterLove love )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into interlove (loveidpub, loveiduser) values ( ? , ? )";
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
            preparedStatement.setInt(1, love.getLoveIdPub());
            preparedStatement.setInt(2, love.getLoveIdUser());

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
    
    public boolean checkIfLoveExists(InterLove love) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }

            String sql = "select * from interlove where loveidpub = ? and loveiduser = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, love.getLoveIdPub());
            preparedStatement.setInt(2, love.getLoveIdUser());

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return false;
    }
    
    public boolean unfollowLove(InterLove love) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "delete from interlove where loveidpub = ? and loveiduser = ?";
    int row = 0;
    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, love.getLoveIdPub());
            preparedStatement.setInt(2, love.getLoveIdUser());
        row = preparedStatement.executeUpdate();
        closeConnection(connection);
        return row > 0;
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return false;
}
    public List<InterLove> getLovePublicationsByUser(int userNum) {
    List<InterLove> lovePublications = new ArrayList<>();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return lovePublications;
        }
        
        String sql = "select * from interlove where loveiduser = ?";
        
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userNum);
        
        resultSet = preparedStatement.executeQuery();
        
        while (resultSet.next()) {
            InterLove interLove = new InterLove();
            interLove.setLoveIdPub(resultSet.getInt("loveiduser"));
            interLove.setLoveIdUser(resultSet.getInt("loveidpub"));
            
            lovePublications.add(interLove);
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
    
    return lovePublications;
}

public boolean isUserLove(int IPub, int IUser) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String sql = "select count(*) from interlove where loveidpub = ? and loveiduser = ?";

    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, IPub);
        preparedStatement.setInt(2, IUser);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            return count > 0;
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return false;
}

}
