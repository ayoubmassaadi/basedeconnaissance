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
public class Register extends HttpServlet {
    Connection con;
    Statement state,state1,state2;
    ResultSet checkEmploye,checkIntervenant,checkAdministrateur;
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
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
            //create connection
            con=MyConnection.getMyConnection();
            state=con.createStatement();
            state1=con.createStatement();
            state2=con.createStatement();
//            HttpSession sess=request.getSession();
            String nom=request.getParameter("nom");
            String prenom=request.getParameter("prenom");
            String email=request.getParameter("email");
            String typeProfile=request.getParameter("typeProfiles");
            String password=request.getParameter("password");
            
            //check if intervenant and employe and  if exist already
            checkIntervenant=state.executeQuery("select * from Intervenant where EMAIL_INTERVENANT like '"+email+"'");
            checkEmploye=state2.executeQuery("select * from employee where EMAIL_EMPLOYE like '"+email+"'");
            checkAdministrateur=state1.executeQuery("select * from administrateur where EMAIL_ADMIN like '"+email+"'");
            
            int count=0;
            System.out.println(email);
            System.out.println(typeProfile);
            //insert into intervenant
            boolean exist=false;
            System.out.println(count);
            
            if(!(checkAdministrateur.next()) && !(checkEmploye.next()) && !(checkIntervenant.next())){
                if(typeProfile.equalsIgnoreCase("Technicien")){
                    state.executeUpdate("insert into intervenant values(SEQUEINTERVENANT.NEXTVAL"+",'"+nom+"','"+prenom
                            +"','"+email+"','"+password+"','"+typeProfile+"')");
                    response.sendRedirect("views/succes.jsp");
                }
                if(typeProfile.equalsIgnoreCase("Chef de service Hsolution")){
                    state1.executeUpdate("insert into administrateur values(ADMINSEQUENCE.NEXTVAL"+",'"+nom+"','"+prenom
                            +"','"+email+"','"+password+"','"+typeProfile+"')");
                    response.sendRedirect("views/succes.jsp");
                }
                if(typeProfile.equalsIgnoreCase("Agent developement") || typeProfile.equalsIgnoreCase("Chef de branche") || typeProfile.equalsIgnoreCase("Employe") || typeProfile.equalsIgnoreCase("Ingenieur") || typeProfile.equalsIgnoreCase("Directeur") || typeProfile.equalsIgnoreCase("Chef departement")){
                    state2.executeUpdate("insert into employee values(SEQUEEMPLOYE.NEXTVAL,''"+",'"+nom+"','"+prenom
                            +"','"+email+"','"+password+"','"+typeProfile+"')");
                    response.sendRedirect("views/succes.jsp");
                }
            }else{
                exist=true;
                request.setAttribute("compte", exist);
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            }    
            
//            if(!(checkAdministrateur.next()) || !(checkAdministrateur.next()) || !(checkAdministrateur.next())){
//                if(typeProfile.equalsIgnoreCase("Ingénieur") || typeProfile.equalsIgnoreCase("Technicien") || typeProfile.equalsIgnoreCase("Directeur") || typeProfile.equalsIgnoreCase("Chef departement")){
//                    state.executeUpdate("insert into intervenant values(SEQUEINTERVENANT.NEXTVAL"+",'"+nom+"','"+prenom
//                            +"','"+email+"','"+password+"','"+typeProfile+"')");
//                    response.sendRedirect("views/login.jsp");
//                }
//            }else{
//                exist=true;
//                request.setAttribute("compte", exist);
//                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
//            }    
//            //insert into administrateur
//            if(!(checkAdministrateur.next()) || !(checkAdministrateur.next()) || !(checkAdministrateur.next())){
//                if(typeProfile.equalsIgnoreCase("Agent developement") || typeProfile.equalsIgnoreCase("Chef de branche")){
//                    state1.executeUpdate("insert into administrateur values(ADMINSEQUENCE.NEXTVAL"+",'"+nom+"','"+prenom
//                            +"','"+email+"','"+password+"','"+typeProfile+"')");
//                    response.sendRedirect("views/login.jsp");
//                }
//            }else{
//                exist=true;
//                request.setAttribute("compte", exist);
//                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
//            }    
//            //insert into employee
//            if(!(checkAdministrateur.next()) || !(checkAdministrateur.next()) || !(checkAdministrateur.next())){
//                if(typeProfile.equalsIgnoreCase("Employe")){
//                    state2.executeUpdate("insert into employee values(SEQUEEMPLOYE.NEXTVAL,''"+",'"+nom+"','"+prenom
//                            +"','"+email+"','"+password+"','"+typeProfile+"')");
//                    response.sendRedirect("views/login.jsp");
//                }
//            }else{
//                exist=true;
//                request.setAttribute("compte", exist);
//                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
//            }    
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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