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
public class Login extends HttpServlet {
    Connection con;
    Statement state,state1,state2;
    ResultSet dataEmploye,checkEmploye;
    ResultSet dataIntervenant,checkIntervenant;
    ResultSet dataAdministrateur,checkAdministrateur;
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
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        try {
            //take the data from fields
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            //create a session
            HttpSession sess=request.getSession();
            //create connection to data base
            con=MyConnection.getMyConnection();
            state=con.createStatement();
            
            state1=con.createStatement();
            
            state2=con.createStatement();
            Statement state3=con.createStatement();
            Statement state4=con.createStatement();
            Statement state5=con.createStatement();
            
            dataEmploye=state.executeQuery("select * from employee where EMAIL_EMPLOYE='"+email+"' and MOTDEPASSE_EMPLOYE='"+password+"'");
            dataIntervenant=state1.executeQuery("select * from intervenant where EMAIL_INTERVENANT='"+email+"' and MOTDEPASSE_INTERVENANT='"+password+"'");
            dataAdministrateur=state2.executeQuery("select * from administrateur where EMAIL_ADMIN='"+email+"' and MOTDEPASSE_ADMIN='"+password+"'");
            //update the cursor
            
            checkEmploye=state3.executeQuery("select * from employee where EMAIL_EMPLOYE='"+email+"' and MOTDEPASSE_EMPLOYE='"+password+"'");
            checkIntervenant=state4.executeQuery("select * from intervenant where EMAIL_INTERVENANT='"+email+"' and MOTDEPASSE_INTERVENANT='"+password+"'");
            checkAdministrateur=state5.executeQuery("select * from administrateur where EMAIL_ADMIN='"+email+"' and MOTDEPASSE_ADMIN='"+password+"'");
            
            System.out.println(email+" "+password);
            boolean existCompte=false;
            if(!(dataAdministrateur.next()) && !(dataEmploye.next()) && !(dataIntervenant.next())){
                System.out.println("erreur");
                System.out.println("erreur");
                request.setAttribute("existCompte", existCompte);
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
            else if(checkEmploye.next()){
                existCompte=true;
                System.out.println("ayoub employe");
                String id=checkEmploye.getString("ID_EMPLOYE");
                String nom=checkEmploye.getString("NOM_EMPLOYE");
                String prenom=checkEmploye.getString("PRENOM_EMPLOYE");
                sess.setAttribute("idEmploye", id);
                sess.setAttribute("nom", nom);
                sess.setAttribute("prenom", prenom);
                response.sendRedirect("views/Employe.jsp");
            }else if(checkIntervenant.next()){
                existCompte=true;
                String id=checkIntervenant.getString("ID_INTERVENANT");
                String nom=checkIntervenant.getString("NOM_INTERVENANT");
                String prenom=checkIntervenant.getString("PRENOM_INTERVENANT");
                sess.setAttribute("idIntervenant", id);
                sess.setAttribute("nom", nom);
                sess.setAttribute("prenom", prenom);
                response.sendRedirect("views/Intervenant.jsp");
            }else if(checkAdministrateur.next()){
                existCompte=true;
                System.out.println("admin");
                String id=checkAdministrateur.getString("ID_ADMINISTRATEUR");
                String nom=checkAdministrateur.getString("NOM_ADMIN");
                String prenom=checkAdministrateur.getString("PRENOM_ADMIN");
                sess.setAttribute("idAdministrateur", id);
                sess.setAttribute("nom", nom);
                sess.setAttribute("prenom", prenom);
                response.sendRedirect("views/administrateur.jsp");
            }
            
            
            
            
            
            
            //old code
//            boolean exist=false;
////            check the data if exist
//            dataEmploye=state.executeQuery("select * from employee where EMAIL_EMPLOYE='"+email+"' and MOTDEPASSE_EMPLOYE='"+password+"'");
//            if(dataEmploye.next()){
//                System.out.println("ayoub");
//                String id=dataEmploye.getString("ID_EMPLOYE");
//                String nom=dataEmploye.getString("NOM_EMPLOYE");
//                String prenom=dataEmploye.getString("PRENOM_EMPLOYE");
//                sess.setAttribute("idEmploye", id);
//                sess.setAttribute("nom", nom);
//                sess.setAttribute("prenom", prenom);
//                response.sendRedirect("views/Employe.jsp");
//            }
//
//            dataIntervenant=state.executeQuery("select * from intervenant where EMAIL_INTERVENANT='"+email+"' and MOTDEPASSE_INTERVENANT='"+password+"'");
//            if(dataIntervenant.next()){
//                String id=dataIntervenant.getString("ID_INTERVENANT");
//                String nom=dataIntervenant.getString("NOM_INTERVENANT");
//                String prenom=dataIntervenant.getString("PRENOM_INTERVENANT");
//                sess.setAttribute("idIntervenant", id);
//                sess.setAttribute("nom", nom);
//                sess.setAttribute("prenom", prenom);
//                response.sendRedirect("views/Intervenant.jsp");
//            }
//            
//            dataAdministrateur=state.executeQuery("select * from administrateur where EMAIL_ADMIN='"+email+"' and MOTDEPASSE_ADMIN='"+password+"'");
//            if(dataAdministrateur.next()){
//                System.out.println("admin");
//                String id=dataAdministrateur.getString("ID_ADMINISTRATEUR");
//                String nom=dataAdministrateur.getString("NOM_ADMIN");
//                String prenom=dataAdministrateur.getString("PRENOM_ADMIN");
//                sess.setAttribute("idAdministrateur", id);
//                sess.setAttribute("nom", nom);
//                sess.setAttribute("prenom", prenom);
//                response.sendRedirect("views/administrateur.jsp");
//            }

        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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