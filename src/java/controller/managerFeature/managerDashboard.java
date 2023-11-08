/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerFeature;

import DAO.DAOBooking;
import DAO.DAOFeedback;
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
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.Booking;
import model.Feedback;

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
        try ( PrintWriter out = response.getWriter()) {
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
        //  HttpSession session = request.getSession();
//        if (String.valueOf(session.getAttribute("roleId")).equals("null")) {
//            response.sendRedirect("403.jsp");
//        } else {
//            int roleId = Integer.parseInt(String.valueOf(session.getAttribute("roleId")));
//            if (roleId == 3) {
        DAOBooking booking = new DAOBooking();
        DAOFeedback feedbackDao = new DAOFeedback();//AnhLT do
        List<Booking> reservationList = booking.getBookingList();
        List<Booking> reservationListForManage = booking.getBookingListForManage();
        List<Feedback> listManageFeedback = feedbackDao.getListManageFeedback();//AnhLT do
        request.setAttribute("listManageFeedback", listManageFeedback);//AnhLT do
        HttpSession session = request.getSession();
        if (String.valueOf(session.getAttribute("roleId")).equals("null") || Integer.parseInt(String.valueOf(session.getAttribute("roleId"))) != 3) {
            response.sendRedirect("403.jsp");
        }
        request.setAttribute("reservationListForManage", reservationListForManage);
        request.setAttribute("reservationList", reservationList);
        request.getRequestDispatcher("managerDashboard.jsp").forward(request, response);

//            } else {
//                response.sendRedirect("403.jsp");
//            }
//        }
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
        boolean success = true;
        DAOBooking bookingDAO = new DAOBooking();

        // Đọc dữ liệu từ request body
        String jsonData = new BufferedReader(request.getReader()).lines().collect(Collectors.joining("\n"));

        Gson gson = new Gson();
        JsonArray jsonArray;
        try {
            jsonArray = gson.fromJson(jsonData, JsonArray.class);
        } catch (JsonSyntaxException ex) {
            Logger.getLogger(managerDashboard.class.getName()).log(Level.SEVERE, "Failed to parse JSON", ex);
            sendResponse(response, false, "Invalid JSON format");
            return;
        }

        // Duyệt qua mỗi đối tượng trong jsonArray và xử lý
        for (JsonElement element : jsonArray) {
            try {
                JsonObject jsonObject = element.getAsJsonObject();

                int bookingId = jsonObject.get("bookingId").getAsInt();
                int status = jsonObject.get("status").getAsInt();
                String startTime = jsonObject.get("startTime").getAsString();
                int slotStatus = jsonObject.get("slotStatus").getAsInt();
                String doctorName = jsonObject.get("doctorName").getAsString();
                String customerName = jsonObject.get("customerName").getAsString();
                String day = jsonObject.get("day").getAsString();

                if (!bookingDAO.updateBookingByManager(bookingId, status, startTime, slotStatus, doctorName, customerName, day)) {
                    success = false;
                    break;
                }

            } catch (Exception ex) {
                Logger.getLogger(managerDashboard.class.getName()).log(Level.SEVERE, "Error processing JSON object", ex);
                sendResponse(response, false, "Error processing data");
                return;
            }
        }

        sendResponse(response, success, success ? null : "Failed to update.");
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

}
