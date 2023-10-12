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
                user.setGender(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setPassword(rs.getString(7));
                user.setAddress(rs.getString(8));
                user.setPhone(rs.getString(9));
                user.setDob(rs.getString(10));
                user.setAvatar(rs.getString(11));
                user.setRoleId(Integer.parseInt(rs.getString(12)));
                user.setCreatedAt(rs.getString(13));
                
                // some code to finish
            }
            return user;
        } catch (SQLException e) {
            System.out.println("SQL getUserByEmailAndPassword: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getUserByEmailAndPassword: " + e.getMessage());
            return null;
        }
    }

    public User getUserByEmail(String email) {
        try {
            String strSQL = "select * from Users where email = ? ";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            rs = pstm.executeQuery();

            User user = new User();
            while (rs.next()) {
                user.setUserId(Integer.parseInt(rs.getString(1)));
                user.setStatus(rs.getString(2));
                user.setFirstName(rs.getString(3));
                user.setLastName(rs.getString(4));
                user.setGender(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setPassword(rs.getString(7));
                user.setAddress(rs.getString(8));
                user.setPhone(rs.getString(9));
                user.setDob(rs.getString(10));
                user.setAvatar(rs.getString(11));
                user.setRoleId(Integer.parseInt(rs.getString(12)));
                user.setCreatedAt(rs.getString(13));
                // some code to finish

            }
            return user;
        } catch (SQLException e) {
            System.out.println("SQL getUserByEmail: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getUserByEmail: " + e.getMessage());
            return null;
        }
    }

    public User checkEmailExist(String newEmail) {
        try {
            String strSQL = "select * from Users where email = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, newEmail);
            rs = pstm.executeQuery();
            User user = new User();;
            while (rs.next()) {
                user.setUserId(Integer.parseInt(rs.getString(1)));
                user.setStatus(rs.getString(2));
                user.setFirstName(rs.getString(3));
                user.setLastName(rs.getString(4));
                user.setGender(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setPassword(rs.getString(7));
                user.setAddress(rs.getString(8));
                user.setPhone(rs.getString(9));
                user.setDob(rs.getString(10));
                user.setAvatar(rs.getString(11));
                user.setRoleId(Integer.parseInt(rs.getString(12)));
                user.setCreatedAt(rs.getString(13));
            }
            return user;
        } catch (SQLException e) {
            System.out.println("SQL checkEmailExist: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("checkEmailExist: " + e.getMessage());
            return null;
        }
    }

    public void addNewAccountByEmail(User user) {
        try {
            String strSQL = "insert into Users (firstName, lastName, email, password, address, phone, dob, status, avatar, RoleId, createdAt)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE())";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, user.getFirstName());
            pstm.setString(2, user.getLastName());
            pstm.setString(3, user.getEmail());
            pstm.setString(4, user.getPassword());
            pstm.setString(5, user.getAddress());
            pstm.setString(6, user.getPhone());
            pstm.setString(7, user.getDob());
            pstm.setString(8, user.getStatus());
            pstm.setString(9, user.getAvatar());
            pstm.setString(10, String.valueOf(user.getRoleId()));

            pstm.execute();

        } catch (SQLException e) {
            System.out.println("SQL addNewAccountByEmail: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("addNewAccountByEmail: " + e.getMessage());
        }
    }

    public void updatePasswordByEmail(User user) {
        try {
            String strSQL = "update Users set password = ? where email = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, user.getPassword());
            pstm.setString(2, user.getEmail());
            rs = pstm.executeQuery();

        } catch (SQLException e) {
            System.out.println("SQL updatePasswordByEmail: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("updatePasswordByEmail: " + e.getMessage());
        }
    }

    public void updateProfile(String fName, String lName, String phone, String address, String dob, String avatar, String email) {
        try {
            String strSQL = "update Users\n"
                    + "set firstName = ? , lastName = ? , phone = ? , address = ? , dob = ? , avatar = ?\n"
                    + "where email = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, fName);
            pstm.setString(2, lName);
            pstm.setString(3, phone);
            pstm.setString(4, address);
            pstm.setString(5, dob);
            pstm.setString(6, avatar);
            pstm.setString(7, email);

            pstm.execute();
            System.out.println("Update Successfully");

        } catch (SQLException e) {
            System.out.println("SQL updateProfile: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("updateProfile: " + e.getMessage());
        }
    }


    public void addNewAccountByGoogle(User user) {
        try {
            String strSQL = "insert into Users (status, firstName, lastName, email, avatar, RoleId, createdAt) values (?, ?, ?, ?, ?, ?, GETDATE())";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, user.getStatus());
            pstm.setString(2, user.getFirstName());
            pstm.setString(3, user.getLastName());
            pstm.setString(4, user.getEmail());
            pstm.setString(5, user.getAvatar());
            pstm.setString(6, String.valueOf(user.getRoleId()));

            pstm.execute();

        } catch (SQLException e) {
            System.out.println("SQL addNewAccountByGoogle: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("addNewAccountByGoogle: " + e.getMessage());
        }
    }

    public ArrayList<User> getListUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String strSQL = "select * from Users";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(Integer.parseInt(rs.getString(1)));
                user.setStatus(rs.getString(2));
                user.setFirstName(rs.getString(3));
                user.setLastName(rs.getString(4));
                user.setGender(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setPassword(rs.getString(7));
                user.setAddress(rs.getString(8));
                user.setPhone(rs.getString(9));
                user.setDob(rs.getString(10));
                user.setAvatar(rs.getString(11));
                user.setRoleId(Integer.parseInt(rs.getString(12)));
                user.setCreatedAt(rs.getString(13));

                // some code to finish
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("SQL getListUser: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getListUser: " + e.getMessage());
            return null;
        }
    }
    
    public ArrayList<User> getListUserByName(String username) {
        DAOUser daoUser = new DAOUser();
        ArrayList<User> listUserRaw = daoUser.getListUser();
        ArrayList<User> listUser = new ArrayList<>();
        for (User user : listUserRaw) {
            String name = user.getLastName() + " " + user.getFirstName();
            if(name.toLowerCase().contains(username.toLowerCase().trim())) {
                listUser.add(user);
            }
        }
        return listUser;
    }
    

}
//include jsp//
