/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Booking;
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

    public ArrayList<User> getListCustomer(int currentPage, int itemsPerPage) {
        String sql = " SELECT * FROM Users where RoleId = 1 ORDER BY userId"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        int offset = (currentPage - 1) * itemsPerPage;

        ArrayList<User> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, itemsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String status = rs.getString(2);
                String fname = rs.getString(3);
                String lname = rs.getString(4);
                boolean gender = rs.getBoolean(5);
                String sex = rs.getString(5);

                String email = rs.getString(6);
                String phone = rs.getString(9);
                String address = rs.getString(8);
                String dob = rs.getString(10);
                String avatar = rs.getString(11);
                String creatAt = rs.getString(12);
                User c = new User(status, fname, lname, sex, email, "", address, phone, dob, avatar, creatAt, Integer.parseInt(userId), 0);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListCustomer>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListCustomer>: " + e.getMessage());
        }
        return data;
    }

    public void deleteCustomerById(String UserId) {
        String sql = " DELETE FROM Users\n"
                + "WHERE userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(UserId));

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("success.jsp");
            } else {
                System.out.println("notfound.jsp");
            }
        } catch (SQLException e) {
            System.out.println("SQL <deleteCustomerById>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<deleteCustomerById>: " + e.getMessage());
        }

    }

    public User getUserById(String UserId) {
        String sql = " select * from users \n"
                + "  where roleId = 1 and userId = ?";
        User c = new User();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(UserId));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userId = rs.getString(1);
                String status = rs.getString(2);
                String fname = rs.getString(3);
                String lname = rs.getString(4);
                boolean gender = rs.getBoolean(5);
                String sex;
                if (gender) {
                    sex = "male";
                } else {
                    sex = "female";
                }
                String email = rs.getString(6);
                String phone = rs.getString(9);
                String address = rs.getString(8);
                String dob = rs.getString(10);
                String avatar = rs.getString(11);
                String creatAt = rs.getString(12);
                c = new User(status, fname, lname, sex, email, "", address, phone, dob, avatar, creatAt, Integer.parseInt(userId), 0);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getUserById>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getUserById>: " + e.getMessage());
        }
        return c;
    }

    public int getTotalItemCount() {
        String sql = " SELECT COUNT(*) FROM Users where RoleId = 1;";
        int total = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
                System.out.println(total);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getTotalItemCount>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getTotalItemCount>: " + e.getMessage());
        }
        return total;
    }

    public ArrayList<Booking> getListReservationByUserId(String UserId) {
        String sql = "SELECT *\n"
                + "FROM (\n"
                + "   select BookingId, BookingStatus\n"
                + "	from Users \n"
                + "	join Customers on Users.userId = Customers.UserId\n"
                + "	join Booking on Customers.Id = Booking.CustomerID\n"
                + "	where Users.userId = ?\n"
                + "\n"
                + ") AS result1\n"
                + "JOIN (\n"
                + "    select CONCAT(lastName, ' ', firstName) AS doctorName, ServiceName, BookingId, day, StartTime, EndTime\n"
                + "	from Users \n"
                + "	join Doctors on Doctors.userId = Users.userId\n"
                + "	join SlotDoctor on Doctors.DoctorId = SlotDoctor.DoctorId\n"
                + "	join Booking on booking.slotDoctorId = slotDoctor.slotDoctorId\n"
                + "	join Services on Services.ServiceId = Booking.ServiceId\n"
                + "	join Slots on slots.SlotId = SlotDoctor.SlotId\n"
                + "	\n"
                + ") AS result2\n"
                + "ON result1.BookingId = result2.BookingId;";
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm:ss");
        ArrayList<Booking> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(UserId));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String bookingId = rs.getString(1);
                String bookingStatus = rs.getString(2);
                String doctorName = rs.getString(3);
                String serviceName = rs.getString(4);
                String date = rs.getString(6);

                String startTime = rs.getString(7);
                Date start = inputFormat.parse(startTime);
                String sTime = outputFormat.format(start);
                String endTime = rs.getString(8);
                Date end = inputFormat.parse(endTime);
                String eTime = outputFormat.format(end);

                Booking c = new Booking(Integer.parseInt(bookingId), Integer.parseInt(bookingStatus), doctorName, serviceName, sTime, eTime, date);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListReservationByUserId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListReservationByUserId>: " + e.getMessage());
        }
        return data;
    }

}
