/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.staffFeature;

import model.CreateByReplacingPlaceholderText;
import DAO.DAODoctor;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Formatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.MedicalInfo;
import model.MedicalPrescription;
import model.Slot;
import model.SlotDoctor;
import model.User;
import model.*;

/**
 *
 * @author Admin
 */
public class reservationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        DAODoctor d = new DAODoctor();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("403.jsp");
        } else {
            // get all data of booking by doctor
            int doctorId = d.getDoctorIdByUserId(currentUser.getUserId());
            ArrayList<SlotDoctor> slotDoc = d.getReservationByDocId(doctorId);
            ArrayList<SlotDoctor> newSlotDoc = new ArrayList<>();
            String specialty = d.getspecialtyNameByDocId(doctorId);

            // handle filter date
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date currentDate = null;
            try {
                currentDate = formatter.parse(LocalDateTime.now().toString());
            } catch (ParseException ex) {
                Logger.getLogger(reservationController.class.getName()).log(Level.SEVERE, null, ex);
            }

            String module = request.getParameter("module");
            String date = request.getParameter("date");
            // get date from now
            if (module == null) {
                for (SlotDoctor slotDoctor : slotDoc) {
                    try {
                        Date slotDoctorDate = formatter.parse(slotDoctor.getDay().toString());
                        if (slotDoctorDate.after(currentDate) || slotDoctorDate.equals(currentDate)) {
                            newSlotDoc.add(slotDoctor);
//                            System.out.println("true: " + slotDoctorDate);
                        } else {
//                            System.out.println("false: " + slotDoctorDate);
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(reservationController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } else {
                newSlotDoc.addAll(slotDoc);
            }

            Date dateFilter = new Date();

            if (date != null) {
                switch (date) {
                    case "all":
                        dateFilter = null;
                        break;
                    case "today":
                        dateFilter = currentDate;
                        break;
                    case "tommorow": 
                    try {
                        dateFilter = formatter.parse(LocalDateTime.now().plusDays(1).toString());
                    } catch (ParseException ex) {
                        Logger.getLogger(reservationController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                    default:
                    try {
                        dateFilter = formatter.parse(date);
                    } catch (ParseException ex) {
                        Logger.getLogger(reservationController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                }
            } else {
                dateFilter = null;
            }

            if (dateFilter != null) {
                ArrayList<SlotDoctor> rawData = new ArrayList<>();
                rawData.addAll(newSlotDoc);
                newSlotDoc.clear();
                for (SlotDoctor slotDoctor : rawData) {
                    try {
                        Date slotDoctorDate = formatter.parse(slotDoctor.getDay().toString());
                        if (slotDoctorDate.equals(dateFilter)) {
                            newSlotDoc.add(slotDoctor);
                        }
                    } catch (ParseException ex) {
                        Logger.getLogger(reservationController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            
            request.setAttribute("date", date);
            request.setAttribute("module", module);
            request.setAttribute("currentUser", currentUser);
            request.setAttribute("slotDoc", newSlotDoc);
            request.setAttribute("specialty", specialty);
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAODoctor d = new DAODoctor();
        int slotId = Integer.parseInt(request.getParameter("slotId"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        int slotDoctorId = d.getSlotDoctorId(slotId, doctorId);
        User khachHang = d.getUserInfoBySlotDoctorId(slotDoctorId);
        Slot rightSlot = d.getSlotBySlotId(slotId, doctorId);
        MedicalInfo med = d.getMedInfo(slotDoctorId);
        Feedback cusFeedback = d.getFeedbackBySlotDoctorId(slotDoctorId);
        request.setAttribute("cusFeedback", cusFeedback);

        // get medical prescription
        String treatment = med.getTreatmentPlan();
        if (treatment != null) {
            String[] array = treatment.split("\\|");
            String treatmentPlan = array[0];
            ArrayList<MedicalPrescription> medicalPrescription = new ArrayList<>();
            if (array.length > 1) {
                for (int i = 1; i < array.length; i++) {
                    String line = array[i];
                    MedicalPrescription mp = new MedicalPrescription();
                    mp.setMedication(line.split("-")[0]);
                    mp.setStrength(line.split("-")[1]);
                    mp.setFrequency(line.split("-")[2]);
                    medicalPrescription.add(mp);
                }
                request.setAttribute("medicalPrescription", medicalPrescription);
            }
            request.setAttribute("treatmentPlan", treatmentPlan);

            // create prescription docx
            String medication = "";
            for (int i = 0; i < medicalPrescription.size(); i++) {
                MedicalPrescription mp = medicalPrescription.get(i);
                medication += mp.getMedication() + ", " + mp.getStrength() + ", " + mp.getFrequency() + "\n";
            }
            String fileName = "Prescription_" + khachHang.getFirstName() + "_" + khachHang.getLastName() + ".docx";
            fileName = fileName.replaceAll("\\s+", "_");
            String filepath = getServletContext().getRealPath("").split("build")[0];
            String docx = "Blank Prescription Template.docx";
            Doctor doctor = d.getDoctorbyIDbyTuanAnh(doctorId);
            CreateByReplacingPlaceholderText fuck = new CreateByReplacingPlaceholderText();
            fuck.createPrecription(filepath + "\\" + docx,doctor.getName(), doctor.getPhone(), doctor.getEmail(), medication, khachHang.getFirstName() + " " + khachHang.getLastName(), med.getSymptons(), med.getDiagnosis(), treatmentPlan, filepath + "\\web\\prescription\\" + fileName);
            request.setAttribute("fileName", fileName);
            request.setAttribute("filePath", ".\\prescription\\" + fileName);
        }
        request.setAttribute("med", med);
        request.setAttribute("slotId", slotId);
        request.setAttribute("doctorId", doctorId);
        request.setAttribute("khachHang", khachHang);
        request.setAttribute("rightSlot", rightSlot);
        request.setAttribute("slotDoctorId", slotDoctorId);
        request.getRequestDispatcher("reservationDetail.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public static void main(String[] args) {
        // a before b -> a<b
        // a after b -> a>=b
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        Date a = new Date(); // 2023-11-01
//        Date b = null;
//        try {
//            b = formatter.parse("2023-11-01");
//        } catch (ParseException ex) {
//            Logger.getLogger(reservationController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        System.out.println("a: " + a);
//        System.out.println("b: " + b);
//        System.out.println("compare: " + b.after(a));

        String a = "1234";
        String b = "1-2-3";
        String[] k = a.split("\\|");
        String[] h = b.split("-");
        System.out.println(k.length);
    }

}
