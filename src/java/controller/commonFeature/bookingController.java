/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.DAOUser;
import DAO.DAOBooking;
import DAO.DAOCustomer;
import DAO.DAOSlot;
import DAO.DAODoctor;
import DAO.DAOMedicalInfo;
import DAO.DAOService;
import DAO.DAOSlotDoctor;
import DAO.DAOSpecialty;
import jakarta.servlet.http.HttpSession;
import configuration.configuration;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Doctor;
import model.Service;
import model.Slot;
import model.SlotDoctor;
import model.Specialty;
import model.User;
import model.MedicalInfo;

/**
 *
 * @author tbin6
 */
@WebServlet(name = "bookingController", urlPatterns = {"/booking"})
public class bookingController extends HttpServlet {

    private List<String> getDateList() {
        configuration config = new configuration();
        List<String> dateList = new ArrayList<>();

        Date currentDate = new Date();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        dateList.add(new SimpleDateFormat("dd/MM").format(currentDate));

        for (int i = 0; i < config.getNUMBER_OF_APPOINTMENT_DATE() - 1; i++) {
            calendar.add(Calendar.DATE, 1);
            Date nextDate = calendar.getTime();
            dateList.add(new SimpleDateFormat("dd/MM").format(nextDate));
        }

        return dateList;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        // Information from session
        //   String userId = String.valueOf(session.getAttribute("userId"));
        User currentUser = (User) session.getAttribute("user");
        DAOService service = new DAOService();
        DAOSlot slot = new DAOSlot();
        DAOSpecialty specialty = new DAOSpecialty();
        DAODoctor doctor = new DAODoctor();
        DAOSlotDoctor slotDoctor = new DAOSlotDoctor();

        List<Service> serviceList = null;
        List<SlotDoctor> availeSlot = null;
        List<String> dateList = null;
        List<Doctor> doctorList = null;
        List<Specialty> specialtyList = null;
        List<Slot> slotList = null;

        if (currentUser != null) {
            System.out.println("haha here the customer");
            int userId = currentUser.getUserId();
       

            serviceList = service.getListServiceByDoctor();
            availeSlot = slotDoctor.displayBookedSlotList();
            dateList = getDateList(); // Ensure this function is available and returns the desired result
            doctorList = doctor.getListDoctorBySpecialty();
            specialtyList = specialty.getListSpecialty();
            slotList = slot.getListSlot();
            request.setAttribute("currentUser", currentUser);
        } else {
            System.out.println("nono");
            serviceList = service.getListServiceByDoctor();
            availeSlot = slotDoctor.displayBookedSlotList();
            dateList = getDateList();
            doctorList = doctor.getListDoctorBySpecialty();
            specialtyList = specialty.getListSpecialty();
            slotList = slot.getListSlot();
        }

// Đặt các danh sách vào request attribute
        request.setAttribute("serviceList", serviceList);

        configuration config = new configuration();
        HashMap<Integer, String> listDateOff = config.getDATE_OFF();
        for (Map.Entry<Integer, String> entry : listDateOff.entrySet()) {
            Object key = entry.getKey();
            Object val = entry.getValue();
            String value = val.toString().split("-")[2] + "/" + val.toString().split("-")[1];
            String year = val.toString().split("-")[0];
            if (dateList.contains(value) && year.equals("2023")) {
                dateList.remove(value);
            }
        }

        request.setAttribute("currentUser", currentUser);
        request.setAttribute("availeSlot", availeSlot);
        request.setAttribute("dateList", dateList);
        request.setAttribute("doctorList", doctorList);
        request.setAttribute("specialtyList", specialtyList);
        request.setAttribute("slotList", slotList);

// Chuyển hướng đến trang Booking.jsp
        request.getRequestDispatcher("Booking.jsp").forward(request, response);

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        // Information from session
        //   String userId = String.valueOf(session.getAttribute("userId"));
        User currentUser = (User) session.getAttribute("user");
        DAOCustomer customer = new DAOCustomer();
        DAOUser user = new DAOUser();
        DAOSlotDoctor slotDoctor = new DAOSlotDoctor();
        DAOBooking booking = new DAOBooking();

//Data from jsp
        String slotId = request.getParameter("selectedSlotId");
        String doctorId = request.getParameter("doctorId");

        String selectedSpecialty = request.getParameter("specialty");
        String selectedDoctor = request.getParameter("doctor");
        String selectedDate = request.getParameter("selectedDate");
        String selectedSlot = request.getParameter("selectedSlot");
        String selectedService = request.getParameter("selectedService");
        int serviceId = Integer.parseInt(selectedService);

        String symptoms = request.getParameter("symptoms");
//About Doctor Backend
        int slotIdInt = Integer.parseInt(slotId);
        int doctorIdInt = Integer.parseInt(doctorId);

        String formattedDate = null;
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date parsedDate = inputFormat.parse(selectedDate);

            Calendar currentCalendar = Calendar.getInstance();
            int currentYear = currentCalendar.get(Calendar.YEAR);

            Calendar parsedCalendar = Calendar.getInstance();
            parsedCalendar.setTime(parsedDate);
            parsedCalendar.set(Calendar.YEAR, currentYear);

            formattedDate = outputFormat.format(parsedCalendar.getTime());

        } catch (ParseException e) {
            e.printStackTrace();

        }

        int slotDoctorId = 0;
        int addedUserId = 0;
        int customerId = 0;
        int bookingId = 0;
        int medicalInfoId = booking.addMedicalInfo();
        System.out.println(symptoms);
        slotDoctorId = slotDoctor.addSlotDoctor(doctorIdInt, slotIdInt, 1, symptoms, formattedDate);
        if (currentUser == null) {

//About Customer Backend
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            String[] parts = name.split("\\s+");
            String firstName = parts[0];

            String lastName = "";
            for (int i = 1; i < parts.length; i++) {
                lastName += parts[i] + " ";
            }
            lastName = lastName.trim();

            int roleId = 1;
            addedUserId = user.addGuess(firstName, lastName, gender, email, phone, dob, roleId);
            customerId = customer.addCustomer(addedUserId);
            System.out.println(customerId);

            response.sendRedirect("/home");
        } else {
            customerId = customer.getCusIdByUserIdReturn(currentUser.getUserId());

            response.sendRedirect("/home");
        }
        bookingId = booking.addBooking(1, customerId, slotDoctorId, serviceId, medicalInfoId);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
