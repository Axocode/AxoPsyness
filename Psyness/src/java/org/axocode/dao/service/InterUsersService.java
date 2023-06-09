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
            resultSet = statement.executeQuery("select * from interusers");
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
                users.setIUserSeguidores(resultSet.getInt(7));
                users.setIUserSeguidos(resultSet.getInt(8));
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
            String query = "select * from interusers where iuser = ? and ipassword = ?";
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


public boolean modificarUsuario(int IUserNum, String nuevoNombre, String nuevaEdad) {
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement("update interusers set iuser = ?, iage = ? where iusernum = ?")) {
        
        statement.setString(1, nuevoNombre);
        statement.setString(2, nuevaEdad);
        statement.setInt(3, IUserNum);

        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("El usuario ha sido modificado exitosamente.");
            return true;
        } else {
            System.out.println("No se encontró el usuario con el número " + IUserNum);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return false;
}

    public boolean verificarUserExistente(String IUser) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
       
        connection = getConnection();
        
        String query = "select count(*) from interusers where iuser = ?";
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
            String sql = "select interusers.* " +
                         "from interusers " +
                         "inner join interuserspub on interusers.iusernum = interuserspub.iusernum " +
                         "where interuserspub.pubnumid = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, pubNumId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // Obtener los datos del resultado y construir un objeto InterUsers
                        int IUserNum = resultSet.getInt("iusernum");
                        String IUser = resultSet.getString("iuser");
                        String IAge = resultSet.getString("iage");
                        String IEmail = resultSet.getString("iemail");
                        String IPassword = resultSet.getString("ipassword");
                        String IImgNum = resultSet.getString("iimgnum");
                        int IUserSeguidores = resultSet.getInt("iuserseguidores");
                        int IUserSeguidos = resultSet.getInt("iuserseguidos");

                        interUsers = new InterUsers(IUserNum, IUser, IAge, IEmail, IPassword, IImgNum, IUserSeguidores, IUserSeguidos);
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
        String sql = "insert into interusers( iuser , iage , iemail , ipassword ) values( ? , ? , ? , ? )";
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
    
    
public List<InterUsers> getInterUsersByFollow(int pubNumId) {
    List<InterUsers> interUsersList = new ArrayList<>();

    try (Connection connection = getConnection()) {
        String sql = "select interusers.iuser, interusers.iusernum, interusers.iage, interusers.iemail, interusers.ipassword, " +
                     "interusers.iimgnum, interusers.iuserseguidores, interusers.iuserseguidos " +
                     "from interusers " +
                     "inner join interflow on interusers.iusernum = interflow.flowseguidoid " +
                     "where interflow.flowseguidoresid = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, pubNumId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int IUserNum = resultSet.getInt("iusernum");
                    String IUser = resultSet.getString("iuser");
                    String IAge = resultSet.getString("iage");
                    String IEmail = resultSet.getString("iemail");
                    String IPassword = resultSet.getString("ipassword");
                    String IImgNum = resultSet.getString("iimgnum");
                    int IUserSeguidores = resultSet.getInt("iuserseguidores");
                    int IUserSeguidos = resultSet.getInt("iuserseguidos");

                    InterUsers interUsers = new InterUsers(IUserNum, IUser, IAge, IEmail, IPassword, IImgNum, IUserSeguidores, IUserSeguidos);
                    interUsersList.add(interUsers);
                }
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return interUsersList;
}

public List<InterUsers> getInterUsersByFollower(int IUserNum) {
    List<InterUsers> userList = new ArrayList<>();

    try (Connection connection = getConnection()) {
        String sql = "select interusers.iuser, interusers.iusernum, interusers.iage, interusers.iemail, " +
                     "interusers.ipassword, interusers.iimgnum, interusers.iuserseguidores, interusers.iuserseguidos " +
                     "from interusers " +
                     "inner join interflow on interusers.iusernum = interflow.flowseguidoresid " +
                     "where interflow.flowseguidoid = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, IUserNum);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int userNum = resultSet.getInt("iusernum");
                    String user = resultSet.getString("iuser");
                    String age = resultSet.getString("iage");
                    String email = resultSet.getString("iemail");
                    String password = resultSet.getString("ipassword");
                    String imgNum = resultSet.getString("iimgnum");
                    int userSeguidores = resultSet.getInt("iuserseguidores");
                    int userSeguidos = resultSet.getInt("iuserseguidos");

                    InterUsers interUsers = new InterUsers(userNum, user, age, email, password, imgNum, userSeguidores, userSeguidos);
                    userList.add(interUsers);
                }
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return userList;
}


    
    public boolean updateUsers( InterUsers users )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interusers set iimgnum where iusernum = ?";
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
        String sql = "delete from interusers where iusernum = ?";
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
        
        preparedStatement = connection.prepareStatement("select * from interusers where iuser = ?");
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
            aux.setIUserSeguidores(resultSet.getInt(7));
            aux.setIUserSeguidos(resultSet.getInt(8));
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
        
        preparedStatement = connection.prepareStatement("select * from interusers where iusernum = ?");
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
            aux.setIUserSeguidores(resultSet.getInt(7));
            aux.setIUserSeguidos(resultSet.getInt(8));
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
        String sql = "update interusers set iimgnum = ? where iusernum = ?";
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


    public boolean updateFlowSeguidoresNum( InterUsers interUsers )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interusers set iuserseguidores = iuserseguidores + 1 where iusernum = ?";
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
            preparedStatement.setInt(1, interUsers.getIUserNum());
            
            
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


        public boolean updateFlowSeguidoNum( InterUsers interUsers )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interusers set iuserseguidos = iuserseguidos + 1 where iusernum = ?";
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
            preparedStatement.setInt(1, interUsers.getIUserNum());
            
            
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
        
        
            public boolean unFlowSeguidoresNum( InterUsers interUsers )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interusers set iuserseguidores = iuserseguidores - 1 where iusernum = ?";
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
            preparedStatement.setInt(1, interUsers.getIUserNum());
            
            
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


        public boolean unFlowSeguidoNum( InterUsers interUsers )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update interusers set iuserseguidos = iuserseguidos - 1 where iusernum = ?";
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
            preparedStatement.setInt(1, interUsers.getIUserNum());
            
            
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
