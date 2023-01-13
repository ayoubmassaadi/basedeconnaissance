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
public class SolutionTicket extends HttpServlet {
    Connection con,con1;
    Statement state;
    Statement state1,state2;

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
            out.println("<title>Servlet SolutionTicket</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SolutionTicket at " + request.getContextPath() + "</h1>");
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
            System.out.print("data good");
            //get the session
            HttpSession sess=request.getSession();
            Object idticketaffecte=sess.getAttribute("idticketaffecte");
            con=MyConnection.getMyConnection();
//            con1=MyConnection.getMyConnection();
            state=con.createStatement();
            state1=con.createStatement();
            state2=con.createStatement();
            ResultSet data=state.executeQuery("select * from TICKETAFFECTÉES where ID_TICKETAFFECT="+idticketaffecte);

//            ResultSet dataHistTicket=state1.executeQuery("select * from ticket "
//                    + "join employee on(ticket.id_employe=employee.id_employe) "
//                    + "join demande on(employee.id_employe=demande.id_employe) where id_demande="+sess.getAttribute("idDemande"));

            int i=0;
            if(data.next()){
                System.out.print("data good");
                i=state1.executeUpdate("insert into HISTORIQUETICKET values(SEQUEHISTORTICKET.NEXTVAL,'"+data.getInt("ID_INTERVENANT")+"','"
                        +data.getString("NOM_EMPLOYE")+"','"+data.getString("PRENOM_EMPLOYE")
                        +"','"+data.getString("description")+"','"+data.getString("TYPE_PROBLEME_TICKET")
                        +"',to_date('"+data.getDate("DATE_CREATION_TICKET")+"','YYYY-MM-DD'),'"
                        +request.getParameter("solution")+"','"+data.getInt("telephone")+"')");
}

//check the data if exist
//            int check=0;
//            Object id_ticket=0;
//            if(dataHistTicket.next()){
//                id_ticket=dataHistTicket.getInt("ID_TICKET");
//                System.out.print("datahistorTicket");
//                check=state1.executeUpdate("insert into HISTORIQUETICKET values(SEQUEHISTORTICKET.NEXTVAL,'"+idIntervenant+"','"
//                        +dataHistTicket.getString("NOM_EMPLOYE")+"','"+dataHistTicket.getString("PRENOM_EMPLOYE")
//                        +"','"+dataHistTicket.getString("description")+"','"+dataHistTicket.getString("TYPE_PROBLEME_DEMANDE")
//                        +"',to_date('"+dataHistTicket.getDate("DATE_CREATION_TICKET")+"','YYYY-MM-DD'))");
//            }

            //check if the data is insert and delete the ticket
            if(i!=0){
                state.executeUpdate("delete from TICKETAFFECTÉES where ID_TICKETAFFECT="+idticketaffecte);
                response.sendRedirect("views/demandes.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SolutionTicket.class.getName()).log(Level.SEVERE, null, ex);
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