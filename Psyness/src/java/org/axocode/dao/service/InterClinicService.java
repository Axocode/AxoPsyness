package org.axocode.dao.service;

import com.sun.jdi.connect.spi.Connection;
import org.axocode.dao.InterClinic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.axocode.dao.InterFav;
import org.axocode.dao.InterLove;
import org.axocode.dao.InterUsers;

public class InterClinicService extends Conexion<InterClinic>{
    
    public boolean checkIfUserExistsInClinic(int userId) {
        java.sql.Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection(); // Asume que este método ya existe y obtiene la conexión a la base de datos
            if (connection == null) {
                return false;
            }

            // Consulta para verificar la existencia del usuario en interclinicusers
            String sql = "SELECT EXISTS(SELECT 1 FROM interclinicusers WHERE iusernum = ?) AS UserExists";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();

            // El resultado es un único valor booleano que indica si el usuario existe o no
            if (resultSet.next()) {
                return resultSet.getBoolean("UserExists");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Asegúrate de cerrar todos los recursos utilizados
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

        return false;
    }
    
    
    public String checkUserRol(Integer userId, int clinic) {
        java.sql.Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            String query = "SELECT rol FROM interclinicusers WHERE iusernum = ? AND clinicnum = ? ";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, clinic);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("rol"); 
            } else {
                return null;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null; // Retorna null en caso de excepción
        } finally {
            // Asegúrate de cerrar todos los recursos utilizados
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public int getkClinicNumByUserId(Integer userId) {
        java.sql.Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return 0;
            }
            String query = " SELECT clinicnum FROM interclinic WHERE clinicuser = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("clinicnum");
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            // Asegúrate de cerrar todos los recursos utilizados
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

       
    public boolean checkIfUserWithInClinic(int userId) {
        java.sql.Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            String sql = "SELECT EXISTS(SELECT 1 FROM interclinic WHERE clinicuser = ?) AS UserExists";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();

            // El resultado es un único valor booleano que indica si el usuario existe o no
            if (resultSet.next()) {
                return resultSet.getBoolean("UserExists");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Asegúrate de cerrar todos los recursos utilizados
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

        return false;
    }
    
    public  boolean validarExistencia(int IUser, int Clinica) {
        java.sql.Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            String query = "select * from interclinicusers where iusernum = ? and clinicnum = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, IUser);
            statement.setInt(2, Clinica);
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
    
    
    public boolean modificarUsuarioClinica(int IUserNum, String nuevoRol) {
        try (java.sql.Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("update interclinicusers set rol = ? where iusernum = ?")) {

            statement.setString(1, nuevoRol);
            statement.setInt(2, IUserNum);

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
    
    public boolean eliminarUsuarioClinica(int IUserNum) {
        try (java.sql.Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM interclinicusers WHERE iusernum = ?")) {

            statement.setInt(1, IUserNum);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("El usuario con el número " + IUserNum + " ha sido eliminado exitosamente.");
                return true;
            } else {
                System.out.println("No se encontró el usuario con el número " + IUserNum + " para eliminar.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean agregarUsuarioClinica(int IUserNum, int clinicNum, String rol) {
        try (java.sql.Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO interclinicusers (iusernum, clinicnum, rol) VALUES (?, ?, ?)")) {

            statement.setInt(1, IUserNum);
            statement.setInt(2, clinicNum);
            statement.setString(3, rol);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("El usuario ha sido agregado exitosamente a la clínica.");
                return true;
            } else {
                System.out.println("No se pudo agregar el usuario a la clínica.");
            }
        } catch (SQLException e) {
            System.out.println("Ocurrió un error al intentar agregar el usuario a la clínica.");
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean verificarUserExistente(String IUser) {
        java.sql.Connection connection = null;
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
}
