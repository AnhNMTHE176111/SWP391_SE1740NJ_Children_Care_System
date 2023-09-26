/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.print.Doc;
import model.Doctor;

/**
 *
 * @author dmx
 */
public class DAODoctor extends DBContext{
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAODoctor() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
    
     public ArrayList<Doctor> getListSpecialty() {
    ArrayList<Doctor> data = new ArrayList<Doctor>();

    
    try {
        String strSQL = "select  Users.firstName, Specialty.SpecialtyName from Doctors\n" +
"join Specialty on Specialty.SpecialtyId = Doctors.SpecialtyId \n" +
"join Users on Users.userId = Doctors.userId\n" +
"where Users.RoleId = 2;";
        pstm = cnn.prepareStatement(strSQL);
        rs = pstm.executeQuery();
        while (rs.next()) {
              
             String name = rs.getString(1);
           String specialty = rs.getString(2);
            
            Doctor doctor = new Doctor(0, 0, 0, name, specialty, "", "");
            data.add(doctor);
        }
    } catch (Exception e) {
        System.out.println("getListSpecialty: " + e.getMessage());
   } 
    return data;
}
}
