/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOUser;

import java.io.IOException;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.PrintWriter;

import model.User;


/**
 *
 * @author letie
 */
@WebServlet(name = "forgotPassword", urlPatterns = {"/forgot"})
public class forgotPassword extends HttpServlet {

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
            out.println("<title>Servlet forgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forgotPassword at " + request.getContextPath() + "</h1>");
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
       String email = request.getParameter("email");
        String codeString = request.getParameter("code");
        String newpassword = request.getParameter("newpassword");
        String repassword = request.getParameter("repassword");
        DAOUser userDao = new DAOUser();
        //Get the user's account information
        User user = userDao.getUserByEmail(email);
        boolean valid = true;
        
        if (codeString != null && codeString.matches("\\d+")) {
            int code = Integer.parseInt(codeString);
            HttpSession session = request.getSession();
            int storedCode = (int) session.getAttribute("code");


            if (code == storedCode) {
                valid = true;
            } else {
                valid = false;
                request.setAttribute("mess", "Verification code is incorrect!");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }
        } else {
            valid = false;
            request.setAttribute("mess", "Verification codes can only be numbers!");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
        
        //Check if the new password is entered in the correct system format
        if (!newpassword.matches(".*[0-9].*") || !newpassword.matches(".*[A-Z].*")) {
            valid = false;
            String mess = "Password must contain at least one digit and one uppercase letter!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
        //Check the length of the new password
        if (newpassword.length() < 8) {
            valid = false;
            String mess = "Password must be at least 8 characters!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
        //Check to see if the old password matches
        if (!repassword.equals(newpassword)) {
            valid = false;
            String mess = "Re-entered password is incorrect!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
        
        if(valid == true){
            //Update new password for users
            user.setPassword(repassword);
            userDao.updatePasswordByEmail(user);
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