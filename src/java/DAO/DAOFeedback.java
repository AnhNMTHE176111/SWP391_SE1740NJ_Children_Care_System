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
import model.Feedback;
import model.Post;

/**
 *
 * @author dmx
 */
public class DAOFeedback extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOFeedback() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public Feedback getFeedback(String medicalInforId) {
        try {
            String query = "select * from Feedback where MedicalInfoID = ?";
            PreparedStatement pstm = cnn.prepareStatement(query);
            pstm.setString(1, medicalInforId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setRatingId(rs.getInt(1));
                f.setMedicalInfoId(Integer.parseInt(medicalInforId));
                f.setRatingValue(rs.getString(3));
                f.setComment(rs.getString(4));
                return f;
            }
        } catch (SQLException e) {
            System.out.println("SQL <getFeedback>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getFeedback>: " + e.getMessage());
        }
        return null;
    }

    public boolean checkFeedbackExist(String medicalInforId) {
        try {
            String query = "select * from Feedback where MedicalInfoID = ?";
            PreparedStatement pstm = cnn.prepareStatement(query);
            pstm.setString(1, medicalInforId);
            rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("SQL <checkFeedbackExist>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<checkFeedbackExist>: " + e.getMessage());
        }
        return false;
    }

    public void updateFeedback(String medicalInfoId, String ratingValue, String comment) {
        try {
            String query = "update Feedback set ratingValue = ? , Comment = ? where MedicalInfoID = ?";
            PreparedStatement pstm = cnn.prepareStatement(query);
            pstm.setString(1, ratingValue);
            pstm.setString(2, comment);
            pstm.setString(3, medicalInfoId);
            pstm.execute();
        } catch (SQLException e) {
            System.out.println("SQL <updateFeedback>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<updateFeedback>: " + e.getMessage());
        }
    }

    public void addFeedback(String medicalInforId, String ratingValue, String comment) {
        String query = "INSERT [dbo].[Feedback] ([MedicalInfoID], [RatingValue], [Comment] ) VALUES (?,?,?)";
        try {
            PreparedStatement pstm = cnn.prepareStatement(query);
            pstm.setString(1, medicalInforId);
            pstm.setString(2, ratingValue);
            pstm.setString(3, comment);

            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL <addPost>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<addPost>: " + e.getMessage());
        }
    }

    public ArrayList<Feedback> getListFeedback(int doctorId) {
        ArrayList<Feedback> listFeedback = new ArrayList<>();

        try {
            String strSQL = "SELECT f.*,"
                    + "u.firstName, u.lastName,"
                    + "b.BookingId"
                    + " FROM Feedback f"
                    + " JOIN Booking b ON f.MedicalInfoID = b.MedicalInfoId"
                    + " JOIN Customers c ON b.CustomerID = c.Id"
                    + " JOIN Users u ON c.UserId = u.userId"
                    + " JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId"
                    + " JOIN Doctors d ON sd.DoctorId = d.DoctorId"
                    + " WHERE d.DoctorId = ?";

            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, doctorId);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setRatingId(Integer.parseInt(rs.getString(1)));
                feedback.setMedicalInfoId(Integer.parseInt(rs.getString(2)));
                feedback.setRatingValue(rs.getString(3));
                feedback.setComment(rs.getString(4));
                feedback.setUserFirstName(rs.getString(5));
                feedback.setUserLastName(rs.getString(6));
                feedback.setBookingId(Integer.parseInt(rs.getString(7)));
                // some code to finish
                listFeedback.add(feedback);
            }

            return listFeedback;
        } catch (SQLException e) {
            System.out.println("SQL getListFeedback: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getListFeedback: " + e.getMessage());
            return null;
        }
    }

    public ArrayList<Feedback> getListFeedbackByRate(int doctorId, String rate) {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            String strSQL = "SELECT f.*, u.firstName, u.lastName, b.BookingId\n"
                    + "FROM Feedback f\n"
                    + "JOIN Booking b ON f.MedicalInfoID = b.MedicalInfoId\n"
                    + "JOIN Customers c ON b.CustomerID = c.Id\n"
                    + "JOIN Users u ON c.UserId = u.userId\n"
                    + "JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "JOIN Doctors d ON sd.DoctorId = d.DoctorId\n"
                    + "WHERE d.DoctorId = ? AND f.RatingValue = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, doctorId);
            pstm.setString(2, rate);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setRatingId(Integer.parseInt(rs.getString(1)));
                feedback.setMedicalInfoId(Integer.parseInt(rs.getString(2)));
                feedback.setRatingValue(rs.getString(3));
                feedback.setComment(rs.getString(4));
                feedback.setUserFirstName(rs.getString(5));
                feedback.setUserLastName(rs.getString(6));
                feedback.setBookingId(Integer.parseInt(rs.getString(7)));
                // some code to finish
                listFeedback.add(feedback);
            }
            for (Feedback feedback : listFeedback) {
                System.out.println(feedback.getUserFirstName());
            }
            return listFeedback;
        } catch (SQLException e) {
            System.out.println("SQL getListFeedback: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getListFeedback: " + e.getMessage());
            return null;
        }
    }

    public List<Feedback> getListManageFeedback() {
        ArrayList<Feedback> listManageFeedback = new ArrayList<>();
        try {
            String strSQL = "	SELECT f.*,\n"
                    + "		u.firstName,\n"
                    + "		u.lastName,\n"
                    + "		b.BookingId,\n"
                    + "		k.doctorFirstName,\n"
                    + "		k.doctorLastName\n"
                    + "	FROM Feedback f\n"
                    + "	JOIN Booking b ON f.MedicalInfoID = b.MedicalInfoId\n"
                    + "	JOIN Customers c ON b.CustomerID = c.Id\n"
                    + "	JOIN Users u ON c.UserId = u.userId\n"
                    + "	JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "	JOIN (\n"
                    + "		select u.firstName as doctorFirstName,\n"
                    + "		u.lastName as doctorLastName, d.DoctorId\n"
                    + "		from Users u\n"
                    + "		join Doctors d ON d.userId = u.userId\n"
                    + "	) k ON k.DoctorId = sd.DoctorId";

            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setRatingId(Integer.parseInt(rs.getString(1)));
                feedback.setMedicalInfoId(Integer.parseInt(rs.getString(2)));
                feedback.setRatingValue(rs.getString(3));
                feedback.setComment(rs.getString(4));
                feedback.setUserFirstName(rs.getString(5));
                feedback.setUserLastName(rs.getString(6));
                feedback.setBookingId(Integer.parseInt(rs.getString(7)));
                feedback.setDoctorFirstName(rs.getString(8));
                feedback.setDoctorLastName(rs.getString(9));
                listManageFeedback.add(feedback);
            }

            return listManageFeedback;
        } catch (SQLException e) {
            System.out.println("SQL getListManageFeedback: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getListManageFeedback: " + e.getMessage());
            return null;
        }
    }

    public Feedback getListManageFeedbackByRateId(int rateId) {
        try {
            String strSQL = "SELECT f.*,\n"
                    + "		u.firstName,\n"
                    + "		u.lastName,\n"
                    + "		b.BookingId,\n"
                    + "		k.doctorFirstName,\n"
                    + "		k.doctorLastName\n"
                    + "	FROM Feedback f\n"
                    + "	JOIN Booking b ON f.MedicalInfoID = b.MedicalInfoId\n"
                    + "	JOIN Customers c ON b.CustomerID = c.Id\n"
                    + "	JOIN Users u ON c.UserId = u.userId\n"
                    + "	JOIN SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "	JOIN (\n"
                    + "		select u.firstName as doctorFirstName,\n"
                    + "		u.lastName as doctorLastName, d.DoctorId\n"
                    + "		from Users u\n"
                    + "		join Doctors d ON d.userId = u.userId\n"
                    + "	) k ON k.DoctorId = sd.DoctorId\n"
                    + "	WHERE f.RatingID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, rateId);
            rs = pstm.executeQuery();

            Feedback feedback = new Feedback();
            while (rs.next()) {
                feedback.setRatingId(Integer.parseInt(rs.getString(1)));
                feedback.setMedicalInfoId(Integer.parseInt(rs.getString(2)));
                feedback.setRatingValue(rs.getString(3));
                feedback.setComment(rs.getString(4));
                feedback.setUserFirstName(rs.getString(5));
                feedback.setUserLastName(rs.getString(6));
                feedback.setBookingId(Integer.parseInt(rs.getString(7)));
                feedback.setDoctorFirstName(rs.getString(8));
                feedback.setDoctorLastName(rs.getString(9));
            }
            return feedback;
        } catch (SQLException e) {
            System.out.println("SQL getListManageFeedbackByRateId: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getListManageFeedbackByRateId: " + e.getMessage());
            return null;
        }
    }

    public int updateFeedbackByRateId(String rateValue, int rateId, String comment) {
        try {
            String strSQL = "update Feedback set RatingValue = ?, Comment = ?\n"
                    + "where RatingID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, rateValue);
            pstm.setString(2, comment);
            pstm.setInt(3, rateId);
            rs = pstm.executeQuery();

        } catch (SQLException e) {
            System.out.println("SQL updateFeedbackByRateId: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("updateFeedbackByRateId: " + e.getMessage());
        }
        return rateId;
    }

    public void deleteFeedbackByRateId(int rateId) {
        try {
            String strSQL = "DELETE FROM Feedback WHERE RatingID = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, rateId);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL deleteFeedbackByRateId: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("deleteFeedbackByRateId: " + e.getMessage());
        }
    }

    public List<Feedback> getListManageFeedbackByRate(String rate) {
        ArrayList<Feedback> listManageFeedback = new ArrayList<>();
        try {
            String strSQL = "SELECT\n"
                    + "    f.*,\n"
                    + "    u.firstName,\n"
                    + "    u.lastName,\n"
                    + "    b.BookingId,\n"
                    + "    k.doctorFirstName,\n"
                    + "    k.doctorLastName\n"
                    + "FROM\n"
                    + "    Feedback f\n"
                    + "JOIN\n"
                    + "    Booking b ON f.MedicalInfoID = b.MedicalInfoId\n"
                    + "JOIN\n"
                    + "    Customers c ON b.CustomerID = c.Id\n"
                    + "JOIN\n"
                    + "    Users u ON c.UserId = u.userId\n"
                    + "JOIN\n"
                    + "    SlotDoctor sd ON b.slotDoctorId = sd.slotDoctorId\n"
                    + "JOIN\n"
                    + "    (\n"
                    + "        SELECT\n"
                    + "            u.firstName AS doctorFirstName,\n"
                    + "            u.lastName AS doctorLastName,\n"
                    + "            d.DoctorId\n"
                    + "        FROM\n"
                    + "            Users u\n"
                    + "        JOIN\n"
                    + "            Doctors d ON d.userId = u.userId\n"
                    + "    ) k ON k.DoctorId = sd.DoctorId\n"
                    + "WHERE f.RatingValue = ?";

            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, rate);
            rs = pstm.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setRatingId(Integer.parseInt(rs.getString(1)));
                feedback.setMedicalInfoId(Integer.parseInt(rs.getString(2)));
                feedback.setRatingValue(rs.getString(3));
                feedback.setComment(rs.getString(4));
                feedback.setUserFirstName(rs.getString(5));
                feedback.setUserLastName(rs.getString(6));
                feedback.setBookingId(Integer.parseInt(rs.getString(7)));
                feedback.setDoctorFirstName(rs.getString(8));
                feedback.setDoctorLastName(rs.getString(9));
                listManageFeedback.add(feedback);
            }

            return listManageFeedback;
        } catch (SQLException e) {
            System.out.println("SQL getListManageFeedback: " + e.getMessage());
            return null;
        } catch (Exception e) {
            System.out.println("getListManageFeedback: " + e.getMessage());
            return null;
        }
    }

}
