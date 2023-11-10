/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Booking;

import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.sql.SQLException;
import java.text.DecimalFormat;
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

    public Booking getBookingById(int bid) {
        System.out.println("bid: " + bid);
        try {
            String strSQL = "select * from Booking where BookingId = " + bid;
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            Booking b = new Booking();
            while (rs.next()) {
                b.setBookingId(Integer.parseInt(rs.getString(1)));
                b.setBookingStatus(Integer.parseInt(rs.getString(2)));
                b.setSlotDoctorId(Integer.parseInt(rs.getString(6)));
                // some code to finish
            }
            return b;
        } catch (SQLException e) {
            System.out.println("SQL getBookingById: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("getBookingById: " + e.getMessage());
        }
        return null;
    }

    public int addBooking(int status, int customerId, int slotDoctorId, int serviceId) {
        int generatedId = -1;
        try {
            String strSQL = "insert into Booking(BookingStatus, CustomerID, slotDoctorId, ServiceId) values(?,?,?,?); SELECT SCOPE_IDENTITY();";
            pstm = cnn.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, status);
            pstm.setInt(2, customerId);
            pstm.setInt(3, slotDoctorId);
            pstm.setInt(4, serviceId);

            if (pstm.executeUpdate() > 0) {
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

    public List<Booking> getBookingList() {
        List<Booking> bookings = new ArrayList<>();
        String strSQL = "select BookingId, BookingStatus, day from Booking\n"
                + "join SlotDoctor on SlotDoctor.slotDoctorId = Booking.slotDoctorId\n"
                + "where day is not null";

        try ( PreparedStatement pstm = cnn.prepareStatement(strSQL);  ResultSet rs = pstm.executeQuery()) {
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
        String strSQL = "					SELECT \n"
                + "    Booking.BookingId, \n"
                + "    Doctors.DoctorId AS DoctorId,\n"
                + "    SlotDoctor.SlotId AS SlotId,\n"
                + "    Booking.BookingStatus,\n"
                + "    Slots.StartTime,\n"
                + "    SlotDoctor.Status,\n"
                + "    DoctorUsers.firstName + ' ' + DoctorUsers.lastName AS DoctorName, \n"
                + "    CustomerUsers.firstName + ' ' + CustomerUsers.lastName AS CustomerName,\n"
                + "    day\n"
                + "FROM \n"
                + "    Booking\n"
                + "JOIN \n"
                + "    SlotDoctor ON SlotDoctor.slotDoctorId = Booking.slotDoctorId\n"
                + "JOIN \n"
                + "    Doctors ON SlotDoctor.DoctorId = Doctors.DoctorId\n"
                + "JOIN \n"
                + "    Users AS DoctorUsers ON DoctorUsers.userId = Doctors.userId\n"
                + "JOIN \n"
                + "    Customers ON Customers.Id = Booking.CustomerId\n"
                + "JOIN \n"
                + "    Users AS CustomerUsers ON CustomerUsers.userId = Customers.userId\n"
                + "JOIN \n"
                + "    Slots on Slots.SlotId = SlotDoctor.SlotId\n"
                + "WHERE \n"
                + "    day IS NOT NULL;";

        try ( PreparedStatement pstm = cnn.prepareStatement(strSQL);  ResultSet rs = pstm.executeQuery()) {
            while (rs.next()) {
                int bookingId = rs.getInt("BookingId");
                int doctorId = rs.getInt("DoctorId");
                int slotId = rs.getInt("SlotId");
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
                bookings.add(new Booking(bookingId, doctorId, slotId, bookingStatus, formattedTime, status, doctorName, customerName, dayResult));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public List<Booking> getListCusReservation(int cusId, int pageIndex) {
        ArrayList<Booking> listCustReservation = new ArrayList<Booking>();
        try {
            String strSQL = "SELECT\n"
                    + "  b.*,\n"
                    + "  m.Diagnosis,\n"
                    + "  CONCAT(u.firstName, ' ', u.lastName) AS fullName,\n"
                    + "  s.StartTime,\n"
                    + "  s.EndTime,\n"
                    + "  se.ServiceName,\n"
                    + "  d.DoctorId,\n"
                    + "  sd.day\n"
                    + "FROM Booking b\n"
                    + "JOIN MedicalInfo m ON b.MedicalInfoId = m.MedicalInfoId\n"
                    + "JOIN Doctors d ON b.slotDoctorId = d.DoctorId\n"
                    + "JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "JOIN Slots s ON sd.SlotId = s.SlotId\n"
                    + "JOIN Users u ON d.userId = u.userId\n"
                    + "JOIN Services se ON b.ServiceId = se.ServiceId\n"
                    + "WHERE b.CustomerId = '" + cusId + "'\n"
                    + "ORDER BY b.CustomerId\n"
                    + "OFFSET ? ROWS FETCH NEXT 2 ROWS ONLY";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, (pageIndex - 1) * 2);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int BookingId = rs.getInt(1);
                int BookingStatus = rs.getInt(2);
                int CustomerID = rs.getInt(4);
                int MedicalInfoId = rs.getInt(5);
                String Diagnosis = rs.getString(8);
                String BookingDate = String.valueOf(rs.getDate(14));
                String BookingTime = String.valueOf("From " + rs.getTime(10) + " to " + rs.getTime(11));
                String DoctorName = rs.getString(9);
                String CreateDate = String.valueOf(rs.getDate(7));
                String CreateTime = String.valueOf(rs.getTime(7));
                String ServiceName = rs.getString(12);
                int DoctorId = rs.getInt(13);
                Booking cusBooking = new Booking(BookingId, BookingStatus, CustomerID, MedicalInfoId, Diagnosis, BookingDate, BookingTime, DoctorName, ServiceName, CreateDate, CreateTime, DoctorId);
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
                    + "JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "JOIN Slots s ON sd.SlotId = s.SlotId\n"
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

    public boolean updateBookingByManager(int bookingId, int status, int slotId, int slotStatus, String doctorFirstName, String doctorLastName, String customerFirstName, String customerLastName, String date) {

        try {
            String updateBookingSQL = "UPDATE Booking "
                    + "SET BookingStatus = ? "
                    + "WHERE BookingId = ?";
            pstm = cnn.prepareStatement(updateBookingSQL);
            pstm.setInt(1, status);
            pstm.setInt(2, bookingId);
            pstm.execute();

            String updateSlotStatusSQL = "UPDATE SlotDoctor "
                    + "SET Status = ?, SlotId = ?, day = ? "
                    + "WHERE slotDoctorId IN (SELECT slotDoctorId FROM Booking WHERE BookingId = ?)";
            pstm = cnn.prepareStatement(updateSlotStatusSQL);
            pstm.setInt(1, slotStatus);
            pstm.setInt(2, slotId);
            pstm.setString(3, date);
            pstm.setInt(4, bookingId);

            pstm.execute();

            String updateDoctorNameSQL = "UPDATE Users "
                    + "SET firstName = ?, lastName = ? "
                    + "WHERE UserId IN (SELECT DoctorId FROM Doctors WHERE DoctorId IN (SELECT DoctorId FROM SlotDoctor WHERE slotDoctorId IN (SELECT slotDoctorId FROM Booking WHERE BookingId = ?)))";
            pstm = cnn.prepareStatement(updateDoctorNameSQL);

            pstm.setString(1, doctorFirstName);
            pstm.setString(2, doctorLastName);
            pstm.setInt(3, bookingId);
            pstm.execute();

            String updateCustomerNameSQL = "				   UPDATE Users\n"
                    + "SET firstName = ?, lastName = ?\n"
                    + "WHERE Users.userId IN (\n"
                    + "    SELECT CustomerUsers.userId \n"
                    + "    FROM Booking\n"
                    + "    JOIN Customers ON Customers.Id = Booking.CustomerId\n"
                    + "    JOIN Users AS CustomerUsers ON CustomerUsers.userId = Customers.userId\n"
                    + "    WHERE Booking.BookingId = ?\n"
                    + ")";
            pstm = cnn.prepareStatement(updateCustomerNameSQL);
            pstm.setString(1, customerFirstName);
            pstm.setString(2, customerLastName);

            pstm.setInt(3, bookingId);
            pstm.execute();

        } catch (SQLException e) {
            System.out.println("SQL updateBookingByManager: " + e.getMessage());

            return false;
        } catch (Exception e) {
            System.out.println("updateBookingByManager: " + e.getMessage());
            return false;

        } finally {
            // Đóng PreparedStatement và Connection (nếu bạn quản lý chúng ở đây)
            try {
                if (pstm != null) {
                    pstm.close();
                }
                if (cnn != null) {
                    cnn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();

                return false;
            }
        }

        return true;  // Trả về true nếu tất cả đều thành công, false nếu có lỗi
    }

    public String cancelCusBookingByBookId(String cancelBookId) {
        try {
            String strSQL = "update Booking\n"
                    + "set BookingStatus = '2'\n"
                    + "where BookingId = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, cancelBookId);
            rs = pstm.executeQuery();

        } catch (SQLException e) {
            System.out.println("SQL cancelCusBookingByBookId: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("cancelCusBookingByBookId: " + e.getMessage());
        }
        return cancelBookId;

    }

}
