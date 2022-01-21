<%-- 
    Document   : yonetici_giris
    Created on : 16.Ara.2021, 22:14:52
    Author     : CELAL
--%>

<%@page import="database.DBUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  

    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

  <title>GİRİŞ</title>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'>
    <link rel="stylesheet" href="Styles/stylee.css">

</head>
<body>
    <%
        DBUser data = new DBUser();
    %>

<div class="container">
    <div class="screen">
<div class="screen__content">
    
    
    
<form action="" class="login" method="post">  <!--veri karşılaştırma --- yonetici_vericek -->
    
<div class="login__field">
    
<i class="login__icon fas fa-user"></i>
<input type="text" name="email" class="login__input" placeholder="Email">
</div>
    
<div class="login__field">
<i class="login__icon fas fa-lock"></i>
<input  type="password" name="sifre" class="login__input" placeholder="Şifre">
</div>
    <input type="checkbox" name="remember" id="remember">
    <label for="remember">Beni Hatırla</label>
    
    <input name="giris" value="Giriş" class="button login__submit" type="submit"/>
     <input name="anamenu" value="Ana Menu" class="button login__submit" type="submit"/>    
        
    
</form>
    
    <%
       
        String mail = request.getParameter("email");
        String sifre = request.getParameter("sifre");
        String giris = request.getParameter("giris");
        String anamenu = request.getParameter("anamenu");
        Cookie ckMail = null;
        Cookie ckSifre = null;
        Cookie ckDurum = null;
        String name = "";
        String pass = "";
         HttpSession oturum = request.getSession(true);
        oturum.setAttribute("Ymail", mail);
        boolean durum = request.getParameter("remember") != null;
        
if(giris != null && !mail.equals("") && !sifre.equals("")){
             ckDurum = new Cookie("durum", "true");
             ckMail = new Cookie("mail", mail);
             ckSifre = new Cookie("sifre", sifre);
    
    
}
         Cookie[] allCookies = request.getCookies();
         if (allCookies != null) {
                 for(Cookie cook: allCookies){
                     if(cook.getName().equalsIgnoreCase("mail")){
                         name = cook.getValue();
                     }
                     else if(cook.getName().equalsIgnoreCase("sifre")){
                         pass = cook.getValue();
                     }
                 }
             }
         
        if(allCookies != null){
             for(int i = 0; i < allCookies.length; i++){
             if(allCookies[i].getValue().contains("true")){
                      response.sendRedirect(request.getContextPath() + "/yonetici.jsp");
                      break;
                  }
             else{
                 System.out.println("bulunamadi");
             }
         }
         }
        
if(giris != null && !mail.equals("") && !sifre.equals("")){
    data.yonetici_vericek(mail, sifre);
            if(DBUser.entry_permit){
                if(durum){
                         ckDurum.setMaxAge(1000);
                         response.addCookie(ckDurum);
                         ckMail.setMaxAge(1000);
                         response.addCookie(ckMail);
                         ckSifre.setMaxAge(1000);
                         response.addCookie(ckSifre);
                }
                response.sendRedirect("yonetici.jsp");
            }
            
    
    
}
        
if(anamenu !=null){
     response.sendRedirect("index.jsp");
    
}



    %>
    
    
    
</div>
        
<div class="screen__background">
<span class="screen__background__shape screen__background__shape4"></span>
<span class="screen__background__shape screen__background__shape3"></span>		
<span class="screen__background__shape screen__background__shape2"></span>
<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
</div>
<!-- partial -->
  
</body>
</html>

