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
import model.Doctor;
import model.Service;
import model.Specialty;

/**
 *
 * @author dmx
 */
public class DAOService extends DBContext {

    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOService() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }

    public ArrayList<Service> getListService() {
        String sql = " select * from Services";
        ArrayList<Service> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String ServiceId = rs.getString(1);
                String ServiceName = rs.getString(2);
                String Description = rs.getString(3);
                Service c = new Service(Integer.parseInt(ServiceId), ServiceName, Description);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListService>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListService>: " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Doctor> getListDoctor() {
        String sql = " SELECT DoctorId, firstName, lastName\n"
                + "FROM Doctors\n"
                + "INNER JOIN Users ON Doctors.DoctorId = Users.userId;";
        ArrayList<Doctor> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int docId = Integer.parseInt(rs.getString(1));
                String expYear = rs.getString(2);
                String specId = rs.getString(3);
                Doctor c = new Doctor(docId, expYear, specId);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListDoctor>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListDoctor>: " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Specialty> getListSpecialty() {
        String sql = " select * from Specialty";
        ArrayList<Specialty> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String specId = rs.getString(1);
                String specName = rs.getString(2);
                String Description = rs.getString(3);
                Specialty c = new Specialty(Integer.parseInt(specId), specName, Description);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListSpecialty>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListSpecialty>: " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Service> getListServiceByDoctor() {
        String sql = "select * \n"
                + "from Services \n"
                + "INNER JOIN DoctorServices \n"
                + "ON Services.ServiceId= DoctorServices.ServiceId";
        ArrayList<Service> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String serviceName = rs.getString(2);
                int serviceId = Integer.parseInt(rs.getString(1));
                int doctorId = Integer.parseInt(rs.getString(4));
                Service c = new Service(serviceId, serviceName, doctorId);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListServiceByDoctor>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListServiceByDoctor>: " + e.getMessage());
        }
        return data;
    }

    public ArrayList<Service> getListServiceBySpecialty() {
        String sql = "SELECT s.ServiceId,ServiceName,sp.SpecialtyId, sp.Description\n"
                + "FROM Services s\n"
                + "INNER JOIN DoctorServices ds ON s.ServiceId = ds.ServiceId\n"
                + "INNER JOIN Doctors d ON ds.DoctorId = d.DoctorId\n"
                + "INNER JOIN Specialty sp ON d.SpecialtyId = sp.SpecialtyId;";
        ArrayList<Service> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int serviceId = Integer.parseInt(rs.getString(1));
                String serviceName = rs.getString(2);
                int specId = Integer.parseInt(rs.getString(3));
                String des = rs.getString(4);
                Service c = new Service(serviceId, serviceName, des, specId);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListServiceBySpecialty>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListServiceBySpecialty>: " + e.getMessage());
        }
        return data;
    }

}
