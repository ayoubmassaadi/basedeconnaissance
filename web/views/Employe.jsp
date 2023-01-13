<%-- 
    Document   : Employé
    Created on : 17 nov. 2022, 09:45:02
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
  <title>Employe</title>

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
                    <%=nom+" "+prenom%>
                  </p>
                  <p class="sidebar-designation">
                    Bienvenu
                  </p>
                </div>
              </div>
              <p class="sidebar-menu-title">Menu</p>
          </li>
<!--          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#intervenant" aria-expanded="false" aria-controls="intervenant">
              <i class="typcn mdi mdi-ticket-account menu-icon"></i>
              <span class="menu-title">demandes</span>
              <i class="typcn-arrow-loop-outline"></i>
            </a>
            <div class="collapse" id="intervenant">
            
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="views/ajoutdemande.jsp">Creer une demande</a></li>
            </ul>
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="views/demandes_employé.jsp">Afficher tous mes demandes</a></li>
              </ul> 
            </div>
          </li>-->
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
    <div class="main-panel">          
        <div>
          <div class="col-lg-10 stretch-card">
            <div class="card">
              <div class="card-body">
<!--                <h4> Mes demandes</h4>-->
        <%
            ResultSet data=MyConnection.getMyConnection().createStatement().executeQuery("select solution "
                    + "from HISTORIQUEDEMANDE where solution like'%"+request.getParameter("search")+"%'");
            System.out.print(request.getParameter("search"));
        %>
                <div class="table-responsive pt-3">
                  <div class="container">
                    <!--<h1>Simple Customer Support System</h1>-->
                    <h3>Vous avez un problem?</h3>
                    <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                    <form action="Employe.jsp" method="GET" class="ng-pristine ng-valid">
                        <!--<div class="input-group input-group-lg">-->
                        <!--<input type="text" list="question-list" class="form-control input-lg" id="question" name="question" placeholder="What do you looking for ?" required="" autocomplete="off">-->
                        <input name="search" type="text" class="form-control" placeholder="Rechercher une solution" ng-model="recherche">
                            <datalist id="question-list"></datalist>
                            <span class="input-group-btn">
                            <button name="rechercher" type="submit" class="btn">Search</button>
                            </span>
                        <!--</div>-->
                    </form>
                    <ul>
                        <%while(data.next()){%>
                        <li><%=data.getString("solution")%></li>
                        <%}%>
                    </ul>
                    </div>
                    </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        <script>
//            function DoLogic(){
//                var search=document.getElementById("search").value;
//                if(search==""){
//     
//                }
//            }
        </script>                  
  <script src="../js/vendor.bundle.base.js"></script>
  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
</body>
</html>