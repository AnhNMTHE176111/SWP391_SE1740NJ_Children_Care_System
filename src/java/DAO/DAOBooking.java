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
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Booking;

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
                    + "b.*,\n"
                    + "m.Diagnosis,\n"
                    + "CONCAT(u.firstName, ' ', u.lastName) AS fullName\n"
                    + "FROM Booking b\n"
                    + "JOIN MedicalInfo m ON b.MedicalInfoId = m.MedicalInfoId\n"
                    + "JOIN Doctors d ON b.slotDoctorId = d.DoctorId\n"
                    + "JOIN Users u ON d.userId = u.userId\n"
                    + "WHERE b.CustomerId = '" + cusId + "'\n"
                    + "ORDER BY b.CustomerId\n"
                    + "OFFSET ? ROWS FETCH NEXT 2 ROWS ONLY";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, (pageIndex - 1) * 2);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String BookingId = String.valueOf(rs.getInt(1));
                String BookingStatus = String.valueOf(rs.getInt(2));
                String CustomerID = String.valueOf(rs.getInt(3));
                String Symptomps = rs.getString(8);
                String BookingDate = String.valueOf(rs.getDate(5));
                String BookingTime = String.valueOf(rs.getTime(5));
                String DoctorName = rs.getString(9);
                String CreateDate = String.valueOf(rs.getDate(7));
                String CreateTime = String.valueOf(rs.getTime(7));
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
    
     public String getTotalNumberOfBooking() {
        try {
            String strSQL = "select count(BookingId) as total from Booking";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                DecimalFormat decimalFormat = new DecimalFormat("#,###");
                String formattedNumber = decimalFormat.format(total);
                return formattedNumber;
            }
        } catch (SQLException e) {
            System.out.println("SQL getTotalNumberOfBooking: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("getTotalNumberOfBooking: " + e.getMessage());
        }
        return null;
    }

    public String getTotalMoney() {
        try {
            String strSQL = "select sum(abc.Price) as total from Booking b\n"
                    + "join SlotDoctor sd \n"
                    + "on b.slotDoctorId = sd.slotDoctorId\n"
                    + "join (\n"
                    + "	select ds.DoctorId, s.ServiceId, s.Price\n"
                    + "	from DoctorServices ds\n"
                    + "	join Doctors d on ds.DoctorId = d.DoctorId\n"
                    + "	join Services s on ds.ServiceId = s.ServiceId \n"
                    + ") abc on abc.DoctorId = sd.DoctorId\n"
                    + "where b.BookingStatus = 1";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                DecimalFormat decimalFormat = new DecimalFormat("#,###");
                String formattedNumber = decimalFormat.format(total);
                return formattedNumber;
            }
        } catch (SQLException e) {
            System.out.println("SQL getTotalMoney: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("getTotalMoney: " + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        DAOBooking bookDao = new DAOBooking();
        int count = bookDao.getTotalCusReservation(0);
        System.out.println(count);
    }
}
