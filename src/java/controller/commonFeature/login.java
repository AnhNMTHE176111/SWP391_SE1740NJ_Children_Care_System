/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAODoctor;
import DAO.DAOUser;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author dmx
 */
public class login extends HttpServlet {

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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("remember");
        Cookie cookieEmail = new Cookie("cEmail", email);
        Cookie cookiePass = new Cookie("cPass", password);
        Cookie cookieRemember = new Cookie("cRemember", rememberme);
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            password = DatatypeConverter.printHexBinary(digest).toUpperCase();
        } catch (NoSuchAlgorithmException e) {
        }

        if (rememberme != null) {
            cookieEmail.setMaxAge(60 * 60 * 24 * 7);//7 days
            cookiePass.setMaxAge(60 * 60 * 24 * 7);
            cookieRemember.setMaxAge(60 * 60 * 24 * 7);

        } else {
            cookieEmail.setMaxAge(0);
            cookiePass.setMaxAge(0);
            cookieRemember.setMaxAge(0);
        }
        //Ádd cookies to the response
        response.addCookie(cookieEmail);
        response.addCookie(cookiePass);
        response.addCookie(cookieRemember);
        DAOUser userDao = new DAOUser();
        //Check if the user exists by email
        User user = userDao.getUserByEmailAndPassword(email, password);
        if (user.getEmail() != null) {
            //Creates a session that stores the user's login session
            session.setAttribute("user", user);
            session.setAttribute("roleId", user.getRoleId());
            session.setAttribute("name", user.getFirstName() + " " + user.getLastName());

            DAODoctor doctorDao = new DAODoctor();
            if (user.getRoleId() == 2) {
                int docId = doctorDao.getDoctorIdByUserId(user.getUserId());
                session.setAttribute("docId", docId);
            }

            System.out.println("roleid: " + user.getRoleId());

            if (user.getRoleId() == 1) {
                response.sendRedirect("home.jsp");
            }
            if (user.getRoleId() == 2) {
                response.sendRedirect("staff");
            }
            if (user.getRoleId() == 3) {
                response.sendRedirect("manageDashboard");
            }
            if (user.getRoleId() == 4) {
                response.sendRedirect("admin");
            }
        } else {
            String mess = "Wrong email or password!";
            request.setAttribute("mess", mess);
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
