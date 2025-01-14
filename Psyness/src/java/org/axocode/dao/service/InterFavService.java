package org.axocode.dao.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.axocode.dao.InterFav;


public class InterFavService extends Conexion<InterFav>
{
    public List<InterFav> getInterFavList(int userId) {
    List<InterFav> favList = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }

        String sql = "select * from interfav where faviduser = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userId);
        resultSet = preparedStatement.executeQuery();

        if (resultSet == null) {
            return null;
        }

        favList = new ArrayList<>();
        while (resultSet.next()) {
            InterFav fav = new InterFav();
            fav.setFavIdPub(resultSet.getInt("favidpub"));
            fav.setFavIdUser(resultSet.getInt("faviduser"));
            favList.add(fav);
        }

        resultSet.close();
        closeConnection(connection);
        return favList;
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

    
    
    public boolean addInterFav( InterFav fav )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "insert into interfav (favidpub, faviduser) values ( ? , ? )";
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
            preparedStatement.setInt(1, fav.getFavIdPub());
            preparedStatement.setInt(2, fav.getFavIdUser());

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
    
    public boolean checkIfFavExists(InterFav fav) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }

            String sql = "select * from interfav where favidpub = ? and faviduser = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, fav.getFavIdPub());
            preparedStatement.setInt(2, fav.getFavIdUser());

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return false;
    }
    
    public boolean unfollowFav(InterFav fav) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "delete from interfav where favidpub = ? and faviduser = ?";
    int row = 0;
    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, fav.getFavIdPub());
            preparedStatement.setInt(2, fav.getFavIdUser());
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
    public List<InterFav> getFavoritedPublicationsByUser(int userNum) {
    List<InterFav> favoritedPublications = new ArrayList<>();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return favoritedPublications;
        }
        
        String sql = "select * from interfav where faviduser = ?";
        
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userNum);
        
        resultSet = preparedStatement.executeQuery();
        
        while (resultSet.next()) {
            InterFav interFav = new InterFav();
            interFav.setFavIdPub(resultSet.getInt("faviduser"));
            interFav.setFavIdUser(resultSet.getInt("favidpub"));
            
            favoritedPublications.add(interFav);
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
    
    return favoritedPublications;
}

public boolean isUserFav(int IPub, int IUser) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String sql = "select count(*) from interfav where favidpub = ? and faviduser = ?";

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