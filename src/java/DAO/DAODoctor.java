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
import model.MedicalInfo;
import model.Service;
import model.Slot;
import model.SlotDoctor;
import model.Specialty;
import model.User;

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
                int status = rs.getInt(5);
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

//    public String getspecialtyNameByDocId(int doctorId) {
//
//        String sql = "select SpecialtyName from Specialty\n"
//                + "join Doctors on Doctors.SpecialtyId = Specialty.SpecialtyId\n"
//                + "where DoctorId = ?";
//        String data = null;
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, doctorId);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                data = rs.getString(1);
//            }
//        } catch (SQLException e) {
//            System.out.println("SQL <getspecialtyNameByDocId>: " + e.getMessage());
//        } catch (Exception e) {
//            System.out.println("<getspecialtyNameByDocId>: " + e.getMessage());
//        }
//        return data;
//    }

    public ArrayList<Doctor> getDoctorList() {
        ArrayList<Doctor> data = new ArrayList<Doctor>();
        String strSQL = "SELECT DoctorId, CONCAT(Users.firstName, ' ', Users.lastName) AS DoctorName\n"
                + "FROM Doctors\n"
                + "JOIN Users ON Users.userId = Doctors.userId;";

        try (PreparedStatement pstm = cnn.prepareStatement(strSQL); ResultSet rs = pstm.executeQuery()) {
            while (rs.next()) {
                int doctorId = rs.getInt("DoctorId");
                String doctorName = rs.getString("DoctorName");

                data.add(new Doctor(doctorId, doctorName));
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        String sql = "select dateOfVisit,dateOfRevisit,Symptoms,diagnosis,treatmentPlan,\n"
                + "MedicalInfo.MedicalInfoId\n"
                + "from SlotDoctor\n"
                + "join Booking on SlotDoctor.slotDoctorId= Booking.slotDoctorId\n"
                + "join MedicalInfo on Booking.MedicalInfoId = MedicalInfo.MedicalInfoId\n"
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
                data.setMedicalInfoId(rs.getInt(6));

                data.setRatingValue(rs.getFloat(6));
                data.setComment(rs.getString(6));
                data.setRatingId(rs.getInt(6));

            }
        } catch (SQLException e) {
            System.out.println("SQL <getMedInfo>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getMedInfo>: " + e.getMessage());
        }
        return data;
    }

    public void updateMedicalInfoByMedId(int medId, String revisit, String symtoms, String diagnosis, String treatmentPlan) {
        String sql = "update MedicalInfo\n"
                + "set \n"
                + "	DateOfReVisit = ?,  \n"
                + "	Symptoms = ?,       \n"
                + "	Diagnosis = ? ,     \n"
                + "	TreatmentPlan = ?   \n"
                + "where MedicalInfoId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, revisit);
            ps.setString(2, symtoms);
            ps.setString(3, diagnosis);
            ps.setString(4, treatmentPlan);
            ps.setInt(5, medId);
            int update = ps.executeUpdate();
            System.out.println("update successfully: " + update);
        } catch (SQLException e) {
            System.out.println("SQL <updateMedicalInfoByMedId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<updateMedicalInfoByMedId>: " + e.getMessage());
        }
    }

    public void updateStatusByBookingId(int medId, String status) {
        String sql = "UPDATE SlotDoctor\n"
                + "SET Status = ?\n"
                + "WHERE slotDoctorId in (select slotDoctorId from Booking where MedicalInfoId = ? );";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            if (status.equals("active")) {
                ps.setInt(1, 1);
            } else {
                ps.setInt(1, 0);
            }
            ps.setInt(2, medId);
            int update = ps.executeUpdate();
            System.out.println("update successfully: " + update);
        } catch (SQLException e) {
            System.out.println("SQL <updateStatusByBookingId>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<updateStatusByBookingId>: " + e.getMessage());
        }
    }

}
