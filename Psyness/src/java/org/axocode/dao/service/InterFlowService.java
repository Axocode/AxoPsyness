package org.axocode.dao.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.axocode.dao.InterFlow;

public class InterFlowService extends Conexion<InterFlow>
{
    public List<InterFlow> getInterFlowList() 
    {
        List<InterFlow> flowList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        InterFlow flow = null;

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
            resultSet = statement.executeQuery("SELECT * FROM INTERFLOW");
            if (resultSet == null) 
            {
                return null;
            }
            flowList = new ArrayList<>();
            while (resultSet.next()) 
            {
                flow = new InterFlow();
                flow.setFlowSeguidoresID(resultSet.getInt(1));
                flow.setFlowSeguidorID(resultSet.getInt(2));
                
                
                flowList.add(flow);
            }
            resultSet.close();
            closeConnection(connection);
            return flowList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    
    public boolean addInterFlow( InterFlow flow )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO INTERFLOW (FLOWSEGUIDORESID, FLOWSEGUIDOID) VALUES ( ? , ? )";
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
            preparedStatement.setInt(1, flow.getFlowSeguidoresID());
            preparedStatement.setInt(2, flow.getFlowSeguidorID());

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
    
public boolean unfollowUser(InterFlow flow) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String sql = "DELETE FROM INTERFLOW WHERE FLOWSEGUIDORESID = ? AND FLOWSEGUIDOID = ?";
    int row = 0;
    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, flow.getFlowSeguidoresID());
            preparedStatement.setInt(2, flow.getFlowSeguidorID());
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

    
    
public boolean isUserFollowing(int seguidoresID, int seguidorID) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String sql = "SELECT COUNT(*) FROM INTERFLOW WHERE FLOWSEGUIDORESID = ? AND FLOWSEGUIDOID = ?";

    try {
        connection = getConnection();
        if (connection == null) {
            return false;
        }
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, seguidoresID);
        preparedStatement.setInt(2, seguidorID);
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