/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.staffFeature;

import DAO.DAODoctor;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Customer;
import model.MedicalInfo;
import model.Slot;
import model.SlotDoctor;
import model.User;

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

        if (session == null) {
            response.sendRedirect("403.jsp");
        } else {
            User currentUser = (User) session.getAttribute("user");
            int doctorId = d.getDoctorIdByUserId(currentUser.getUserId());
            ArrayList<SlotDoctor> slotDoc = d.getReservationByDocId(doctorId);
            String specialty = d.getspecialtyNameByDocId(doctorId);

            request.setAttribute("currentUser", currentUser);
            request.setAttribute("slotDoc", slotDoc);
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
        Slot rightSlot = d.getSlotBySlotId(slotId);
        MedicalInfo med = d.getMedInfo(slotDoctorId);
        
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

}
