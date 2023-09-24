/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAO.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author dmx
 */
public class DAOUser extends DBContext {

    // copy line 21 -> 31 to every DAO - Object
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOUser() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public User getUserById(String id) {
        try {
            String strSQL = "select * from User where userId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, id);
            rs = pstm.executeQuery();

            User user = new User();
            while (rs.next()) {
                user.setUserId(1);
                // some code to finish
            }

            if (user.getUserId() != Integer.parseInt(id)) {
                return null;
            }
            return user;
        } catch (SQLException e) {
            System.out.println("SQL getUserById: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getUserById: " + e.getMessage());
            return null;
        }
    }

    public User getUser(String email, String password) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
