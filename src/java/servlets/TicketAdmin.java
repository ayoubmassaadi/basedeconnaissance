/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * @author ayoub
 */
public class TicketAdmin extends HttpServlet {
    Connection con;
    Statement state,state1,state2;
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
            out.println("<title>Servlet TicketAdmin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketAdmin at " + request.getContextPath() + "</h1>");
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
            System.out.println(request.getParameter("telephone"));
            System.out.println(request.getParameter("typeProfiles"));
            HttpSession sess=request.getSession();
            Object idAdmin=sess.getAttribute("idAdministrateur");
            System.out.println(idAdmin);
            con=MyConnection.getMyConnection();
            state=con.createStatement();
            state1=con.createStatement();
            state2=con.createStatement();
            
            ResultSet data=state2.executeQuery("select * from intervenant where id_intervenant="+request.getParameter("typeProfiles"));
            
            //
            int check=0;
            if(data.next()){
                
                check=state.executeUpdate("insert into TICKETAFFECTÉES values(SEQUETICKETAFFECTE.NEXTVAL,'"+request.getParameter("typeProfiles")+"','"
                        +idAdmin+"','"+request.getParameter("nom")+"','"+request.getParameter("prenom")+"','"
                        +request.getParameter("description")+"','"+request.getParameter("typeprobleme")
                        +"',to_date('"+request.getParameter("datecreationticket")
                        +"','YYYY/MM/DD'),'"+request.getParameter("telephone")+"','"+data.getString("NOM_INTERVENANT")+" "+data.getString("PRENOM_INTERVENANT")
                        +"')");
                
            }
            System.out.println(check);
            if(check!=0){
                state1.executeUpdate("delete from ticket where ID_TICKET="+request.getParameter("idTicket"));
                response.sendRedirect("views/ticketsAdmin.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TicketAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
