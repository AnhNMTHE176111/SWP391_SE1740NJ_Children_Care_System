/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import java.io.IOException;
import java.io.PrintWriter;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.DAOService;
import java.util.ArrayList;
import model.Doctor;
import model.Service;
import model.Specialty;

/**
 *
 * @author Admin
 */
public class serviceServlet extends HttpServlet {

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
            out.println("<title>Servlet service</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet service at " + request.getContextPath() + "</h1>");
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
        DAOService d = new DAOService();
        ArrayList<Service> service = d.getListService();
        request.setAttribute("service", service);
        ArrayList<Doctor> doc = d.getListDoctor();
        request.setAttribute("doc", doc);
        ArrayList<Specialty> spec = d.getListSpecialty();
        request.setAttribute("spec", spec);
        request.getRequestDispatcher("service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOService d = new DAOService();
        ArrayList<Service> serByDoc = d.getListServiceByDoctor();
        ArrayList<Service> serBySpec = d.getListServiceBySpecialty();
        ArrayList<Doctor> doc = d.getListDoctor();
        ArrayList<Specialty> spec = d.getListSpecialty();

        String id = request.getParameter("id");
        switch (id) {
            case "doctor":
                request.setAttribute("doc", doc);
                request.setAttribute("service", serByDoc);
                request.getRequestDispatcher("serviceByDoctor.jsp").forward(request, response);
                break;
            case "specialty":
                request.setAttribute("spec", spec);
                request.setAttribute("serBySpec", serBySpec);
                request.getRequestDispatcher("serviceBySpecialty.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("service");
                break;
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
