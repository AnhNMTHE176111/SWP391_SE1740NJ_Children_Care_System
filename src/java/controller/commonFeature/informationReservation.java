/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOBooking;
import DAO.DAOCustomer;
import DAO.DAODoctor;
import DAO.DAOService;
import DAO.DAOUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Booking;
import model.Customer;
import model.MedicalInfo;
import model.MedicalPrescription;
import model.Service;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "informationReservation", urlPatterns = {"/information"})
public class informationReservation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet informationReservation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet informationReservation at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String fileName = "Prescription_" + u.getFirstName() + "_" + u.getLastName() + ".docx";
        fileName = fileName.replaceAll("\\s+", "_");
        request.setAttribute("fileName", fileName);
        request.setAttribute("filePath", ".\\prescription\\" + fileName);

        DAOUser userDao = new DAOUser();
        DAOCustomer cusDao = new DAOCustomer();
        DAOService serDao = new DAOService();
        DAODoctor d = new DAODoctor();
        DAOBooking daoBooking = new DAOBooking();

        String doctorIdStr = request.getParameter("doctorId");
        int doctorId = Integer.parseInt(doctorIdStr);
        String bookingId = request.getParameter("id");
        Customer cusInfo = cusDao.getCusBookingInforByBookId(bookingId);
        Service cusService = serDao.getCusServiceInforByBookingId(bookingId);
        String doctorAvatar = userDao.getAvatarById(doctorId);

        // get medical prescription
        int slotDoctorId = daoBooking.getBookingById(Integer.parseInt(bookingId)).getSlotDoctorId();
        MedicalInfo med = d.getMedInfo(slotDoctorId);
        String treatment = med.getTreatmentPlan();
        System.out.println(treatment);
        ArrayList<MedicalPrescription> medicalPrescription = new ArrayList<>();
        if (treatment != null) {
            String[] array = treatment.split("\\|");
            String treatmentPlan = array[0];
            if (array.length > 1) {

                for (int i = 1; i < array.length; i++) {
                    String line = array[i];
                    MedicalPrescription mp = new MedicalPrescription();
                    mp.setMedication(line.split("-")[0]);
                    mp.setStrength(line.split("-")[1]);
                    mp.setFrequency(line.split("-")[2]);
                    medicalPrescription.add(mp);
                }
            }
            request.setAttribute("treatmentPlan", treatmentPlan);
            request.setAttribute("medicalPrescription", medicalPrescription);
        }

        session.setAttribute("doctorAvatar", doctorAvatar);
        session.setAttribute("bookingId", bookingId);
        session.setAttribute("cusInfo", cusInfo);
        session.setAttribute("cusService", cusService);
        request.getRequestDispatcher("reservationInformation.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String fileName = "Prescription_" + u.getFirstName() + "_" + u.getLastName() + ".docx";
        fileName = fileName.replaceAll("\\s+", "_");
        request.setAttribute("fileName", fileName);
        request.setAttribute("filePath", ".\\prescription\\" + fileName);

        String cancelBookingId = request.getParameter("bookingId");
        DAOBooking bookDao = new DAOBooking();
        DAOCustomer cusDao = new DAOCustomer();
        String cancelBooking = bookDao.cancelCusBookingByBookId(cancelBookingId);
        Customer cusInfo = cusDao.getCusBookingInforByBookId(cancelBooking);
        String mess = "The reservation has been canceled";
        request.setAttribute("mess", mess);
        session.setAttribute("bookingId", cancelBookingId);
        session.setAttribute("cusInfo", cusInfo);
        request.getRequestDispatcher("reservationInformation.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
