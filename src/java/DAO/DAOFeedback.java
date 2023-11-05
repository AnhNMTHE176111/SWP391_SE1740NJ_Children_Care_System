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

    public ArrayList<Feedback> getListFeedback() {
        ArrayList<Feedback> listFeedback = new ArrayList<>();
        try {
            String strSQL = "select * from Feedback";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setRatingId(Integer.parseInt(rs.getString(1)));
                feedback.setMedicalInfoId(Integer.parseInt(rs.getString(2)));
                feedback.setRatingValue(rs.getString(3));
                feedback.setComment(rs.getString(4));

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

}
