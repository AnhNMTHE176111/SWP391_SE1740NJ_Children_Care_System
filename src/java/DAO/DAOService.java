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
        String sql = " select * from Services join DoctorServices \n"
                + "  on Services.ServiceId = DoctorServices.ServiceId";
        ArrayList<Service> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String ServiceId = rs.getString(1);
                String ServiceName = rs.getString(2);
                String Description = rs.getString(3);
                int docId = rs.getInt(5);
                Service c = new Service(Integer.parseInt(ServiceId), ServiceName, Description, docId);
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

    public Service getServiceById(String id) {
        String sql = " select * from Services where ServiceId = ?";
        Service data = new Service();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String serid = rs.getString(1);
                String serName = rs.getString(2);
                String Description = rs.getString(3);
                data = new Service(Integer.parseInt(serid), serName, Description);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getServiceById>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getServiceById>: " + e.getMessage());
        }
        return data;
    }

    public Doctor getDoctorById(String id) {
        String sql = " SELECT ExperienceYears,Rating,Doctors.Description,Position,firstName,lastName,email,phone,SpecialtyName\n"
                + "FROM DoctorServices\n"
                + "INNER JOIN Doctors ON DoctorServices.doctorId = Doctors.DoctorId\n"
                + "INNER JOIN Users on Doctors.userId = Users.userId\n"
                + "Inner join Specialty on Specialty.SpecialtyId=Doctors.SpecialtyId\n"
                + "WHERE DoctorServices.ServiceId = ?";
        Doctor data = new Doctor();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String expYears = rs.getString(1);
                Float rate = Float.parseFloat(rs.getString(2));
                String Description = rs.getString(3);
                String position = rs.getString(4);
                String firstName = rs.getString(5);
                String lastName = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                String specName = rs.getString(9);

                data = new Doctor(Integer.parseInt(expYears), rate, Description, position, firstName, lastName, email, phone, specName);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getDoctorById>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getDoctorById>: " + e.getMessage());
        }
        return data;
    }

}
