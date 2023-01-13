<%-- 
    Document   : register
    Created on : 17 nov. 2022, 09:23:49
    Author     : ayoub
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register</title>
        <!-- base:css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/typicons.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/vendorbundle.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/views/icone.png" />
        <!-- endinject -->
<!--        <link rel="shortcut icon" href="../../images/favicon.png" />-->

    </head>
    <body>
    <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="<%=request.getContextPath()%>/views/solution.png" alt="logo">
              </div>
                <%
                    Object exist=request.getAttribute("compte");
                    System.out.println();
                    System.out.println(exist);
                    if(exist!=null){
                        if((boolean)exist==true){
                %>
                    <div class="container">
                        <div class="mb-2"></div>
                        <div class="alert alert-danger">
                            <strong>Attention!</strong> ce compte existe déja.
                        </div>
                    </div>
                <%
                     }
                    }       
                %>
                <form name="conformite" class="pt-3" action="<%=request.getContextPath()%>/Register" method="POST" onsubmit = "return validateSignup();">
                                     <div class="form-group">
                      <input type="text" class="form-control form-control-lg" id="nom" placeholder="Nom" name="nom">
                      <div style="display: none;" class="message" id="errorfullname"></div>
                      </div>
                    <div >
                    <div class="form-group">
                      <div class="form-group">
                        <input type="text" class="form-control form-control-lg" id="prenom" placeholder="Prenom" name="prenom">
                        <div style="display: none;" class="message" id="errorprenom"></div>
                      </div>
                      <div class="form-group">
                      <input type="email" class="form-control form-control-lg" id="email" placeholder="Email" name="email">
                      <div style="display: none;" class="message" id="erroremail"></div>
                      
                    </div>
                    <div class="form-group">
                           <span id="result"> </span>
                           <select class="form-control"  id="typeProfile" name="typeProfiles" >
                             <option  value="" id="selectt">--Selectionnez--</option>
                        <option>Employe</option>
                        <option>Ingenieur</option>
                        <option>Technicien</option>
                        <option>Directeur</option>
                        <option>Chef departement</option>
                        <option>Agent developement</option>
                        <option>Chef de branche</option>
                        <option>Chef de service Hsolution</option>
                      </select>
                         <div   id="erreurSelect" ></div>
                        
                         
                    </div>
                        
                    <div class="form-group">
                      <input type="password"  class="form-control form-control-lg"  id="password" placeholder="Mot de passe " name="password">
                      <div style="display: none;" class="message" id="errorpassword"></div>
                    </div>
                     <div class="mt-3">
                  <!--<a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="">SIGN UP</a>-->
                  <button name="signup" type="submit" class="btn btn-secondary">Créer</button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                    Vous avez un compte? <a href="<%=request.getContextPath()%>/views/login.jsp" class="text-primary">Se connecter</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="../js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
  <script src="../js/validateForm.js"></script>
  <!-- endinject -->
    </body>
</html>