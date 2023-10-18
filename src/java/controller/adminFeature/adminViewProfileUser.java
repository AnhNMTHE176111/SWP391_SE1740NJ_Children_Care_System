/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.adminFeature;

import DAO.DAOUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author dmx
 */
public class adminViewProfileUser extends HttpServlet {

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
            out.println("<title>Servlet adminViewProfileUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminViewProfileUser at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String userId = request.getParameter("userId");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String roleid = request.getParameter("roleid");
        String status = request.getParameter("status");
        String gender = request.getParameter("gender");
        DAOUser userDao = new DAOUser();

        boolean valid = true;
        //Use a regular expression to check the firstname and lastname entered
        if (!firstName.matches("^[A-Z][a-zA-Z ].*$") || !lastName.matches("^[A-Z][a-zA-Z ].*$")) {
            valid = false;
            String mess = "First name and last name must start with an uppercase letter and contain only letters.";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("/user-profile?userId=" + userId).forward(request, response);
        }
        //If the above conditions are satisfied
        if (valid == true) {
            //update profile user
            userDao.updateProfileByAdmin(firstName, lastName, address, phone, dob, roleid, status, gender, userId);
            //Notification of successful registration
            String mess = "Update Profile User Successfully";
            request.setAttribute("mess1", mess);
            User user = (new DAOUser()).getUserById(userId);
            request.setAttribute("userViewing", user);
            request.getRequestDispatcher("admin_Dashboard_ViewProfileUser.jsp").forward(request, response);
        }
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
