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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Doctor;
<<<<<<< Updated upstream
=======
import model.MedicalInfo;
import model.Service;
import model.Slot;
import model.SlotDoctor;
import model.Specialty;
import model.User;
>>>>>>> Stashed changes

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

    public ArrayList<Doctor> getListSpecialty() {
        ArrayList<Doctor> data = new ArrayList<Doctor>();

        try {
            String strSQL = "select  Users.firstName, Specialty.SpecialtyName from Doctors\n"
                    + "join Specialty on Specialty.SpecialtyId = Doctors.SpecialtyId \n"
                    + "join Users on Users.userId = Doctors.userId\n"
                    + "where Users.RoleId = 2;";
            pstm = cnn.prepareStatement(strSQL);
            rs = pstm.executeQuery();
            while (rs.next()) {

                String name = rs.getString(1);
<<<<<<< Updated upstream
                String specialty = rs.getString(2);

                Doctor doctor = new Doctor(0, 0, 0, name, specialty, "", "");
=======
                int id = Integer.parseInt(rs.getString(2));

                Doctor doctor = new Doctor(name, id);
>>>>>>> Stashed changes
                data.add(doctor);
            }
        } catch (Exception e) {
            System.out.println("getListSpecialty: " + e.getMessage());
        }
        return data;
    }
<<<<<<< Updated upstream
=======

    public ArrayList<SlotDoctor> getReservationByDocId(int doctorId) {
        String sql = "SELECT Slots.SlotId, startTime, endTime, DoctorId, status, Description\n"
                + "FROM slots\n"
                + "INNER JOIN SlotDoctor ON slots.slotid = SlotDoctor.slotid "
                + "where DoctorId = ?";
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ArrayList<SlotDoctor> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String startTime = rs.getString(2);
                Date start = inputFormat.parse(startTime);
                String sTime = outputFormat.format(start);

                String endTime = rs.getString(3);
                Date end = inputFormat.parse(endTime);
                String eTime = outputFormat.format(end);
                
                String Description = rs.getString(6);
                int status = Integer.parseInt(rs.getString(5));
                int docId = Integer.parseInt(rs.getString(4));
                int slotId = Integer.parseInt(rs.getString(1));
                SlotDoctor c = new SlotDoctor(slotId, sTime, eTime, docId, status, Description);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getReservationByDocId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getReservationByDocId>: " + e.getMessage());
        }
        return data;
    }

    public int getDoctorIdByUserId(int userId) {
        String sql = "select DoctorId from Users join Doctors\n"
                + "on Users.userId = Doctors.userId\n"
                + "where Users.userId = ? ";
        int data = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data = rs.getInt("DoctorId");
            }
        } catch (SQLException e) {
            System.out.println("SQL <getDoctorIdByUserId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getDoctorIdByUserId>: " + e.getMessage());
        }
        return data;
    }

    public String getspecialtyNameByDocId(int doctorId) {
        String sql = "select SpecialtyName from Specialty\n"
                + "join Doctors on Doctors.SpecialtyId = Specialty.SpecialtyId\n"
                + "where DoctorId = ?";
        String data = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("SQL <getspecialtyNameByDocId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getspecialtyNameByDocId>: " + e.getMessage());
        }
        return data;
    }

    public int getSlotDoctorId(int slotId, int doctorId) {
        String sql = "select * from SlotDoctor\n"
                + "where DoctorId = ? and SlotId = ?";
        int data = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ps.setInt(2, slotId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data = rs.getInt("slotDoctorId");
            }
        } catch (SQLException e) {
            System.out.println("SQL <getSlotDoctorId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getSlotDoctorId>: " + e.getMessage());
        }
        return data;
    }

    public User getUserInfoBySlotDoctorId(int slotDoctorId) {
        String sql = "select status,  firstName,  lastName,   address,  phone,  dob,  avatar from Booking\n"
                + "join Customers on Booking.CustomerID = Customers.Id\n"
                + "join Users on Customers.UserId = Users.userId\n"
                + "where Booking.slotDoctorId = ? ";
        User data = new User();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, slotDoctorId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data.setStatus(rs.getString(1));
                data.setFirstName(rs.getString(2));
                data.setLastName(rs.getString(3));
                data.setAddress(rs.getString(4));
                data.setPhone(rs.getString(5));
                data.setDob(rs.getString(6));
                data.setAvatar(rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println("SQL <getUserInfoBySlotDoctorId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getUserInfoBySlotDoctorId>: " + e.getMessage());
        }
        return data;
    }

    public Slot getSlotBySlotId(int slotId) {
        String sql = "select * from Slots where slotId = ?";
        Slot data = new Slot();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, slotId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data.setSlotId(rs.getInt(1));
                data.setStartTime(rs.getString(2));
                data.setEndTime(rs.getString(3));

            }
        } catch (SQLException e) {
            System.out.println("SQL <getSlotBySlotId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getSlotBySlotId>: " + e.getMessage());
        }
        return data;

    }

    public MedicalInfo getMedInfo(int slotDoctorId) {
        String sql = "select dateOfVisit,dateOfRevisit,Symptoms,diagnosis,treatmentPlan,ratingId,MedicalInfo.MedicalInfoId,ratingValue,comment from SlotDoctor \n"
                + "join Booking on SlotDoctor.slotDoctorId= Booking.slotDoctorId\n"
                + "join MedicalInfo on Booking.MedicalInfoId = MedicalInfo.MedicalInfoId\n"
                + "join Feedback on MedicalInfo.MedicalInfoId = Feedback.MedicalInfoID\n"
                + "where SlotDoctor.slotDoctorId = ?";
        MedicalInfo data = new MedicalInfo();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, slotDoctorId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                data.setDateOfVisit(rs.getString(1));
                data.setDateOfRevisit(rs.getString(2));
                data.setSymptons(rs.getString(3));
                data.setDiagnosis(rs.getString(4));
                data.setTreatmentPlan(rs.getString(5));
                data.setRatingId(rs.getInt(6));
                data.setMedicalInfoId(rs.getInt(7));
                data.setRatingValue(rs.getFloat(8));
                data.setComment(rs.getString(9));

            }
        } catch (SQLException e) {
            System.out.println("SQL <getMedInfo>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getMedInfo>: " + e.getMessage());
        }
        return data;
    }

>>>>>>> Stashed changes
}
