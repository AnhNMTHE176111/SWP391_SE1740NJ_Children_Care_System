/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOUser;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author dmx
 */
@MultipartConfig
public class changeProfile extends HttpServlet {

    protected String PATH = System.getProperty("user.dir") + "\\web\\image\\profile_user";

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
            out.println("<title>Servlet changeProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changeProfile at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("home");
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
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String dob = request.getParameter("dob");
        Part filePart = request.getPart("imageFile");

        DAOUser daoUser = new DAOUser();
        User user = (User) request.getSession().getAttribute("user");

        // get path
        String uploadDir = getServletContext().getRealPath("").split("build")[0] + "web\\image\\profile_user";;

        // push file
        String fileName = "user" + user.getUserId() + ".jpg";
        File file = new File(uploadDir, fileName);
        if (file.exists()) {
            file.delete();
        }

        Files.copy(filePart.getInputStream(), file.toPath());

        daoUser.updateProfile(fName, lName, phone, address, dob, "image/profile_user/" + fileName, email);
        request.getSession().setAttribute("user", daoUser.getUserByEmailAndPassword(email, user.getPassword()));
        request.getSession().setAttribute("name", daoUser.getUserByEmailAndPassword(email, user.getPassword()).getFirstName() + " " + daoUser.getUserByEmailAndPassword(email, user.getPassword()).getLastName());

        try {
            Thread.sleep(1800);
            response.sendRedirect("home");
        } catch (InterruptedException ex) {
            Logger.getLogger(changeProfile.class.getName()).log(Level.SEVERE, null, ex);
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
