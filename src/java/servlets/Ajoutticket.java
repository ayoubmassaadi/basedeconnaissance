/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IKRAM
 */
public class Ajoutticket extends HttpServlet {
    Connection con;
    Statement state;


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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Ajoutticket</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ajoutticket at " + request.getContextPath() + "</h1>");
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
        try {
            
            con=MyConnection.getMyConnection();
            state=con.createStatement();
            HttpSession sess=request.getSession();
//            String nom=request.getParameter("nom");
//            String prenom=request.getParameter("prenom");
//            String email=request.getParameter("email");
            String tel=request.getParameter("tel");
            String typeProb=request.getParameter("typeProb");
            String description =request.getParameter("description");
            Object id=sess.getAttribute("idEmploye");
            System.out.println(sess.getAttribute("idEmploye"));
            System.out.println(description);
            
            state.executeUpdate("insert into ticket values(SEQUETICKET.NEXTVAL,'"+id+"','','"+typeProb+"','"
                    +description+"',CURRENT_DATE,'"+tel+"')");
            response.sendRedirect("views/ajoutdemande.jsp");
            
            
            
//            con=MyConnection.getMyConnection();
//            state=con.createStatement();
//            Object idEmploye=request.getSession().getAttribute("idEmploye");
//            Object idIntervenant=request.getSession().getAttribute("idIntervenant");
//            state.executeUpdate("insert into ticket values(SEQUETICKET.NEXTVAL,'"+idEmploye+"','"+idIntervenant+"',CURRENT_DATE");
//            response.sendRedirect("views/ajoutticket.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Ajoutticket.class.getName()).log(Level.SEVERE, null, ex);
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
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}