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
                try ( ResultSet generatedKeys = pstm.getGeneratedKeys()) {
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

    public Customer getCusBookingInforByBookId(String bookingId) {
        Customer customer = null; // Khởi tạo đối tượng Customer
        try {
            String strSQL = "SELECT  \n"
                    + "	u.firstName,\n"
                    + "	u.lastName,\n"
                    + "	u.gender,\n"
                    + "	u.phone,\n"
                    + "	u.email,\n"
                    + "	b.BookingCreatedAt,\n"
                    + "	s.StartTime,\n"
                    + "	s.EndTime,\n"
                    + "	m.Diagnosis,\n"
                    + "	b.BookingStatus\n"
                    + "FROM Customers c\n"
                    + "JOIN Users u ON c.UserId = u.userId\n"
                    + "JOIN Booking b ON c.Id = b.CustomerID\n"
                    + "JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "JOIN Slots s ON sd.SlotId = s.SlotId\n"
                    + "JOIN MedicalInfo m ON b.MedicalInfoId = m.MedicalInfoId\n"
                    + "WHERE b.BookingId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, bookingId);
            rs = pstm.executeQuery();

            if (rs.next()) {
                String firstName = rs.getString(1);
                String lastName = rs.getString(2);
                String gender = rs.getString(3);
                String phone = rs.getString(4);
                String email = rs.getString(5);
                String diagnosis = rs.getString(9);
                String reservationDate = String.valueOf(rs.getDate(6) + " " + rs.getTime(6));
                String timeCheckUp = String.valueOf(rs.getDate(7) + " " + rs.getTime(7));
                String status = rs.getString(10);
                customer = new Customer(firstName, lastName, gender, phone, email, reservationDate, timeCheckUp, diagnosis, status);
            }
        } catch (SQLException e) {
            System.out.println("SQL getCusBookingInforByBookId: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("getCusBookingInforByBookId: " + e.getMessage());
        } 
        return customer;
    }

}
