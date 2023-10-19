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

import java.sql.Statement;

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
            String strSQL = "select * from Users where userId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, id);
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
                user.setEmail(rs.getString(6));
                user.setPassword(rs.getString(7));
                user.setAddress(rs.getString(8));
                user.setPhone(rs.getString(9));
                user.setDob(rs.getString(10));
                user.setAvatar(rs.getString(11));
                user.setRoleId(Integer.parseInt(rs.getString(12)));

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


    public int addGuess(String firstName, String lastName, String gender, String email, String phone, String dob, int roleId) {
        int generatedId = -1;
        try {
            String strSQL = "insert into Users(firstName, lastName, gender, email, phone, dob, roleId) values(?,?,?,?,?,?,?); SELECT SCOPE_IDENTITY();";

            pstm = cnn.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);

            pstm.setString(1, firstName);
            pstm.setString(2, lastName);
            pstm.setString(3, gender);
            pstm.setString(4, email);
            pstm.setString(5, phone);
            pstm.setString(6, dob);
            pstm.setInt(7, roleId);

            if (pstm.executeUpdate() > 0) {
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
            if (name.toLowerCase().contains(username.toLowerCase().trim())) {
                listUser.add(user);
            }
        }
        return listUser;
    }

    public ArrayList<User> filterUser(String address, String phone, String dobFrom, String dobTo, String createdFrom, String createdTo, String roleid, String status, String gender) {
        DAOUser daoUser = new DAOUser();

        if (dobFrom.equalsIgnoreCase("")) {
            dobFrom = "0001-01-01";
        }
        if (dobTo.equalsIgnoreCase("")) {
            dobTo = "9999-12-31";
        }
        if (createdFrom.equalsIgnoreCase("")) {
            createdFrom = "0001-01-01";
        }
        if (createdTo.equalsIgnoreCase("")) {
            createdTo = "9999-12-31";
        }

        ArrayList<User> dataRaw = new ArrayList<>();
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String strSQL = "select * from Users \n"
                    + "where RoleId like ? \n"
                    + "	and status like ? \n"
                    + "	and gender like ? \n"
                    + "	and dob between ? and ? \n"
                    + "	and createdAt between ? and ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, "%" + roleid + "%");
            pstm.setString(2, "%" + status + "%");
            pstm.setString(3, "%" + gender + "%");
            pstm.setString(4, dobFrom);
            pstm.setString(5, dobTo);
            pstm.setString(6, createdFrom);
            pstm.setString(7, createdTo);
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
                dataRaw.add(user);
            }
        } catch (SQLException e) {
            System.out.println("SQL filterUser: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("filterUser: " + e.getMessage());
            return null;
        }
        if (address.length() > 0 && phone.length() > 0) {
            System.out.println("this1");
            phone = phone.replaceAll("-", "");
            address = address.replaceAll("\\s+", "").toLowerCase();
            for (User user : dataRaw) {
                if (user.getAddress().replaceAll("\\s+", "").toLowerCase().contains(address)
                        && user.getPhone().replaceAll("-", "").contains(phone)) {
                    listUser.add(user);
                }
            }
        } else if (address.length() > 0) {
            System.out.println("this2");
            address = address.replaceAll("\\s+", "").toLowerCase();
            for (User user : dataRaw) {
                if (user.getAddress().replaceAll("\\s+", "").toLowerCase().contains(address)) {
                    listUser.add(user);
                }
            }
        } else if (phone.length() > 0) {
            System.out.println("this3");
            phone = phone.replaceAll("-", "");
            for (User user : dataRaw) {
                if (user.getPhone().replaceAll("-", "").contains(phone)) {
                    listUser.add(user);
                }
            }
        } else {
            listUser.addAll(dataRaw);
        }
        System.out.println("listUser: " + listUser.size());
        System.out.println("dataraw: " + dataRaw.size());

        return listUser;
    }

    public static void main(String[] args) {
        DAOUser u = new DAOUser();
        u.filterUser("Ha Noi", "", "", "", "", "", "", "", "");
    }

    public void addNewAccountByAdmin(User user) {
        try {
            String strSQL = "insert into Users (firstName, lastName, email, password, address, phone, dob, status, avatar, RoleId, createdAt, gender)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), ?)";
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
            pstm.setString(11, user.getGender());

            pstm.execute();

        } catch (SQLException e) {
            System.out.println("SQL addNewAccountByAdmin: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("addNewAccountByAdmin: " + e.getMessage());
        }
    }

    public void deleteUserByAdmin(String userId) {
        try {
            String strSQL = "delete from Users where userId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, userId);
            pstm.execute();
        } catch (SQLException e) {
            System.out.println("SQL deleteUserByAdmin: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("deleteUserByAdmin: " + e.getMessage());
        }
    }

    public void updateProfileByAdmin(String firstName, String lastName, String address, String phone, String dob, String roleid, String status, String gender, String userId) {
        try {
            String strSQL = "update Users\n"
                    + "set firstName = ? , lastName = ? , address = ? , phone = ? ,  dob = ? , RoleId = ? , status = ? , gender = ? \n"
                    + "where userId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, firstName);
            pstm.setString(2, lastName);
            pstm.setString(3, address);
            pstm.setString(4, phone);
            pstm.setString(5, dob);
            pstm.setString(6, roleid);
            pstm.setString(7, status);
            pstm.setString(8, gender);
            pstm.setString(9, userId);

            pstm.execute();
            System.out.println("Update Successfully");

        } catch (SQLException e) {
            System.out.println("SQL updateProfileByAdmin: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("updateProfileByAdmin: " + e.getMessage());
        }
    }

}
//include jsp//
