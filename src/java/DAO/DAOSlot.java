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
import model.Slot;

/**
 *
 * @author dmx
 */
public class DAOSlot extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOSlot() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
    
    public String formatTimeFromMinutes(int minutes) {
    int hours = minutes / 60;
    int remainingMinutes = minutes % 60;
    return String.format("%02d:%02d", hours, remainingMinutes);
}

public ArrayList<Slot> getListSlot() {
    ArrayList<Slot> data = new ArrayList<Slot>();

    try {
        String strSQL = "select SlotId, StartTime from Slots"; 
        pstm = cnn.prepareStatement(strSQL);
        rs = pstm.executeQuery();
        
        while (rs.next()) {
            int slotId = rs.getInt("SlotId");
            String startTimeString = rs.getString("StartTime");
            
            // Parse the date and time
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            Date date = inputFormat.parse(startTimeString);
            
            // Extract only the time component for output
            SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
            String formattedTime = outputFormat.format(date);
            
            Slot slot = new Slot(slotId, formattedTime);
            data.add(slot);
        }
    } catch (Exception e) {
        System.out.println("getListSlot: " + e.getMessage());
    }
    return data;
}

}
