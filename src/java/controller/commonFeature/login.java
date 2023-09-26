/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.commonFeature;

import DAO.DAOUser;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import model.Constants;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author dmx
 */
public class login extends HttpServlet {

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
        System.out.println(request.getParameter("code"));
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        User user = getUserInfo(accessToken);
        System.out.println(user);
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
<<<<<<< HEAD
    throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 
=======
            throws ServletException, IOException {
        processRequest(request, response);
    }
>>>>>>> 4b82ac45f754cb7988434ad7536c97f28d300711

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
<<<<<<< HEAD
        if (u != null) {
            //login successfull
            //create session
            session.setAttribute("user", u);
            System.out.println("Hhaha");
            //send direct with no parameter
            response.sendRedirect("/home");
=======
        String email = request.getParameter("email");

        String password = request.getParameter("password");
        String code = request.getParameter("code");
        if (code == null) {
            DAOUser userDao = new DAOUser();

            User user = userDao.getUserByEmailAndPassword(email, password);
            if (user.getEmail() != null) {

                session.setAttribute("name", user.getFirstName());
                //chuyen huong den trang home
                response.sendRedirect("home.jsp");
            } else {

                String mess = "Wrong email or password!";

                request.setAttribute("mess", mess);

                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
>>>>>>> 4b82ac45f754cb7988434ad7536c97f28d300711
        } else {
            String accessToken = getToken(code);
            DAOUser userDao = new DAOUser();
            User googleUser = getUserInfo(accessToken);
            if (googleUser.getEmail() != null) {
                System.out.println("Google email: " + googleUser.getEmail());
                session.setAttribute("name", googleUser.getEmail());
            }
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {

        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        User googlePojo = new Gson().fromJson(response, User.class);
        return googlePojo;
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
