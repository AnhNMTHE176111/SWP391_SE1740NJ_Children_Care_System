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
                user.setUserId(Integer.parseInt(rs.getString(1)));
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

    public User getUserByEmailAndPassword(String email, String password) {
        try {
            String strSQL = "select * from Users where email = ? and password = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            
            User user = new User();
            while (rs.next()) {
                user.setUserId(Integer.parseInt(rs.getString(1)));
                user.setStatus(rs.getString(2));
                user.setFirstName(rs.getString(3));
                user.setLastName(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setPassword(rs.getString(6));
                user.setAddress(rs.getString(7));
                user.setPhone(rs.getString(8));
                user.setDob(rs.getString(9));
                user.setAvatar(rs.getString(10));
                user.setRoleId(Integer.parseInt(rs.getString(11)));
                // some code to finish
            }
            System.out.println("user.email " + user.getEmail() + " login to system");

            return user;
        } catch (SQLException e) {
            System.out.println("SQL getUserByEmailAndPassword: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getUserByEmailAndPassword: " + e.getMessage());
            return null;
        }
    }
}
//include jsp//