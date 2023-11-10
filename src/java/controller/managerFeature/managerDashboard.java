/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerFeature;

import DAO.DAOBooking;
import DAO.DAODoctor;
import DAO.DAOService;
import DAO.DAOSlot;
import DAO.DAOSlotDoctor;
import DAO.DAOSpecialty;
import DAO.DAOUser;
import com.google.gson.*;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.lang.ProcessBuilder.Redirect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.Booking;
import model.Doctor;
import model.Service;
import model.Slot;
import model.SlotDoctor;
import model.Specialty;
import model.User;

/**
 *
 * @author dmx
 */
@WebServlet(name = "managerDashboardController", urlPatterns = {"/manageDashboard"})
public class managerDashboard extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet managerDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet managerDashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private List<String> getDateList() {
        List<String> dateList = new ArrayList<>();

        Date currentDate = new Date();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        dateList.add(new SimpleDateFormat("dd/MM").format(currentDate));

        for (int i = 0; i < 2; i++) {
            calendar.add(Calendar.DATE, 1);
            Date nextDate = calendar.getTime();
            dateList.add(new SimpleDateFormat("dd/MM").format(nextDate));
        }

        return dateList;
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
        if (String.valueOf(session.getAttribute("roleId")).equals("null") || Integer.parseInt(String.valueOf(session.getAttribute("roleId"))) != 3) {
            response.sendRedirect("403.jsp");
            return;
        }
        List<String> dateList = null;
        DAOBooking booking = new DAOBooking();
        DAOSlotDoctor slotDoctor = new DAOSlotDoctor();
        DAOSlot slot = new DAOSlot();
        DAODoctor doctor = new DAODoctor();
        DAOSpecialty specialty = new DAOSpecialty();
        DAOService service = new DAOService();

        List<Service> serviceList = service.getListServiceBySpecialty();
        List<Specialty> specialtyList = specialty.getListSpecialty();
        List<Doctor> doctorList = doctor.getDoctorList();
        List<Slot> slotList = slot.getListSlot();
        List<Booking> reservationList = booking.getBookingList();
        List<Booking> reservationListForManage = booking.getBookingListForManage();
        List<SlotDoctor> availeSlot = slotDoctor.displayBookedSlotList();
        dateList = getDateList();

        request.setAttribute("serviceList", serviceList);
        request.setAttribute("specialtyList", specialtyList);
        request.setAttribute("doctorList", doctorList);
        request.setAttribute("dateList", dateList);
        request.setAttribute("slotList", slotList);
        request.setAttribute("availeSlot", availeSlot);
        request.setAttribute("reservationListForManage", reservationListForManage);
        request.setAttribute("reservationList", reservationList);
        request.getRequestDispatcher("managerDashboard.jsp").forward(request, response);

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOBooking bookingDAO = new DAOBooking();
        DAOUser userDao = new DAOUser();
        DAOSlotDoctor slotDoctorDao = new DAOSlotDoctor();

        String jsonData = new BufferedReader(request.getReader()).lines().collect(Collectors.joining("\n"));
        Gson gson = new Gson();
        JsonElement jsonElement = gson.fromJson(jsonData, JsonElement.class);

        try {
            if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                boolean allOperationsSuccess = true;

                for (JsonElement element : jsonArray) {
                    JsonObject jsonObject = element.getAsJsonObject();
                    String dataType = jsonObject.get("dataType").getAsString();
                    System.out.println(dataType);
                    System.out.println("hello");
                    switch (dataType) {
                        case "bookingUpdate":

                            if (!handleBookingUpdate(jsonObject, bookingDAO)) {

                                allOperationsSuccess = false;

                                break;
                            }
                            break;
                        case "addNewDoctor":

                            if (!handleNewDoctor(jsonObject, userDao)) {

                                allOperationsSuccess = false;

                                break; // hoặc bỏ qua
                            } else {

                            }
                            break;
                        case "selectOffSlot":

                            if (!handleSelectOffSlot(jsonObject, slotDoctorDao)) {
                                
                                allOperationsSuccess = false;

                                break; // hoặc bỏ qua
                            } else {

                            }
                            break;
                        default:
                            System.out.println("khong o addDoc");
                            allOperationsSuccess = false;
                            Logger.getLogger(managerDashboard.class.getName()).log(Level.INFO, "Unknown dataType");
                            break;
                    }
                }

                sendResponse(response, allOperationsSuccess, allOperationsSuccess ? "All operations successful." : "One or more operations failed.");
            } else {
                sendResponse(response, false, "Expected a JSON array with operations.");
            }
        } catch (JsonSyntaxException ex) {
            Logger.getLogger(managerDashboard.class.getName()).log(Level.SEVERE, "Failed to parse JSON", ex);
            sendResponse(response, false, "Invalid JSON format");
        }
    }

    private void sendResponse(HttpServletResponse response, boolean success, String message) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", success);

        if (!success) {
            jsonResponse.addProperty("message", message);
        }

        out.print(jsonResponse.toString());
        out.flush();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean handleNewDoctor(JsonObject jsonObject, DAOUser userDao) {
        DAODoctor doctor = new DAODoctor();
        String avatarBase64 = jsonObject.get("avatar").getAsString();
        String name = jsonObject.get("name").getAsString();
        String gender = jsonObject.get("gender").getAsString();
        String dob = jsonObject.get("dateOfBirth").getAsString();
        int specializationId = jsonObject.get("specializationId").getAsInt();
        int serviceId = jsonObject.get("serviceId").getAsInt();

        String phone = jsonObject.get("phoneNumber").getAsString();
        String email = jsonObject.get("email").getAsString();
        String password = jsonObject.get("password").getAsString();
        String position = jsonObject.get("position").getAsString();
        String address = jsonObject.get("address").getAsString();
        String description = jsonObject.get("description").getAsString();
        int yearsOfExperience = jsonObject.get("yearsOfExperience").getAsInt();
        System.out.println(name);
        System.out.println(gender);
        System.out.println(dob);
        String[] customerNameParts = name.split(" ");
        String customerLastName = customerNameParts[customerNameParts.length - 1];
        String customerFirstName = name.substring(0, name.lastIndexOf(customerLastName)).trim();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date currentDate = new Date();
        String createdAt = dateFormat.format(currentDate);
        int roleId = 2;
        String status = "1";
        User user = new User(status, customerFirstName, customerLastName, gender, email, password, address, phone, dob, avatarBase64, createdAt, roleId);
        int userId = userDao.addNewAccountAsDoctor(user);
        System.out.println(userId);
        if (userId == -1) {
            System.out.println("Failed to add new doctor");
            return false;
        } else {
            doctor.addDoctor(userId, serviceId, specializationId, description, position);
        }

        System.out.println("New doctor added successfully with user ID: " + userId);
        return true;
    }

    private boolean handleBookingUpdate(JsonObject jsonObject, DAOBooking bookingDAO) {
        try {

            int bookingId = jsonObject.get("bookingId").getAsInt();
            int status = jsonObject.get("status").getAsInt();
            int slotId = jsonObject.get("slotId").getAsInt();
            int slotStatus = jsonObject.get("slotStatus").getAsInt();
            String doctorName = jsonObject.get("doctorName").getAsString();
            String customerName = jsonObject.get("customerName").getAsString();
            String[] doctorNameParts = doctorName.split(" ");
            String doctorLastName = doctorNameParts[doctorNameParts.length - 1];
            String doctorFirstName = doctorName.substring(0, doctorName.lastIndexOf(doctorLastName)).trim();

            String[] customerNameParts = customerName.split(" ");
            String customerLastName = customerNameParts[customerNameParts.length - 1];
            String customerFirstName = customerName.substring(0, customerName.lastIndexOf(customerLastName)).trim();

            String day = jsonObject.get("day").getAsString();

            if (!bookingDAO.updateBookingByManager(bookingId, status, slotId, slotStatus, doctorFirstName, doctorLastName, customerFirstName, customerLastName, day)) {
                // Log và xử lý nếu cập nhật không thành công
                System.out.println("Update failed for booking ID: " + bookingId);
                return false;
            }

            // Log thông tin cập nhật thành công
            System.out.println("Update successful for booking ID: " + bookingId);
            return true;

        } catch (Exception ex) {
            Logger.getLogger(managerDashboard.class
                    .getName()).log(Level.SEVERE, "Error processing JSON object for booking update", ex);
            return false;
        }
    }

    private boolean handleSelectOffSlot(JsonObject jsonObject, DAOSlotDoctor slotDoctorDao) {
        int doctorId = jsonObject.get("doctorId").getAsInt();
        int slotId = jsonObject.get("slotId").getAsInt();
        int slotStatus = jsonObject.get("slotStatus").getAsInt();
        String date = jsonObject.get("selectedDate").getAsString();
        String description = jsonObject.get("description").getAsString(); // Sửa từ "desciprtion" thành "description"
        System.out.println(doctorId);
        System.out.println(slotId);
        System.out.println(slotStatus);
        System.out.println(date);
        System.out.println(description);

        if (slotDoctorDao.addSlotDoctor(doctorId, slotId, slotStatus, description, date) == -1) {
            System.out.println("Failed to add new doctor");
            return false;
        }

        return true;
    }

}
