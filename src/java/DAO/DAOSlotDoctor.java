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
    
    public int addSlotDoctor (int doctorId, int slotId, int status) {
        int generatedId = -1;
        try {
            String strSQL = "insert into SlotDoctor(DoctorId, SlotId, Status) values(?,?,?); SELECT SCOPE_IDENTITY();";

            pstm = cnn.prepareStatement(strSQL,  Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, doctorId);
            pstm.setInt(2, slotId);
            pstm.setInt(3, status);

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
