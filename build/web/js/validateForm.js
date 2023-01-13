
        function validateSignup() {
           var nom = document.getElementById("nom");
           var regx = /^([a-zA-Z]){3,20}$/;
           var messageName = document.getElementById("errorfullname");
           if (nom.value == "" || !regx.test(nom.value)) {
              messageName.style.color = "red";
              messageName.style.display = "block";
              messageName.style.fontSize = "13px";
              error = " entrer un nom correct ";
              messageName.innerHTML = error;
              return false;
           }else{ messageName.style.display= "none";}
           var prenom = document.getElementById("prenom");
           var regx = /^([a-zA-Z]){3,20}$/;
           var messageprenom = document.getElementById("errorprenom");
           if (prenom.value == "" || !regx.test(prenom.value)) {
            messageprenom.style.color = "red";
            messageprenom.style.display = "block";
            messageprenom.style.fontSize = "13px";
              error = " entrer un prenom correct ";
              messageprenom.innerHTML = error;
              return false;
           }else{ messageprenom.style.display= "none";}
  
           var email = document.getElementById("email");
           var regx = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
           var messageE = document.getElementById("erroremail");
           if (email.value == "" || !regx.test(email.value)) {
              messageE.style.color = "red";
              messageE.style.display = "block";
              messageE.style.fontSize = "13px";
              error = " entrez une adress email ";
              messageE.innerHTML = error;
              return false;
           }else{ messageE.style.display= "none";}
           
//            var selectprofile=document.getElementById("typeProfile");
//            var span =document.getElementById("result");
////            var a =document.conformite.typeProb.value;
//            if (selectprofile.value ==""){
//            document.getElementById("result").innerHTML=" selectionnez le type de problem";
//            document.getElementById("result").style.color="red";
//            return false;}
//            else{ document.getElementById("result").style.visibility='Hidden';}

            
            
            
//        var checkSelect=document.getElementById("typeProfile");
//        var resultMessage=document.getElementById("resultsele");
//        if(checkSelect.value===""){
//            resultMessage.innerHTML="selectionnez le type de problem";
//            return false;
//        }
//           
        
            
//            var span =document.getElementById("result");
//            var a =document.conformite.typeProfiles.value;
//            if (a.value ==""){
//            document.getElementById("result").innerHTML=" selectionnez le type de problem";
//            document.getElementById("result").style.color="red";
//            return false;}
////            else{ document.getElementById("result").style.visibility='Hidden';}

            
           var password = document.getElementById("password");
           var regxa = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*?]{6,}$/;
           var messageP = document.getElementById("errorpassword");
           if (password.value == "" || !regxa.test(password.value)) {
              messageP.style.color = "red";
              messageP.style.display = "block";
              messageP.style.fontSize = "13px";
              error = "Veuillez entrer un mot de passe avec des lettres des chiffres et des caracteres speciaux ";
              messageP.innerHTML = error;
              return false;
           }else{ messageP.style.display= "none";}
           
               var securityQuestionElement = document.getElementById("typeProfile");
                    var erreur=document.getElementById("erreurSelect");
                    if(securityQuestionElement.value==="") {  
                        // window.alert('You must select a Security Question');  
                        // securityQuestionElement.value = 'm'
                        erreur.innerHTML="Selectionnez votre role";
                        erreur.style.color="red";
                        return false;  
                    }else if(securityQuestionElement.value!==""){ erreur.style.visibility='Hidden';}
        }
        var fullnames = document.getElementById("name");
        var typeProfiles =document.getElementById("typeProfile");
        var prenoms = document.getElementById("prenom");
        var emails = document.getElementById("email");
        var passwords = document.getElementById("password");
        var confirmepasswords = document.getElementById("Password2");
        var messagename = document.getElementById("errorfullname");
        var messageprenom = document.getElementById("errorprenom");
        var messageE = document.getElementById("erroremail");
        var messageP = document.getElementById("errorpassword");
        var messageCP = document.getElementById("errorpassword2");
        var erreur =document.getElementById("erreurSelect");
        fullnames.onfocus = () => {
           messagename.style.display = "none";
        };
        prenoms.onfocus = () => {
           messageprenom.style.display = "none";
        };
        emails.onfocus = () => {
           messageE.style.display = "none";
        };
        passwords.onfocus = () => {
           messageP.style.display = "none";
               };
        typeProfiles.onfocus = () => {
           erreur.style.visibility = 'Hidden';
        }