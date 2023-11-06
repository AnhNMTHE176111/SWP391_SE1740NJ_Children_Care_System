/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerFeature;

import DAO.DAODoctor;
import DAO.DAOService;
import DAO.DAOSpecialty;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Doctor;
import model.Specialty;

/**
 *
 * @author Admin
 */
public class manageAddServiceController extends HttpServlet {

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
            out.println("<title>Servlet manageAddServiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageAddServiceController at " + request.getContextPath() + "</h1>");
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
        DAODoctor DaoDoctor = new DAODoctor();
        DAOSpecialty DaoSpecialty = new DAOSpecialty();
        ArrayList<Doctor> listDoctor = DaoDoctor.getListDoctor();
        request.setAttribute("listDoctor", listDoctor);
        request.getRequestDispatcher("manageAddService.jsp").forward(request, response);
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
        String doctorId = request.getParameter("Doctor");
        String serviceName = request.getParameter("serviceName");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        DAOService d = new DAOService();
        String mess1 = "Add service successfully";
        String mess = "Add service unsuccessfully";
        boolean checkAddService = d.addNewService(doctorId, serviceName, price, description);
        if (checkAddService) {
            request.setAttribute("mess1", mess1);
        } else {
            request.setAttribute("mess", mess);
        }
        DAODoctor DaoDoctor = new DAODoctor();
        ArrayList<Doctor> listDoctor = DaoDoctor.getListDoctor();
        request.setAttribute("listDoctor", listDoctor);
        response.sendRedirect("/manageService");

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
