<%-- 
    Document   : kayit_formu
    Created on : 16.Ara.2021, 22:15:27
    Author     : CELAL
--%>

<%@page import="database.DBUser"%>
<%@page import="data.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="Styles/form.css" type="text/css"/>
        <title>FORM KONTROL</title>
  </head>
    <body>
        
        
        
    <div class="container">  
      <form id="contact" action="" method="post"> <!--kulllanıcı bilgilerini veritabanına yazdir -->
        <h3>Güven Otopark</h3>
        <h4>Kayıt Formu</h4>
        <fieldset>
          <input name="firstname" placeholder="Adınız" type="text" tabindex="1" >
        </fieldset>
        <fieldset>
          <input name="lastname" placeholder="Soyadınız" type="text" tabindex="2" >
        </fieldset>
        <fieldset>
          <input name="number" placeholder="Telefon(555-555-55-55)" type="tel" tabindex="3" >
        </fieldset>
        <fieldset>
          <input name="carPlate" placeholder="Araç plakası" type="text" tabindex="4" >
        </fieldset>
        
        <fieldset>
          <input name="email" placeholder="E-posta" type="email" tabindex="5" >
        </fieldset>
        <fieldset>
          <input name="password1" placeholder="Şifre" type="text" tabindex="6" >
        </fieldset>
        <fieldset>
          <input name="password2" placeholder="Şifreyi Tekrar Giriniz" type="text" tabindex="6" >
        </fieldset>
        <fieldset>
          <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Kaydı Gönder.</button>
        </fieldset>
        
          <button name="geri" type="submit" id="contact-submit" >Geri</button>
        
      </form>
    </div>
    
    <%   
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone_number = request.getParameter("number");
        String car_plate = request.getParameter("carPlate");
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String kytbtn = request.getParameter("submit");
        String geribtn = request.getParameter("geri");
        
        User user= new User(firstname, lastname, phone_number, car_plate, email, password1, password2);
        DBUser bduser = new DBUser();
        
        

        if(kytbtn !=null){
            
            if(!firstname.equals("") && !lastname.equals("") && 
                    !phone_number.equals("") && !car_plate.equals("") && 
                    !email.equals("") && !password1.equals("") &&
                    !password2.equals("")){
                bduser.insert(user);
                response.sendRedirect("kayit_formu.jsp");
            }
            else{
                out.print("<p style=\"color:white; margin-left: 680px;\">Bütün alanları doldurun</p>");
            }
           
            
        }
        if(geribtn !=null){
            
            response.sendRedirect("index.jsp");
            
        }
    %>
    
    
    </body>
</html>
