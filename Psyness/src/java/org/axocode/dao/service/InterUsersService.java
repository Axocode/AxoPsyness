package org.axocode.dao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.axocode.dao.InterUsers;

public class InterUsersService extends Conexion<InterUsers>
{
    public List<InterUsers> getInterUsersList() 
    {
        List<InterUsers> usersList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        InterUsers users = null;

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
            resultSet = statement.executeQuery("SELECT * FROM INTERUSERS");
            if (resultSet == null) 
            {
                return null;
            }
            usersList = new ArrayList<>();
            while (resultSet.next()) 
            {
                users = new InterUsers();
                users.setIUserNum(resultSet.getInt(1));
                users.setIUser(resultSet.getString(2));
                users.setIAge(resultSet.getString(3));
                users.setIEmail(resultSet.getString(4));
                users.setIPassword(resultSet.getString(5));
                users.setIImgNum(resultSet.getString(6));
                usersList.add(users);
            }
            resultSet.close();
            closeConnection(connection);
            return usersList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    
 



    public  boolean validarCredenciales(String IUser, String IPassword) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            String query = "SELECT * FROM INTERUSERS WHERE IUSER = ? AND IPASSWORD = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, IUser);
            statement.setString(2, IPassword);
            resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
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
    
    return false;
    }




    public boolean verificarUserExistente(String IUser) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
       
        connection = getConnection();
        
        String query = "SELECT COUNT(*) FROM INTERUSERS WHERE IUSER = ?";
        statement = connection.prepareStatement(query);
        statement.setString(1, IUser);
        
        resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            if (count > 0) {
                return true;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
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
    
    return false;
    }
    
    public InterUsers getInterUsersByPubNumId(int pubNumId) {
        InterUsers interUsers = null;

        try (Connection connection = getConnection()) {
            String sql = "SELECT INTERUSERS.* " +
                         "FROM INTERUSERS " +
                         "INNER JOIN INTERUSERSPUB ON INTERUSERS.IUserNum = INTERUSERSPUB.IUserNum " +
                         "WHERE INTERUSERSPUB.PubNumId = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, pubNumId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // Obtener los datos del resultado y construir un objeto InterUsers
                        int IUserNum = resultSet.getInt("IUserNum");
                        String IUser = resultSet.getString("IUser");
                        String IAge = resultSet.getString("IAge");
                        String IEmail = resultSet.getString("IEmail");
                        String IPassword = resultSet.getString("IPassword");
                        String IImgNum = resultSet.getString("IImgNum");

                        interUsers = new InterUsers(IUserNum, IUser, IAge, IEmail, IPassword, IImgNum);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return interUsers;
    }
    
    
    public boolean addInterUsers( InterUsers users )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO INTERUSERS( IUSER , IAGE , IEMAIL , IPASSWORD ) VALUES( ? , ? , ? , ? )";
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
            preparedStatement.setString(1, users.getIUser());
            preparedStatement.setString(2, users.getIAge());
            preparedStatement.setString(3, users.getIEmail());
            preparedStatement.setString(4, users.getIPassword());

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
    
    public boolean updateUsers( InterUsers users )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update INTERUSERS SET IIMGNUM WHERE IUserNum = ?";
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
            preparedStatement.setString(1, users.getIImgNum());
            preparedStatement.setInt(2, users.getIUserNum());
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
    
    public boolean deleteUsers( InterUsers users )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM InterUsers WHERE IUserNum = ?";
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
            preparedStatement.setInt(1, users.getIUserNum());
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
    
    public InterUsers getUserByInterUsers(String IUser) {
    InterUsers aux = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        
        preparedStatement = connection.prepareStatement("SELECT * FROM INTERUSERS WHERE IUSER = ?");
        preparedStatement.setString(1, IUser);
        
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            aux = new InterUsers();
            aux.setIUserNum(resultSet.getInt(1));
            aux.setIUser(resultSet.getString(2));
            aux.setIAge(resultSet.getString(3));
            aux.setIEmail(resultSet.getString(4));
            aux.setIPassword(resultSet.getString(5));
            aux.setIImgNum(resultSet.getString(6));
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

    public InterUsers getUserByInterUsersNum(int IUserNum) {
    InterUsers aux = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        
        preparedStatement = connection.prepareStatement("SELECT * FROM INTERUSERS WHERE IUSERNUM = ?");
        preparedStatement.setInt(1, IUserNum);
        
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            aux = new InterUsers();
            aux.setIUserNum(resultSet.getInt(1));
            aux.setIUser(resultSet.getString(2));
            aux.setIAge(resultSet.getString(3));
            aux.setIEmail(resultSet.getString(4));
            aux.setIPassword(resultSet.getString(5));
            aux.setIImgNum(resultSet.getString(6));
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

        public boolean updateUsuario( InterUsers interUsers )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update INTERUSERS SET IIMGNUM = ? WHERE IUSERNUM = ?";
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
            preparedStatement.setString(1, interUsers.getIImgNum());
            preparedStatement.setInt(2, interUsers.getIUserNum());
            
            
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
