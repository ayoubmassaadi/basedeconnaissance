<%-- 
    Document   : demandes
    Created on : 17 nov. 2022, 09:42:55
    Author     : IKRAM
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <link rel="stylesheet" href="../css/styleSjt.css">
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
                    sess.setAttribute("idhistoriqueaffect", request.getParameter("idhistoriqueaffect"));
                    Connection con;
                    Statement state;
                    con=MyConnection.getMyConnection();
                    state=con.createStatement();
//                    state1=con.createStatement();
//                    state1.executeUpdate("update HISTORIQUEDEM2 set etat='en cours de traitement' where ID_HISTORIQUEDEM="+request.getParameter("idhistoriqueaffect"));
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
                <li class="nav-item"> <a class="nav-link" href="historiqueticket.jsp">Historique des tickets</a></li>
                <li class="nav-item"> <a class="nav-link" href="historique.jsp">Historique des demandes</a></li>
              </ul>
            </div>
          </li>
      </nav>
      <div class="main-panel">          
        <div>
          <div class="col-lg-10 stretch-card">
            <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="card media g-mb-30 media-commen">
                    <div class="media-body u-shadow-v18 g-bg-secondary g-pa-30">
                      <div class="g-mb-15">
                        <h5 class="h5 g-color-gray-dark-v1 mb-3"><%=request.getParameter("prenomemploye")+" "+request.getParameter("nomemploye")%>
                        </h5>
                        <span class="g-color-gray-dark-v4 g-font-size-12"><%=request.getParameter("datecreation")%></span>
                      </div>
                
                      <p><%=request.getParameter("description")%>.</p>
                
                      <ul class="list-inline d-sm-flex my-0">
<!--                        <li class="list-inline-item g-mr-20">
                          <a class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover" href="#!">
                            <i class="fa fa-thumbs-up g-pos-rel g-top-1 g-mr-3"></i>
                            178
                          </a>
                        </li>-->
<!--                        <li class="list-inline-item g-mr-20">
                          <a class="u-link-v5 g-color-gray-dark-v4 g-color-primary--hover" href="#!">
                            <i class="fa fa-thumbs-down g-pos-rel g-top-1 g-mr-3"></i>
                            34
                          </a>
                        </li>-->
                      </ul>
                    </div>
                </div>
            </div>
    <div>        
        <form class="algin-form" action="../Solution" method="GET">
        <div class="align-fr">  
        <div class="form-group">
            <h4></h4> <label for="message">Message</label>
            <textarea name="solution" id="" msg cols="500" rows="6" class="form-control" style="background-color: rgb(255, 255, 255);"></textarea>
            <!--<button type="submit" classs="btn btn-primary mr-2">send</button>-->
        </div>
        <!-- <div class="form-group"> <label for="name">Name</label> <input type="text" name="name" id="fullname" class="form-control"> </div>
        <div class="form-group"> <label for="email">Email</label> <input type="text" name="email" id="email" class="form-control"> </div> -->
        <!-- <div class="form-group">
            <p class="text-secondary"> si vous avez pas de compte vous devez connecter <a href="#" class="alert-link"> Login</a> une fois vous entrez votre email vous serez connecter </p>
        </div> -->
         <div class="form-group">
            <button name="Envoyer" type="submit" class="btn btn-primary mr-2">Envoyer</button>
<!--             <button type="submit" class="btn btn-primary mr-2">creer ticket</button>-->
            <!--<a class="btn btn-primary mr-2" href="ajoutticket.jsp?idDemande=<%=request.getParameter("idDemande")%>&idEmploye=<%=request.getParameter("idEmploye")%>&nomemploye=<%=request.getParameter("nomemploye")%>&prenomemploye=<%=request.getParameter("prenomemploye")%>&emailemploye=<%=request.getParameter("emailemploye")%>&telephone=<%=request.getParameter("telephone")%>&typeprobleme=<%=request.getParameter("typeprobleme")%>&description=<%=request.getParameter("description")%>&datecreation=<%=request.getParameter("datecreation")%>">creer ticket</a>-->
         </div>
<!--         <div class="form-group"> <button type="submit" class="btn btn-primary mr-2">cloturer</button></div>-->
    </div>     
    </form>
    </div>
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