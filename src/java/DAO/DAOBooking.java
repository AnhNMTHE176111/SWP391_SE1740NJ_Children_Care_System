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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

    public int addBooking(int status, int customerId, int slotDoctorId) {
        int generatedId = -1;
        try {
            String strSQL = "insert into Booking(BookingStatus, CustomerID, slotDoctorId) values(?,?,?); SELECT SCOPE_IDENTITY();";

            pstm = cnn.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);

            pstm.setInt(1, status);
            pstm.setInt(2, customerId);
            pstm.setInt(3, slotDoctorId);

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

    public List<Booking> getBookingList() {
        List<Booking> bookings = new ArrayList<>();
        String strSQL = "select BookingId, BookingStatus, day from Booking\n"
                + "join SlotDoctor on SlotDoctor.slotDoctorId = Booking.slotDoctorId\n"
                + "where day is not null";

        try (PreparedStatement pstm = cnn.prepareStatement(strSQL); ResultSet rs = pstm.executeQuery()) {
            while (rs.next()) {
                int bookingId = rs.getInt("BookingId");
                int status = rs.getInt("BookingStatus");
                Date dayResult = rs.getDate("day");
                bookings.add(new Booking(bookingId, status, dayResult));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public String formatTimeFromMinutes(int minutes) {
        int hours = minutes / 60;
        int remainingMinutes = minutes % 60;
        return String.format("%02d:%02d", hours, remainingMinutes);
    }

    public List<Booking> getBookingListForManage() {
        List<Booking> bookings = new ArrayList<>();
        String strSQL = "SELECT \n"
                + "    Booking.BookingId, \n"
                + "    Booking.BookingStatus,\n"
                + "	Slots.StartTime,\n"
                + "	SlotDoctor.Status,\n"
                + "    DoctorUsers.firstName + ' ' + DoctorUsers.lastName AS DoctorName, \n"
                + "    CustomerUsers.firstName + ' ' + CustomerUsers.lastName AS CustomerName,\n"
                + " day\n"
                + "FROM \n"
                + "    Booking\n"
                + "JOIN \n"
                + "    SlotDoctor ON SlotDoctor.slotDoctorId = Booking.slotDoctorId\n"
                + "JOIN \n"
                + "    Doctors ON SlotDoctor.DoctorId = Doctors.DoctorId\n"
                + "JOIN \n"
                + "    Users AS DoctorUsers ON DoctorUsers.userId = Doctors.userId\n"
                + "JOIN \n"
                + "    Customers ON Customers.Id = Booking.CustomerId -- Giả định Booking có một trường CustomerId\n"
                + "JOIN \n"
                + "    Users AS CustomerUsers ON CustomerUsers.userId = Customers.userId\n"
                + "	join \n"
                + "	Slots on Slots.SlotId = SlotDoctor.SlotId\n"
                + "WHERE \n"
                + "    day IS NOT NULL;";

        try (PreparedStatement pstm = cnn.prepareStatement(strSQL); ResultSet rs = pstm.executeQuery()) {
            while (rs.next()) {
                int bookingId = rs.getInt("BookingId");
                int bookingStatus = rs.getInt("BookingStatus");
                String startTimeString = rs.getString("StartTime");

                // Parse the date and time
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
                Date date = inputFormat.parse(startTimeString);

                // Extract only the time component for output
                SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
                String formattedTime = outputFormat.format(date);
                int status = rs.getInt("Status");
                String doctorName = rs.getString("DoctorName");
                String customerName = rs.getString("CustomerName");
                Date dayResult = rs.getDate("day");
                bookings.add(new Booking(bookingId, bookingStatus, formattedTime, status, doctorName, customerName, dayResult));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }

}
