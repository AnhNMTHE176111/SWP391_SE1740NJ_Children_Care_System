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
public class adminManageUser extends HttpServlet {

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
            out.println("<title>Servlet adminManageUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminManageUser at " + request.getContextPath() + "</h1>");
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
        DAOUser daoUser = new DAOUser();
        ArrayList<User> data = daoUser.getListUser();
        ArrayList<User> listUser = new ArrayList<>();
        String page = request.getParameter("page");
        String currentLinkPage = request.getParameter("currentLinkPage");
        
        // pageination
        int pageInt = 1;
        if (page != null) {
            pageInt = Integer.parseInt(page);
        }
        int begin = 10 * (pageInt - 1);
        int end = 10 * pageInt > data.size() ? data.size() : 10 * pageInt;
        for (int i = begin; i < end; i++) {
            listUser.add(data.get(i));
        }
        
        request.setAttribute("currentLinkPage", currentLinkPage);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", Math.ceil((float) (data.size() / 10.0)));
        request.setAttribute("listUser", listUser);
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
        String username = request.getParameter("username");
        DAOUser daoUser = new DAOUser();
        ArrayList<User> listUser = daoUser.getListUserByName(username);
        request.setAttribute("listUser", listUser);
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
