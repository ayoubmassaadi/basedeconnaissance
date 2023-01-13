<%-- 
    Document   : succes
    Created on : 17 déc. 2022, 23:38:59
    Author     : IKRAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>succes</title>
               <link rel="stylesheet" href="../css/typicons.css">
    <link rel="stylesheet" href="../css/vendorbundle.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/styleSjt.css">
    <link rel="shortcut icon" href="icone.png" />
    </head>
    <body>
            <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
        <div class="col-lg-4 mx-auto">
        <div class="auth-form-light text-left py-5 px-4 px-sm-5">
        <div class="brand-logo">
        <img src="solution.png" alt="logo">
        </div>
                      
  <div class="alert alert-success" role="alert">
      <strong>Félicitation</strong> Votre compte a été créé avec succès !
      
</div>
                             <div class="text-center mt-4 font-weight-light">
                                 Connectez-vous par là <a href="<%=request.getContextPath()%>/views/login.jsp" class="text-primary">Se connecter</a>
                </div>   
        </div>
      </div>
    </div>
  </div>
          </div> 
        
           
            
            
    </body>
</html>
