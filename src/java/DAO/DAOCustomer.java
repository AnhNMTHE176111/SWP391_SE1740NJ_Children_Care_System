/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            String strSQL = "SELECT Id "
                    + "FROM Customers "
                    + "WHERE UserId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, userId);
            rs = pstm.executeQuery();

            Customer customer = new Customer(); // Tạo một đối tượng Customer

            while (rs.next()) {
                customer.setId(rs.getInt(1)); // Lấy giá trị Id từ cột 1
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

}
