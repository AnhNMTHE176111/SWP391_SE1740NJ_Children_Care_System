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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author dmx
 */
public class filterUser extends HttpServlet {

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
            out.println("<title>Servlet filterUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterUser at " + request.getContextPath() + "</h1>");
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
        ArrayList<User> data = (ArrayList<User>) session.getAttribute("filterData");
        ArrayList<User> listFilteredUser = new ArrayList<>();

        String page = request.getParameter("page");
        int pageInt = 1;
        if (page != null) {
            pageInt = Integer.parseInt(page);
        }
        int begin = 10 * (pageInt - 1);
        int end = 10 * pageInt > data.size() ? data.size() : 10 * pageInt;
        for (int i = begin; i < end; i++) {
            listFilteredUser.add(data.get(i));
        }
        request.setAttribute("currentPage", pageInt);
        request.setAttribute("totalPages", Math.ceil((float) (data.size() / 10.0)));
        request.setAttribute("currentLinkPage", "filter-user");
        request.setAttribute("listUser", listFilteredUser);
        request.getRequestDispatcher("admin_Dashboard_ListUser.jsp").forward(request, response);
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

        String address = request.getParameter("addressFilter");
        String phone = request.getParameter("phoneFilter");
        String dobFrom = request.getParameter("dobFromFilter");
        String dobTo = request.getParameter("dobToFilter");
        String createdFrom = request.getParameter("createdFromFilter");
        String createdTo = request.getParameter("createdToFilter");
        String roleid = request.getParameter("roleidFilter");
        String status = request.getParameter("statusFilter");
        String gender = request.getParameter("genderFilter");
         
        // set filtered attribute
        session.setAttribute("addressFilter", address);
        session.setAttribute("phoneFilter", phone);
        session.setAttribute("dobFromFilter", dobFrom);
        session.setAttribute("dobToFilter", dobTo);
        session.setAttribute("createdFromFilter", createdFrom);
        session.setAttribute("createdToFilter", createdTo);
        session.setAttribute("roleidFilter", roleid);
        session.setAttribute("statusFilter", status);
        session.setAttribute("genderFilter", gender);

        DAOUser userDao = new DAOUser();
        ArrayList<User> data = userDao.filterUser(address, phone, dobFrom, dobTo, createdFrom, createdTo, roleid, status, gender);

        ArrayList<User> listFilteredUser = new ArrayList<>();

        int pageInt = 1;
        int begin = 10 * (pageInt - 1);
        int end = 10 * pageInt > data.size() ? data.size() : 10 * pageInt;
        for (int i = begin; i < end; i++) {
            listFilteredUser.add(data.get(i));
        }
        
        session.setAttribute("filterData", data);
        request.setAttribute("currentPage", pageInt);
        request.setAttribute("totalPages", Math.ceil((float) (data.size() / 10.0)));
        request.setAttribute("currentLinkPage", "filter-user");
        request.setAttribute("listUser", listFilteredUser);
        request.getRequestDispatcher("admin_Dashboard_ListUser.jsp").forward(request, response);
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
