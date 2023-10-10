/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.commonFeature;

import DAO.DAOBooking;
import DAO.DAOCustomer;
import DAO.DAOSlotDoctor;
import DAO.DAOUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 *
 * @author tbin6
 */
@WebServlet(name="confirmOTPDataBooking", urlPatterns={"/confirmOTPDataBooking"})
public class confirmOTPDataBooking extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet confirmOTPDataBooking</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet confirmOTPDataBooking at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userOtp = request.getParameter("otp");
        String validOtp = (String) request.getSession().getAttribute("otp");

        if (userOtp.equals(validOtp)) {
            Map<String, String[]> userData = (Map<String, String[]>) request.getSession().getAttribute("userData");
            
            // Xử lý dữ liệu từ userData và lưu vào DB
            DAOCustomer customer = new DAOCustomer();
            DAOUser user = new DAOUser();
            DAOSlotDoctor slotDoctor = new DAOSlotDoctor();
            DAOBooking booking = new DAOBooking();

            String slotId = userData.get("selectedSlotId")[0];
            String doctorId = userData.get("doctorId")[0];
            String name = userData.get("name")[0];
            String gender = userData.get("gender")[0];
            String dob = userData.get("dob")[0];
            String phone = userData.get("phone")[0];
            String email = userData.get("email")[0];
            String symptoms = userData.get("symptoms")[0];
            
            int slotIdInt = Integer.parseInt(slotId);
            int doctorIdInt = Integer.parseInt(doctorId);
            int slotDoctorId = slotDoctor.addSlotDoctor(slotIdInt, doctorIdInt, 1);

            String[] parts = name.split("\\s+");
            String firstName = parts[0];
            String lastName = "";
            for (int i = 1; i < parts.length; i++) {
                lastName += parts[i] + " ";
            }
            lastName = lastName.trim();

            int roleId = 1;
            int addedUserId = user.addGuess(firstName, lastName, gender, email, phone, dob, roleId);
            int customerId = customer.addCustomer(addedUserId);
            
            int bookingId = booking.addBooking(0, customerId, slotDoctorId);

            request.getSession().removeAttribute("userData");
            request.getSession().removeAttribute("otp");

            response.sendRedirect("/success.jsp");
        } else {
            request.setAttribute("error", "Mã OTP không chính xác. Vui lòng thử lại.");
            request.getRequestDispatcher("/confirm-otp.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
