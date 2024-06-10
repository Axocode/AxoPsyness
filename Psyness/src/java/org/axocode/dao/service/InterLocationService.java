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
import org.axocode.dao.InterLocation;

/**
 *
 * @author chump
 */
public class InterLocationService extends Conexion<InterLocation>{
    public List<InterLocation> findInterLocationsWithinRadius(double latitude, double longitude, double radius) {
        List<InterLocation> locationsList = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return null;
            }
            statement = connection.createStatement();
            if (statement == null) {
                return null;
            }
            resultSet = statement.executeQuery("SELECT locuser, loclatitud, loclongitud, loctoken, locmensagge FROM interlocation");
            if (resultSet == null) {
                return null;
            }
            while (resultSet.next()) {
                double userLat = resultSet.getDouble("loclatitud");
                double userLong = resultSet.getDouble("loclongitud");
                double distance = calculateDistance(latitude, longitude, userLat, userLong);
                if (distance <= radius) {
                    InterLocation location = new InterLocation();
                    location.setLocationUser(resultSet.getInt("locuser"));
                    location.setLocationLatitud(userLat);
                    location.setLocationLongitud(userLong);
                    location.setLocationMessage(resultSet.getString("locmensagge"));
                    location.setLocationToken(resultSet.getString("loctoken"));
                    locationsList.add(location);
                }
            }
            resultSet.close();
            closeConnection(connection);
            return locationsList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public void updateLocationInDatabase(InterLocation location) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql;

        try {
            connection = getConnection();
            if (connection == null) {
                return;
            }
            if (location.getLocationMessage() != null || !location.getLocationMessage().equals("")) {
                 sql = "INSERT INTO interlocation (locuser, loclatitud, loclongitud, locmensagge, loctoken) VALUES (?, ?, ?, ?, ?) " +
                         "ON DUPLICATE KEY UPDATE loclatitud = VALUES(loclatitud), loclongitud = VALUES(loclongitud), locmensagge = VALUES(locmensagge), loctoken = VALUES(loctoken)";
                 
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, location.getLocationUser());
                preparedStatement.setDouble(2, location.getLocationLatitud());
                preparedStatement.setDouble(3, location.getLocationLongitud());
                preparedStatement.setString(4, location.getLocationMessage());
                preparedStatement.setString(5, location.getLocationToken());
            } else {
             sql = "INSERT INTO interlocation (locuser, loclatitud, loclongitud, loctoken) VALUES (?, ?, ?, ?) " +
                         "ON DUPLICATE KEY UPDATE loclatitud = VALUES(loclatitud), loclongitud = VALUES(loclongitud, loctoken = VALUES(loctoken))";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, location.getLocationUser());
            preparedStatement.setDouble(2, location.getLocationLatitud());
            preparedStatement.setDouble(3, location.getLocationLongitud());
            preparedStatement.setString(4, location.getLocationToken());
            }
            preparedStatement.executeUpdate();

            preparedStatement.close();
            closeConnection(connection);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    private double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        double earthRadius = 6371e3; // en metros
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return earthRadius * c;
    }
    
    public String getSupportMessageFromDatabase(int userId) {
        String supportMessage = "";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            if (connection == null) {
                return supportMessage;
            }

            String sql = "SELECT locmensagge FROM interlocation WHERE locuser = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet != null && resultSet.next()) {
                supportMessage = resultSet.getString("locmensagge");
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
                    closeConnection(connection);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return supportMessage;
    }
}
