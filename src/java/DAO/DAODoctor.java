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
import model.Doctor;
import model.Specialty;

/**
 *
 * @author dmx
 */
public class DAODoctor extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAODoctor() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public ArrayList<Doctor> getListDoctorBySpecialty() {
        ArrayList<Doctor> data = new ArrayList<Doctor>();

        try {
            String strSQL = "SELECT Users.firstName + ' ' + Users.lastName AS username, Specialty.SpecialtyId, DoctorId \n"
                    + "FROM Doctors\n"
                    + "JOIN Specialty ON Specialty.SpecialtyId = Doctors.SpecialtyId \n"
                    + "JOIN Users ON Users.userId = Doctors.userId\n"
                    + "WHERE Users.RoleId = 2;";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                int id = Integer.parseInt(rs.getString(2));
                int doctorId = rs.getInt(3);
                Doctor doctor = new Doctor(name, id, doctorId);
                data.add(doctor);
            }
        } catch (Exception e) {
            System.out.println("getListSpecialty: " + e.getMessage());
        }
        return data;
    }

}
