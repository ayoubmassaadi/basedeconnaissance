<%-- 
    Document   : demandes_employé
    Created on : 17 nov. 2022, 09:44:02
    Author     : IKRAM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>historque demande</title>
       <link rel="stylesheet" href="../css/typicons.css">
        <link rel="stylesheet" href="../css/vendorbundle.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="../css/style.css">
  <link rel="shortcut icon" href="icone.png" />
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>

<body>
  <div class="container-scroller">

    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
           <a class="navbar-brand brand-logo" href=""><img src="solution.png"  alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href=".html"><img src="../../images/logo-mini.svg" alt="logo"/></a>
          <button class="navbar-toggler navbar-toggler align-self-center d-none d-lg-flex" type="button" data-toggle="minimize">
            <span class="fa fa-bars"></span>
          </button>
        </div>
        
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
         
            <!-- recherche--> 
            <ul class="navbar-nav mr-lg-2">
            <li class="nav-item  d-none d-lg-flex">
              <a style="color:grey; font-weight:lighter;" class="nav-link" href="Employe.jsp">
                knowledge
              </a>
            </li>
        </ul>
             <!-- recherche--> 
          <ul class="navbar-nav navbar-nav-right">

            <li class="nav-item dropdown d-flex">
              <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
                </a> 
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-success">
                      <i class="typcn typcn-info-large mx-0"></i>
                    </div>
                  </div>

                </a>

              </div>
            </li>
            <%
                HttpSession sess=request.getSession();
                Object id=sess.getAttribute("idEmploye");
                String prenom=(String)sess.getAttribute("prenom");
                String nom=(String)sess.getAttribute("nom");
                ResultSet dataName=MyConnection.getMyConnection().createStatement().executeQuery("select * from employee where id_employe="+id);
                if(dataName.next()){
            %>
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
                <i class="fas fa-user-alt"></i>
                <span class="nav-profile-name"><%=dataName.getString("nom_employe")+" "+dataName.getString("prenom_employe")%></span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                <a href="login.jsp" class="dropdown-item">
                <i class="fas fa-power-off"></i>
                Logout
                </a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="typcn typcn-th-menu"></span>
          </button>
        </div>
      </nav>
 
    <div class="container-fluid page-body-wrapper">

      <div class="theme-setting-wrapper">
          <div id="settings-trigger"><i class="typcn typcn-cog-outline"></i></div>
          <div id="theme-settings" class="settings-panel">
            <i class="settings-close typcn typcn-delete-outline"></i>
            <p class="settings-heading">SIDEBAR SKINS</p>
            <div class="sidebar-bg-options" id="sidebar-light-theme">
              <div class="img-ss rounded-circle bg-light border mr-3"></div>
              Light
            </div>
            <div class="sidebar-bg-options selected" id="sidebar-dark-theme">
              <div class="img-ss rounded-circle bg-dark border mr-3"></div>
              Dark
            </div>
            <p class="settings-heading mt-2">HEADER SKINS</p>
            <div class="color-tiles mx-0 px-4">
              <div class="tiles success"></div>
              <div class="tiles warning"></div>
              <div class="tiles danger"></div>
              <div class="tiles primary"></div>
              <div class="tiles info"></div>
              <div class="tiles dark"></div>
              <div class="tiles default border"></div>
            </div>
          </div>
        </div>

      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <div class="d-flex sidebar-profile">
              <div style="margin-left: 8px" class="sidebar-profile-image">
                <span class="sidebar-status-indicator"></span>
              </div>
              <div class="sidebar-profile-name">
                <p class="sidebar-name">
                    <%=dataName.getString("nom_employe")+" "+dataName.getString("prenom_employe")%>
                </p>
                <p class="sidebar-designation">
                  Bienvenu
                </p>
              </div>
            </div>
            <%}%>    
  <p class="sidebar-menu-title">Menu</p>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">les demandes</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="ajoutdemande.jsp">Creer une demande</a></li>
                <li class="nav-item"> <a class="nav-link" href="demandes_employe.jsp">Afficher tous mes demandes</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">les tickets</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="ajoutticket.jsp">Creer un ticket</a></li>
                <li class="nav-item"> <a class="nav-link" href="ticket_Employe.jsp">Afficher tous mes tickets</a></li>
              </ul>
            </div>
        </li>
      </nav>
      <!-- partial -->
      <div class="main-panel">          
        <div>
          <div class="col-lg-10 stretch-card">
            <div class="card">
              <div class="card-body">
                <h4> Mes demandes</h4>
        <%
            ResultSet data=MyConnection.getMyConnection().createStatement().executeQuery("select * from employee join ticket "
                    + "on(employee.id_employe=ticket.id_employe) "
                    + " where employee.ID_EMPLOYE="+id);
        %>
                <div class="table-responsive pt-3">
                  <table class="table table-bordered">
                    <div ng-controller='inboxCtrl'>
                        <thead>
                          <tr>
                           <th>Employé</th>
                            <th>Description</th>
                            <th>Type du problème</th>
                            <th>Date creation demande</th>
                             <th>Téléphone</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%while(data.next()){%>  
                          <tr ng-repeat = "mail in mails">
                            <td><%=data.getString("PRENOM_EMPLOYE")+" "+data.getString("NOM_EMPLOYE")%></td>
                            <td><%=data.getString("description")%></td>
                            <td><%=data.getString("TYPE_PROBLEME_TICKET")%></td>
                            <td><%=data.getDate("DATE_DEMANDE_TICKET")%></td>
                            <td><%=data.getInt("TELEPHONE")%></td>
                          </tr>
                        <%}%>  
                        </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>  
  <script src="../js/vendor.bundle.base.js"></script>
  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
</body>
</html>