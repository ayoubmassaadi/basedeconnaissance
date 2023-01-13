<%-- 
    Document   : demandesAdmin
    Created on : 15 déc. 2022, 15:11:54
    Author     : ayoub
--%>

<%@page import="servlets.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
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
<style>
    input{
        border-style: none;
/*        background-color:#e8eff9; */
    }
</style>

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
//                    Object id=sess.getAttribute("idIntervenant");
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
              <span class="menu-title">Gestion des employés</span>
              <i class="typcn typcn-chevron-right menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="administrateur.jsp">Afficher les employés</a></li>
<!--                <li class="nav-item"> <a class="nav-link" href="ajoutticket.jsp">Creer un ticket</a></li>-->
              </ul>
            </div>
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
      <div class="main-panel">          
        <div>
          <div class="col-lg-16 stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Les tickets</h4>
                <div class="table-responsive pt-3">
                  <table class="table table-bordered">
                    <div ng-controller='inboxCtrl'>
          <div class="spacer input-group">
          <div class="input-group-addon">
          <span class="glyphicon glyphicon-search"></span>
          </div>
<!--          <input type="text" class="form-control" placeholder="Rechercher une demande" ng-model="recherche">
          <div class="input-group-btn">
            <button class="btn btn-default" ng-click="effacerRecherche()">
              <span class="glyphicon glyphicon-remove"></span>
            </button>
          </div>-->
        </div>
            <table class="table table-hover">
                <%
                    ResultSet data=MyConnection.getMyConnection().createStatement().executeQuery("select * from ticket "
                            + "join employee on(ticket.id_employe=employee.id_employe)");
                    ResultSet dataIntervenant=MyConnection.getMyConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,  
                     ResultSet.CONCUR_UPDATABLE).executeQuery("select * from intervenant");
                %>
                <thead>
                    <tr>
<!--                        <th> Id employé</th>-->
                        <th> Nom</th>
                         <th>
                             Prénom
                        </th>
                        <th>
                              Email
                        </th>
                        <th>
                             Telephone
                        </th>
                        <th>Type de problème</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>affecter à :</th>
                    </tr>
                </thead>
                        <tbody>    
                          <%while(data.next()){%>  
                        <form action="../TicketAdmin" method="GET">  
                          <tr>
                            <td hidden><input readonly  type="text" name="idTicket" value="<%=data.getInt("ID_TICKET")%>"></td> 
                            <td><input readonly  type="text" name="nom" value="<%=data.getString("NOM_EMPLOYE")%>"></td>
                            <td><input readonly  type="text" name="prenom" value="<%=data.getString("PRENOM_EMPLOYE")%>"></td>
                            <td><input readonly type="text" name="email" value="<%=data.getString("EMAIL_EMPLOYE")%>"></td>
                            <td><input readonly type="text" name="telephone" value="<%=data.getInt("TELEPHONE")%>"></td>
                            <td><input readonly type="text" name="typeprobleme" value="<%=data.getString("TYPE_PROBLEME_TICKET")%>"></td>
                            <!--<td><input readonly type="text" name="description" value="<%=data.getString("DESCRIPTION")%>"></td>-->
                            <td><textarea rows="7" readonly type="text" name="description"><%=data.getString("DESCRIPTION")%></textarea></td>
                            <td><input readonly type="text" name="datecreationticket" value="<%=data.getDate("DATE_DEMANDE_TICKET")%>"></td>
                            <td>
                                <select class="form-control"  id=" typeProfile " name="typeProfiles" >
                                    <option  value="" id="selectt">--Selectionnez--</option>
                                    <%
                                        dataIntervenant.beforeFirst();
                                        while(dataIntervenant.next()){
                                    %>
                                        <option value="<%=dataIntervenant.getInt("ID_INTERVENANT")%>"><%=dataIntervenant.getString("PRENOM_INTERVENANT")+" "+dataIntervenant.getString("NOM_INTERVENANT")%></option>   
                                    <%}%>    
                                </select>    
                            </td>
                            <td>
                              <button name="affecte" type="submit" class="btn btn-sm btn-secondary">affecte</button>
                            </td>
                        </form>    
                            <td>
                              <!--<button type="button" class="btn btn-sm btn-secondary">creer un ticket</button>-->
                            </td>
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