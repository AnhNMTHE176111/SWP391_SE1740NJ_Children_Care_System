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
import java.util.Date;
import java.util.List;
import model.SlotDoctor;

/**
 *
 * @author dmx
 */
public class DAOSlotDoctor extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOSlotDoctor() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public int addSlotDoctor(int doctorId, int slotId, int status, String description, String day) {
        int generatedId = -1;
        try {
            String strSQL = "insert into SlotDoctor(DoctorId, SlotId, Status, Description, day) values(?,?,?,?,?); SELECT SCOPE_IDENTITY();";

            pstm = cnn.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, doctorId);
            pstm.setInt(2, slotId);
            pstm.setInt(3, status);
            pstm.setString(4, description);
            pstm.setString(5, day);
            if (pstm.executeUpdate() > 0) {
                try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedId = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            if (e.getMessage().contains("FK_SlotDoctor_Booking")) {
                System.out.println(e.getMessage());

            } else {
                e.printStackTrace();
            }
        }

        return generatedId;
    }

    public List<SlotDoctor> displayBookedSlotList() {
        List<SlotDoctor> bookedSlots = new ArrayList<>();
        try {
            String sql = "SELECT DoctorId, SlotId, day \n"
                    + "FROM SlotDoctor \n"
                    + "WHERE Status = 1 AND day IS NOT NULL;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int DoctorId = rs.getInt("DoctorId");
                int slotId = rs.getInt("SlotId");
                Date day = rs.getDate("day");

                SlotDoctor slotDoctor = new SlotDoctor(DoctorId, slotId, day); 
                bookedSlots.add(slotDoctor);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookedSlots;
    }

}
