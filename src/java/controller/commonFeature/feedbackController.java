/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOFeedback;
import DAO.DAOPost;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;

/**
 *
 * @author admin
 */
public class feedbackController extends HttpServlet {

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
            out.println("<title>Servlet feedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet feedbackController at " + request.getContextPath() + "</h1>");
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
        String medicalInfoId = request.getParameter("medicalInfoId");
        String doctorId = request.getParameter("doctorId");
        String id = request.getParameter("id");
        String content = request.getParameter("vote");
        String comment = request.getParameter("comment");

        DAOFeedback dao = new DAOFeedback();
        if (dao.checkFeedbackExist(medicalInfoId)) {
            dao.updateFeedback(medicalInfoId, content, comment);
        } else {
            dao.addFeedback(medicalInfoId, content, comment);
        }
        Feedback feedback = dao.getFeedback(medicalInfoId);
        System.out.println(feedback.toString());
        request.setAttribute("feedback", feedback);
        response.sendRedirect("information?get&id=" + id + "&doctorId=" + doctorId + "&feedbackId=" + medicalInfoId);
    }
}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
