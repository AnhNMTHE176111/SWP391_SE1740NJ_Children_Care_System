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
import javax.xml.bind.ParseConversionEvent;
import model.Doctor;
import model.Specialty;

/**
 *
 * @author dmx
 */
public class DAOSpecialty extends DBContext{
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOSpecialty() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
    
     public ArrayList<Specialty> getListSpecialty() {
        ArrayList<Specialty> data = new ArrayList<Specialty>();

        try {
            String strSQL = "select SpecialtyId, SpecialtyName from Specialty";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {

                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);

                Specialty specialty = new Specialty(id, name, "");
                data.add(specialty);
            }
        } catch (Exception e) {
            System.out.println("getListSpecialty: " + e.getMessage());
        }
        return data;
    }
}
