/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author dmx
 */
public class DAOCustomer extends DBContext{
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOCustomer() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
    

    
    
    
   public int addCustomer(int userId) {
    int generatedId = -1;
    try {
        String strSQL = "INSERT INTO Customers(UserId) VALUES(?);";
        pstm = cnn.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
        pstm.setInt(1, userId);

        int affectedRows = pstm.executeUpdate();

        if (affectedRows > 0) {
            try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return generatedId;
}

}

