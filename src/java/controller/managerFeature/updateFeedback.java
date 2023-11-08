/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.managerFeature;

import DAO.DAOFeedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Feedback;

/**
 *
 * @author ASUS
 */
@WebServlet(name="updateFeedback", urlPatterns={"/feedbackupdate"})
public class updateFeedback extends HttpServlet {
   
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
            out.println("<title>Servlet updateFeedback</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateFeedback at " + request.getContextPath () + "</h1>");
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
        String ratingId = request.getParameter("id");
        int rateId = Integer.parseInt(ratingId);
        DAOFeedback feedbackDao = new DAOFeedback();
        Feedback ManageFeedback = feedbackDao.getListManageFeedbackByRateId(rateId);
        request.setAttribute("feedbackUpdate", ManageFeedback);
        request.getRequestDispatcher("updateFeedback.jsp").forward(request, response);
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
        String rateValue = request.getParameter("rate");
        String ratingId = request.getParameter("ratingId");
        int rateId = Integer.parseInt(ratingId);
        DAOFeedback feedbackDao = new DAOFeedback();
        int updateFeedback = feedbackDao.updateFeedbackByRateId(rateValue, rateId);
        Feedback ManageFeedback = feedbackDao.getListManageFeedbackByRateId(rateId);
        String mess = "Updated feedback successfully!";
        request.setAttribute("feedbackUpdate", ManageFeedback);
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("updateFeedback.jsp").forward(request, response);
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
