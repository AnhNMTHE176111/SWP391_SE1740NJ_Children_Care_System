/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managerFeature;

import DAO.DAODoctor;
import DAO.DAOService;
import DAO.DAOSpecialty;
import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Doctor;
import model.Service;
import model.Specialty;
import model.User;

/**
 *
 * @author Admin
 */
public class manageServiceController extends HttpServlet {

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
            out.println("<title>Servlet manageServiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageServiceController at " + request.getContextPath() + "</h1>");
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
        User currentUser = (User) session.getAttribute("user");
        DAOService d = new DAOService();
        
        if (currentUser != null && currentUser.getRoleId() == 3) {
            int itemsPerPage = 5;
            String page = request.getParameter("page");
            int currentPage = 1;
            if (page != null) {
                currentPage = Integer.parseInt(page);
            }
            int totalItems = d.getTotalItemCount();
            int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
            ArrayList<Service> listService = d.getListServiceForManager(currentPage, itemsPerPage);
            
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("list", listService);
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("403.jsp").forward(request, response);
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
        String delete = request.getParameter("delete");
        String change = request.getParameter("change");
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        int docId = Integer.parseInt(request.getParameter("docId"));
        DAOService DaoService = new DAOService();
        DAODoctor DaoDoctor = new DAODoctor();
        DAOSpecialty DaoSpecialty = new DAOSpecialty();

        if (delete != null) {
            DaoService.deleteServiceById(serviceId, docId);
            response.sendRedirect("/manageService");
        } else if (change != null) {
            Service s = DaoService.getServiceForManagerById(docId, serviceId);
            ArrayList<Doctor> doctorList = DaoDoctor.getListDoctor();
            request.setAttribute("service", s);
            request.setAttribute("doctorList", doctorList);
            request.getRequestDispatcher("manageChangeService.jsp").forward(request, response);
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
