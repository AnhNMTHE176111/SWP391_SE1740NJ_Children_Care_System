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
import model.Booking;
import model.Customer;

public class DAOBooking extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOBooking() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public ArrayList<Booking> getListDate() {
        ArrayList<Booking> data = new ArrayList<Booking>();
        try {
            String strSQL = "SELECT Days.DayDate, Slots.StartTime\n"
                    + "FROM Days\n"
                    + "join SlotDoctor on SlotDoctor.DayId = Days.DayId\n"
                    + "join Slots on SlotDoctor.SlotId = Slots.SlotId\n"
                    + "where SlotDoctor.DoctorId = 1";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String day = rs.getString(1);
                String slot = rs.getString(2);

                Booking booking = new Booking();
                data.add(booking);
            }
        } catch (Exception e) {
            System.out.println("getListCustomers: " + e.getMessage());
        }
        return data;
    }

    public List<Booking> getListCusReservation(int cusId, int pageIndex) {
        ArrayList<Booking> listCustReservation = new ArrayList<Booking>();
        try {
            String strSQL = "SELECT\n"
                    + "  b.*,\n"
                    + "  m.Diagnosis,\n"
                    + "  CONCAT(u.firstName, ' ', u.lastName) AS fullName,\n"
                    + "  s.StartTime,\n"
                    + "  s.EndTime\n"
                    + "FROM Booking b\n"
                    + "JOIN MedicalInfo m ON b.MedicalInfoId = m.MedicalInfoId\n"
                    + "JOIN Doctors d ON b.slotDoctorId = d.DoctorId\n"
                    + "JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "JOIN Slots s ON sd.SlotId = s.SlotId\n"
                    + "JOIN Users u ON d.userId = u.userId\n"
                    + "WHERE b.CustomerId = '"+cusId+"'\n"
                    + "ORDER BY b.CustomerId\n"
                    + "OFFSET ? ROWS FETCH NEXT 2 ROWS ONLY";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, (pageIndex - 1) * 2);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String BookingId = String.valueOf(rs.getInt(1));
                String BookingStatus = String.valueOf(rs.getInt(2));
                String CustomerID = String.valueOf(rs.getInt(3));
                String Symptomps = rs.getString(7);
                String BookingDate = String.valueOf(rs.getDate(9));
                String BookingTime = String.valueOf("From " + rs.getTime(9) + " to " + rs.getTime(10));
                String DoctorName = rs.getString(8);
                String CreateDate = String.valueOf(rs.getDate(6));
                String CreateTime = String.valueOf(rs.getTime(6));
                Booking cusBooking = new Booking(BookingId, BookingStatus, CustomerID, Symptomps, BookingDate, BookingTime, DoctorName, CreateDate, CreateTime);
                listCustReservation.add(cusBooking);
            }
        } catch (Exception e) {
            System.out.println("getListCusReservation: " + e.getMessage());
        }
        return listCustReservation;
    }

    public int getTotalCusReservation(int cusId) {
        try {
            String strSQL = "SELECT COUNT(*) AS total_rows\n"
                    + "FROM Booking b\n"
                    + "JOIN MedicalInfo m ON b.MedicalInfoId = m.MedicalInfoId\n"
                    + "JOIN Doctors d ON b.slotDoctorId = d.DoctorId\n"
                    + "JOIN Users u ON d.userId = u.userId\n"
                    + "WHERE b.CustomerId = '" + cusId + "'";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

                // some code to finish
            }
        } catch (SQLException e) {
            System.out.println("SQL getUserByEmailAndPassword: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("getUserByEmailAndPassword: " + e.getMessage());
        }
        return 0;
    }
}
