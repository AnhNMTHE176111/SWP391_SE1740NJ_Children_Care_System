/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAO.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Booking;

public class DAOBooking extends DBContext{
       PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;
    

    public DAOBooking() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    
  public ArrayList<Booking> getListDate() {
        ArrayList<Booking> data = new ArrayList<Booking>();
        try {
            String strSQL = "SELECT Days.DayDate, Slots.StartTime\n" +
"FROM Days\n" +
"join SlotDoctor on SlotDoctor.DayId = Days.DayId\n" +
"join Slots on SlotDoctor.SlotId = Slots.SlotId\n" +
"where SlotDoctor.DoctorId = 1";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String day = rs.getString(1);
                String slot = rs.getString(2);
           
                Booking booking = new Booking(day, slot, "", "");
                data.add(booking);
            }
        } catch (Exception e) {
            System.out.println("getListCustomers: " + e.getMessage());
       } 
        return data;
   }
//
//  public boolean addBooking() {
//        try {
//            String strSQL = "insert into Customers(CustomerName, Gender, Address, Birthdate) values(?,?,?,?)";
//            pstm = cnn.prepareStatement(strSQL);
//            pstm.setString(1, name);
//            pstm.setInt(2, Integer.parseInt(gender));
//            pstm.setString(3, address);
//            pstm.setString(4, birthDate);
//
//            pstm.execute();
//            return true;
//        } catch (Exception e) {
//            System.out.println("addProduct: " + e.getMessage());
//        }
//        return false;
//    }
}