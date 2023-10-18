/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOPost;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Post;

/**
 *
 * @author admin
 */
public class postController extends HttpServlet {

    public static void main(String[] args) {
        DAO.DAOPost Postdao = new DAOPost();
        List<Post> listP = Postdao.getListPost();

        if (listP != null && !listP.isEmpty()) {
            // listP has data
            for (Post post : listP) {
                System.out.println(post); // In thông tin của mỗi bài đăng
            }
        } else {
            // listP is empty or null
            System.out.println("listP is empty or null");
            // You may want to handle this case differently, e.g., show an error message.
        }

    }

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
        DAOPost Postdao = new DAOPost();
        ArrayList<String> listIntro = new ArrayList<>();
        
        ArrayList<Post> listP = Postdao.getListPost();
        for (Post post : listP) {
            String intro = post.getContent().substring(0, 150) + "...";
            listIntro.add(intro);
        }
        
        
        request.setAttribute("listP", listP);
        request.setAttribute("listIntro", listIntro);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
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
