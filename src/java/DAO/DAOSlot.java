/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAO.DBContext;
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
    
    public ArrayList<Slot> getListSlot() {
    ArrayList<Slot> data = new ArrayList<Slot>();
    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
    
    try {
        String strSQL = "select StartTime from Slots";
        pstm = cnn.prepareStatement(strSQL);
        rs = pstm.executeQuery();
        while (rs.next()) {
            String startTime = rs.getString(1);
            
            // Chuyển đổi chuỗi datetime thành đối tượng Date
            Date date = inputFormat.parse(startTime);
            
            // Định dạng lại thành chuỗi giờ và phút
            String formattedTime = outputFormat.format(date);
            
            Slot slot = new Slot(0, formattedTime, "");
            data.add(slot);
        }
    } catch (Exception e) {
        System.out.println("getListSlot: " + e.getMessage());
   } 
    return data;
}
}
