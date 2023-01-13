<%-- 
    Document   : historiqueticket
    Created on : 17 nov. 2022, 09:54:19
    Author     : IKRAM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="servlets.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Les tickets</title>

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
                    HttpSession sess=request.getSession();
                    Object id=sess.getAttribute("idIntervenant");
                    String nom=(String)sess.getAttribute("nom");
                    String prenom=(String)sess.getAttribute("prenom");
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
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">les tickets</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="Ticket.jsp">Afficher les tickets</a></li>
<!--                <li class="nav-item"> <a class="nav-link" href="ajoutticket.jsp">Creer un ticket</a></li>-->
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">les demandes</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="demandes.jsp">Afficher les demandes</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i></i>
              <span class="menu-title">Historique</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
               <li class="nav-item"> <a class="nav-link" href="historiqueticket.jsp">Les tickets résolus</a></li>
                <li class="nav-item"> <a class="nav-link" href="historique.jsp">Les demandes résolues</a></li>
              </ul>
            </div>
          </li>
      </nav>
    <%
        ResultSet data=MyConnection.getMyConnection().createStatement().executeQuery("select * from HISTORIQUETICKET join intervenant "
                + "on(HISTORIQUETICKET.id_intervenant=intervenant.id_intervenant)");
    %> 
    <div class="main-panel">          
        <div>
          <div class="col-lg-10 stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Les tickets résolus </h4>
                <div class="table-responsive pt-3">
                  <table class="table table-bordered">
                    <div ng-controller='inboxCtrl'>
                        <thead>
                          <tr>
                            <tr>
                            <th>L'intervenant</th>  
                            <th> L'employé</th>
                            <th>Description</th>
                            <th>Type du problème</th>
                            <th>Date creation ticket</th>
                            <th>Téléphone</th>
                            <th>Solution</th>
                          </tr>
                          </tr>
                        </thead>
                        <tbody>
                        <%while(data.next()){%>
                        <tr>
                            <td><%=data.getString("NOM_INTERVENANT")+" "+data.getString("PRENOM_INTERVENANT")%></td>
                            <td><%=data.getString("NOM_EMPLOYE")+" "+data.getString("PRENOM_EMPLOYE")%></td>
                            <td><%=data.getString("DESCRIPTION")%></td>
                            <td><%=data.getString("TYPE_PROBLEME_TICKET")%></td>
                            <td><%=data.getDate("DATE_CREATION_TICKET")%></td>
                            <td><%=data.getInt("telephone")%></td>
                            <td><%=data.getString("solution")%></td>
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
