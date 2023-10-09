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
import java.io.IOException;
import java.io.PrintWriter;

import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

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
            out.println("<title>Servlet register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
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
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        DAOUser userDao = new DAOUser();
        //Check if email exists
        User u = userDao.checkEmailExist(email);
        boolean valid = true;
        //Use a regular expression to check the firstname and lastname entered
        if (!firstName.matches("^[A-Z][a-zA-Z ].*$") || !lastName.matches("^[A-Z][a-zA-Z ].*$")) {
            valid = false;
            String mess = "First name and last name must start with an uppercase letter and contain only letters.";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
        }
        
        //Check if email exists
        if (u.getEmail() != null) {
            //register fail
            valid = false;
            String mess = "This email already exists!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
        }
        //Use a regular expression to see if the user has set a password with the correct system format
        if (!password.matches(".*[0-9].*") || !password.matches(".*[A-Z].*")) {
            valid = false;
            String mess = "Password must contain at least one digit and one uppercase letter!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
        }
        //Check password length
        if (password.length() < 8) {
            valid = false;
            String mess = "Password must be at least 8 characters!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
        }
        //Check the repassword
        if (!rePassword.equals(password)) {
            valid = false;
            String mess = "Re-entered password is incorrect!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("registerAccount.jsp").forward(request, response);
        }
        //Initialize a new user
        User user = new User("1", firstName, lastName, email, password, address, phone, dob, "image/profile_user/default.jpg", 1);
        //If the above conditions are satisfied
        if (valid == true) {
            //Add a new user by email
            userDao.addNewAccountByEmail(user);
            //Notification of successful registration
            String mess = "Your account have been created!";
            request.setAttribute("mess1", mess);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
