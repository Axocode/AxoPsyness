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
                users.setIRol(resultSet.getString(6));
                users.setIImgNum(resultSet.getString(7));
                users.setIUserSeguidores(resultSet.getInt(8));
                users.setIUserSeguidos(resultSet.getInt(9));
                users.setIUserDescription(resultSet.getString(10));
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
    
    public List<InterUsers> getInterUsersListByTerm(String searchTerm) {
    List<InterUsers> usersList = new ArrayList<>();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    InterUsers users = null;

    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        String query = "select * from interusers where iuser like ? limit 10";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, "%" + searchTerm + "%");
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            users = new InterUsers();
                users.setIUserNum(resultSet.getInt(1));
                users.setIUser(resultSet.getString(2));
                users.setIAge(resultSet.getString(3));
                users.setIEmail(resultSet.getString(4));
                users.setIPassword(resultSet.getString(5));
                users.setIRol(resultSet.getString(6));
                users.setIImgNum(resultSet.getString(7));
                users.setIUserSeguidores(resultSet.getInt(8));
                users.setIUserSeguidos(resultSet.getInt(9));
                usersList.add(users);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        return null;
    } finally {
        // Cerrar los recursos en un bloque finally
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return usersList;
}
    
    public List<InterUsers> getInterUsersMoreFav() {
    List<InterUsers> usersList = new ArrayList<>();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    InterUsers users = null;

    try {
        connection = getConnection();
        if (connection == null) {
            return null;
        }
        // Consulta para obtener los 5 usuarios con más seguidores
        String query = "select * from interusers order by iuserseguidores desc limit 5";
        preparedStatement = connection.prepareStatement(query);
        
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            users = new InterUsers();
            users.setIUserNum(resultSet.getInt("iusernum"));
            users.setIUser(resultSet.getString("iuser"));
            users.setIAge(resultSet.getString("iage"));
            users.setIEmail(resultSet.getString("iemail"));
            users.setIPassword(resultSet.getString("ipassword"));
            users.setIRol(resultSet.getString("irol"));
            users.setIImgNum(resultSet.getString("iimgnum"));
            users.setIUserSeguidores(resultSet.getInt("iuserseguidores"));
            users.setIUserSeguidos(resultSet.getInt("iuserseguidos"));
            usersList.add(users);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        return null;
    } finally {
        // Cerrar los recursos en un bloque finally
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return usersList;
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


public boolean modificarUsuario(int IUserNum, String nuevoNombre, String nuevaEdad, String nuevaDescripcion) {
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement("update interusers set iuser = ?, iage = ?, iuserdescription = ? where iusernum = ?")) {
        
        statement.setString(1, nuevoNombre);
        statement.setString(2, nuevaEdad);
        statement.setString(3, nuevaDescripcion);
        statement.setInt(4, IUserNum);

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
                        String IRol = resultSet.getString("irol");
                        String IImgNum = resultSet.getString("iimgnum");
                        int IUserSeguidores = resultSet.getInt("iuserseguidores");
                        int IUserSeguidos = resultSet.getInt("iuserseguidos");
                        String IUserDescripion = resultSet.getString("iuserdescription");

                        interUsers = new InterUsers(IUserNum, IUser, IAge, IEmail, IPassword, IImgNum, IRol, IUserSeguidores, IUserSeguidos, IUserDescripion);
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
        String sql = "insert into interusers( iuser , iage , iemail , ipassword, irol ) values( ? , ? , ? , ? , ?)";
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
            preparedStatement.setString(5, users.getIRol());

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
                     "interusers.iimgnum, interusers.irol, interusers.iuserseguidores, interusers.iuserseguidos, interusers.iuserdescription " +
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
                    String IRol = resultSet.getString("irol");
                    int userSeguidores = resultSet.getInt("iuserseguidores");
                    int userSeguidos = resultSet.getInt("iuserseguidos");
                    String IUserDescripion = resultSet.getString("iuserdescription");

                    InterUsers interUsers = new InterUsers(IUserNum, IUser,IAge, IEmail, IPassword, IImgNum, IRol, userSeguidores, userSeguidos, IUserDescripion);
                    interUsersList.add(interUsers);
                }
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return interUsersList;
}

public List<InterUsers> getInterUsersByFollower(int ipubnumid) {
    List<InterUsers> userList = new ArrayList<>();

    try (Connection connection = getConnection()) {
        String sql = "select interusers.iuser, interusers.iusernum, interusers.iage, interusers.iemail, " +
                     "interusers.ipassword, interusers.irol, interusers.iimgnum, interusers.iuserseguidores, interusers.iuserseguidos, interusers.iuserdescription " +
                     "from interusers " +
                     "inner join interflow on interusers.iusernum = interflow.flowseguidoresid " +
                     "where interflow.flowseguidoid = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, ipubnumid);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int IUserNum = resultSet.getInt("iusernum");
                    String IUser = resultSet.getString("iuser");
                    String IAge = resultSet.getString("iage");
                    String IEmail = resultSet.getString("iemail");
                    String IPassword = resultSet.getString("ipassword");
                    String IImgNum = resultSet.getString("iimgnum");
                    String IRol = resultSet.getString("irol");
                    int userSeguidores = resultSet.getInt("iuserseguidores");
                    int userSeguidos = resultSet.getInt("iuserseguidos");
                    String IUserDescripion = resultSet.getString("iuserdescription");

                    InterUsers interUsers = new InterUsers(IUserNum, IUser,IAge, IEmail, IPassword, IImgNum, IRol, userSeguidores, userSeguidos, IUserDescripion);
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
            aux.setIRol(resultSet.getString(6));
            aux.setIImgNum(resultSet.getString(7));
            aux.setIUserSeguidores(resultSet.getInt(8));
            aux.setIUserSeguidos(resultSet.getInt(9));
            aux.setIUserDescription(resultSet.getString(10));
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
            aux.setIRol(resultSet.getString(6));
            aux.setIImgNum(resultSet.getString(7));
            aux.setIUserSeguidores(resultSet.getInt(8));
            aux.setIUserSeguidos(resultSet.getInt(9));
            aux.setIUserDescription(resultSet.getString(10));
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

       
        
        
            public boolean actSeguidores(int seguidores) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "update interusers SET iuserseguidores = (select count(*) from interflow where flowseguidoresid = ?) where iusernum = ?";

    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, seguidores); // ID del usuario para contar los seguidores
        preparedStatement.setInt(2, seguidores); // ID del usuario para actualizar en interusers

        int row = preparedStatement.executeUpdate();
        closeConnection(connection);
        return row == 1;
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
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

    return false;
}



        public boolean actSeguidos(int seguido) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "update interusers set iuserseguidos = (select count(*) from interflow where flowseguidoid = ?) where iusernum = ?";

    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, seguido); // ID del usuario para contar los seguido
        preparedStatement.setInt(2, seguido); // ID del usuario para actualizar en interusers

        int row = preparedStatement.executeUpdate();
        closeConnection(connection);
        return row == 1;
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
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

    return false;
}
        
}
