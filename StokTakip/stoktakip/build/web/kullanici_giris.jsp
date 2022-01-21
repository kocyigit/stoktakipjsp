<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBUser"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  

    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

  <title>G?R??</title>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'>
    <link rel="stylesheet" href="Styles/stylee.css">

</head>
<body>

<div class="container">
    <div class="screen">
<div class="screen__content">
    
  
    
<form class="login" action=""  method="post"> <!--kullan?c? bilgilerni kar??la?t?r -->
    
<div class="login__field">
    
<i class="login__icon fas fa-user"></i>
<input type="text" name="email_load" class="login__input" placeholder="Email">
</div>
    
<div class="login__field">
<i class="login__icon fas fa-lock"></i>
<input  type="password" name="password_load" class="login__input" placeholder="?ifre">
</div>
    <div style="margin-top: 20px;">
        <input type="checkbox" name="kosul" id="remember">
        <label for="remember">Beni Hatirla</label>
    </div>
    <input name="giris" value="Giris" class="button login__submit" type="submit"/>	
    <input name="anamenu" value="Ana Menu" class="button login__submit" type="submit"/>
    
</form>
    
 
     <% 
  String mail = request.getParameter("email_load");
 String sifre = request.getParameter("password_load");
   String giris = request.getParameter("giris"); 
   String anamenu = request.getParameter("anamenu");
   
DBUser db =  new DBUser();

    HttpSession oturum = request.getSession(true);
    oturum.setAttribute("Kmail", mail);

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
<%  
if(mail !=null && sifre !=null && giris !=null){
    ResultSet rs = db.vericek(mail, sifre);
    
    if(DBUser.entry_permit){
        
        if(rs.getInt("UserTypeId") == 2)
            response.sendRedirect("giris.jsp");
        else if(rs.getInt("UserTypeId") == 1)
            response.sendRedirect("yonetici.jsp");

    }
    
    
}


if(anamenu !=null){
     response.sendRedirect("index.jsp");
    
}


 
%>  



</body>
</html>
