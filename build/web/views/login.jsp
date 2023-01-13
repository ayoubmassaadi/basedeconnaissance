<%-- 
    Document   : login
    Created on : 16 nov. 2022, 22:18:11
    Author     : ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
<!--        <link rel="stylesheet" href="../css/typicons.css">
        <link rel="stylesheet" href="//.../css/vendorbundle.css">-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/typicons.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/vendorbundle.css">
<!--        <link rel="stylesheet" href="../css/style.css">
        <link rel="shortcut icon" href="icone.png" />-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/views/icone.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script>
        function validatelogin(){
            
           var email = document.getElementById("email");
           var regx = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
           var messageE = document.getElementById("erroremail");
           if (email.value == "" || !regx.test(email.value)) {
              messageE.style.color = "red";
              messageE.style.display = "block";
              messageE.style.fontSize = "13px";
              error = "entrez votre adresse email ";
              messageE.innerHTML = error;
              return false;
           }else{ messageE.style.display= "none";}
           var password = document.getElementById("password");
           var messageP = document.getElementById("errorpassword");
           if (password.value == "" ) {
              messageP.style.color = "red";
              messageP.style.display = "block";
              messageP.style.fontSize = "13px";
              error = "tapez votre mot de passe";
              messageP.innerHTML = error;
              return false;
           }else{ messageP.style.display= "none";}
        }
        </script>
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
                    Object exist=request.getAttribute("existCompte");
                    System.out.println();
                    System.out.println(exist);
                    if(exist!=null){
                        if((boolean)exist==false){
            %>
                    <div class="container">
                        <div class="mb-2"></div>
                        <div class="alert alert-danger">
                            <strong>Attention!</strong> votre email et mot de passe incorrect .
                        </div>
                    </div>
            <%
                     }
                    }       
            %>
            <h6 class="font-weight-light">Connectez-vous.</h6>            
        <form name="conformite" class="pt-3" action="<%=request.getContextPath()%>/Login" method="POST" onsubmit = "return(validatelogin());">
                <div class="form-group">
                      <input type="email" class="form-control form-control-lg" id="email" placeholder="Email" name="email">
                      <div style="display: none;" class="message" id="erroremail"></div>
                      
                    </div>
              <div class="form-group">
                      <input type="password"  class="form-control form-control-lg"  id="password" placeholder="Mot de passe " name="password">
                      <div style="display: none;" class="message" id="errorpassword"></div>
                    </div>
                <div class="mt-3">
                  <!--<a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN IN</a>-->
                    <button name="signin" type="submit" class="btn btn-secondary">Se connecter</button>
              </div>
              
                <div class="text-center mt-4 font-weight-light">
                   Vous avez un compte? <a href="<%=request.getContextPath()%>/views/register.jsp" class="text-primary" style="color: blue">Créer</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="../js/vendor.bundle.base.js"></script>
  <script src=../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>

</body>
</html>
