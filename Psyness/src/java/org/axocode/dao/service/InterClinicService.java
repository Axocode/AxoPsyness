package org.axocode.dao.service;

import com.sun.jdi.connect.spi.Connection;
import org.axocode.dao.InterClinic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

}
