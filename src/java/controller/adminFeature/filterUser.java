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
import java.util.ArrayList;
import model.User;

/**
 *
 * @author dmx
 */
public class filterUser extends HttpServlet {
   
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
            out.println("<title>Servlet filterUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterUser at " + request.getContextPath () + "</h1>");
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
        String address = request.getParameter("addressFilter");
        String phone = request.getParameter("phoneFilter");
        String dobFrom = request.getParameter("dobFromFilter");
        String dobTo = request.getParameter("dobToFilter");
        String createdFrom = request.getParameter("createdFromFilter");
        String createdTo = request.getParameter("createdToFilter");
        String roleid = request.getParameter("roleidFilter");
        String status = request.getParameter("statusFilter");
        String gender = request.getParameter("genderFilter");
        System.out.println("addess: " + address);
        System.out.println("phone: " + phone);
        System.out.println("dobFrom: " + dobFrom);
        System.out.println("dobTo: " + dobTo);
        System.out.println("createdFrom: " + createdFrom);
        System.out.println("createdTo: " + createdTo);
        System.out.println("roleid: " + roleid);
        System.out.println("status: " + status);
        System.out.println("gender: " + gender);
        DAOUser userDao = new DAOUser();
        ArrayList<User> listFilteredUser = 
                userDao.filterUser(address, phone, dobFrom, dobTo, createdFrom, createdTo, roleid, status, gender);
        System.out.println("listFilterUSer: " + listFilteredUser.size());
        request.setAttribute("listUser", listFilteredUser);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}