<%-- 
    Document   : administrateur
    Created on : 17 nov. 2022, 10:41:32
    Author     : ayoub
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Administrateur</title>
        <!-- base:css -->
        <link rel="stylesheet" href="../css/typicons.css">
        <link rel="stylesheet" href="../css/vendorbundle.css">
        <!-- endinject --> 
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css --> 
        <link rel="stylesheet" href="../css/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="icone.png" />
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href=""><img src="solution.png" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href=".html"><img src="../../images/logo-mini.svg" alt="logo"/></a>
          <button class="navbar-toggler navbar-toggler align-self-center d-none d-lg-flex" type="button" data-toggle="minimize">
            <span class="fa fa-bars"></span>
          </button>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
          <ul class="navbar-nav mr-lg-2">
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
                <i class=""></i>
                <%
                    HttpSession ses=request.getSession();
                    String nom=(String)ses.getAttribute("nom");
                    String prenom=(String)ses.getAttribute("prenom");
                %>
                <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
                <i class="fas fa-user-alt"></i>
                <span class="nav-profile-name"><%=nom+" "+prenom%></span>
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
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_settings-panel.html -->
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
                  <%=nom+" "+prenom%>
                </p>
                <p class="sidebar-designation">
                Bienvenue
                </p>
              </div>
            </div>
            <p class="sidebar-menu-title">Menu</p>
          </li>
          <li class="nav-item">
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="administrateur.jsp" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">Gestion des employés</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">Les demandes</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="demandesAdmin.jsp">Affectation des demandes</a></li>
                <!--<li class="nav-item"> <a class="nav-link" href="historique.jsp">Historique des demandes</a></li>-->
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">Les tickets</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="ticketsAdmin.jsp">Affectation des tickets</a></li>
                <!--<li class="nav-item"> <a class="nav-link" href="historique.jsp">Historique des demandes</a></li>-->
              </ul>
            </div>
          </li>
      </nav>
        <%
            //get the data from employee
            ResultSet data=MyConnection.getMyConnection().createStatement().executeQuery("select * from employee");
            HttpSession sess=request.getSession();
        %>            
        <!-- partial -->
        <div class="main-panel">
          <div>
              <div class="col-lg-10 stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Employes</h4>
                    <div class="table-responsive pt-3">
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th>
                              Id Employe
                            </th>
                            <th>
                              Nom et prenom employé
                            </th>
                            <th>
                              Email
                            </th>
                            <th>
                              Profile
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                        <%while(data.next()){%>
                          <tr>
                            <td><%=data.getInt("ID_EMPLOYE")%></td>
                            <td><%=data.getString("NOM_EMPLOYE")+" "+data.getString("PRENOM_EMPLOYE")%></td>
                            <td><%=data.getString("EMAIL_EMPLOYE")%></td>
                            <td><%=data.getString("TYPE_PROFILE")%></td>
                            <td>
                            <div class="container">
                              <div class="row">
                                <div class="col align-self-center">
                                  <!--<button type="button" class="btn btn-sm btn-secondary">Supprimer</button>-->      
                                  <a href="../AdminServlet?idEmploye=<%=data.getInt("ID_EMPLOYE")%>" class="btn btn-sm btn-secondary" name="supprimer">Supprimer</a>
                                </div>
                                <div class="col-0 align-self-end">
                                  <!--<button type="button" class="btn btn-sm btn-secondary">Modifier</button>-->
                                  <!--<a class="btn btn-sm btn-secondary" href="../AdminServlet>Modifier</a>-->
                                </div>
                              </div>
                            </div>  
                            </td>
                          </tr>
                          <%}%>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script src="../js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="../js/off-canvas.js"></script>
    <script src="../js/hoverable-collapse.js"></script>
    <script src="../js/template.js"></script>
    <script src="../js/settings.js"></script>
    <script src="../js/todolist.js"></script>
    <!-- endinject -->
    <!-- plugin js for this page -->
    <script src="../js/progressbar.min.js"></script>
    <script src="../js/Chart.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- Custom js for this page-->
    <script src="../js/dashboard.js"></script>
    <!-- End custom js for this page-->
    </body>
</html>
