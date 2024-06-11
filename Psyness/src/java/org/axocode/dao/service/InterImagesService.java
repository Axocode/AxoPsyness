/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao.service;

import org.axocode.dao.InterImages;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chump
 */
public class InterImagesService extends Conexion<InterImages>{
    
    public boolean addInterImages(InterImages images) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO interimages (imagespub, images, imagesname) VALUES (?, ?, ?)";
        int row = 0;

        try {
            connection = getConnection();
            if (connection == null) {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if (preparedStatement == null) {
                return false;
            }
            preparedStatement.setInt(1, images.getImagesPubNumId());
            preparedStatement.setBytes(2, images.getImages());
            preparedStatement.setString(3, images.getImageName());

            row = preparedStatement.executeUpdate();
            closeConnection(connection);
            return row == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    closeConnection(connection);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    
    public InterImages getImageById(int imageId) {
        InterImages image = null;
        String sql = "SELECT images, imagesname FROM interimages WHERE imagespub = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, imageId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                image = new InterImages();
                image.setImages(rs.getBytes("images"));
                image.setImageName(rs.getString("imagesname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return image;
    }
    
    public boolean knowImage(int imageId) {
        String sql = "SELECT imagesname FROM interimages WHERE imagespub = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, imageId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
