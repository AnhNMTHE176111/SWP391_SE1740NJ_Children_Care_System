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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.User;


/**
 *
 * @author dmx
 */
public class DAOCustomer extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOCustomer() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public Customer getCusIdByUserId(int userId) {
        try {
            String strSQL = "SELECT * "
                    + "FROM Customers "
                    + "WHERE UserId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, userId);
            rs = pstm.executeQuery();

            Customer customer = new Customer();

            while (rs.next()) {
                customer.setId(rs.getInt(1));
                customer.setUserId(rs.getInt(2));
            }
            return customer;
        } catch (SQLException e) {
            System.out.println("SQL getCusIdByUserId: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getCusIdByUserId: " + e.getMessage());
            return null;
        }
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

