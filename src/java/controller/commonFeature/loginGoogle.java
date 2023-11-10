/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOCustomer;
import DAO.DAOUser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GooglePojo;
import model.GoogleUtils;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "loginGoogle", urlPatterns = {"/login-google"})
public class loginGoogle extends HttpServlet {

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
            out.println("<title>Servlet loginGoogle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginGoogle at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("code");
        DAOUser userDao = new DAOUser();
        DAOCustomer cusDao = new DAOCustomer();
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("firstname", googlePojo.getGiven_name());
            request.setAttribute("lastname", googlePojo.getFamily_name());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());
            request.setAttribute("avatar", googlePojo.getPicture());
            User user = userDao.getUserByEmail(googlePojo.getEmail());

            if (user.getEmail() != null) {
                session.setAttribute("user", user);
                session.setAttribute("roleId", user.getRoleId());
                session.setAttribute("name", user.getFirstName() + " " + user.getLastName());

                System.out.println("roleid: " + user.getRoleId());

                if (user.getRoleId() == 1) {
                    response.sendRedirect("home.jsp");
                }
                if (user.getRoleId() == 2) {
                    response.sendRedirect("staff");
                }
                if (user.getRoleId() == 3) {
                    response.sendRedirect("manage");
                }
                if (user.getRoleId() == 4) {
                    response.sendRedirect("admin");
                }

            } else {
                //Report an error when the user enters an incorrect email or password
                user = new User("1", googlePojo.getGiven_name(), googlePojo.getFamily_name(), googlePojo.getEmail(), googlePojo.getPicture(), 1);
                userDao.addNewAccountByGoogle(user);
                int userId = userDao.getLastUserId();
                cusDao.addCustomerByUserId(userId);
                session.setAttribute("user", user);
                session.setAttribute("roleId", user.getRoleId());
                session.setAttribute("name", user.getFirstName() + " " + user.getLastName());

                System.out.println("roleid: " + user.getRoleId());

                if (user.getRoleId() == 1) {
                    response.sendRedirect("home.jsp");
                }
                if (user.getRoleId() == 2) {
                    response.sendRedirect("staff");
                }
                if (user.getRoleId() == 3) {
                    response.sendRedirect("manage");
                }
                if (user.getRoleId() == 4) {
                    response.sendRedirect("admin");
                }
            }
        }
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
        doGet(request, response);
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
