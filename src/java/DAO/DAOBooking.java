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
import java.util.ArrayList;
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

}
