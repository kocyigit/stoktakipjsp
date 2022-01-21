<%-- 
    Document   : kayit_formuyonetici
    Created on : 16.Ara.2021, 22:15:57
    Author     : CELAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="Styles/form.css" type="text/css"/>
        <title>YONETİCİ ŞİFRE OLUŞTURMA</title>
  </head>
    <body>
    <div class="container">  
      <form id="contact" action="yonetici.jsp" method="post">
        <h3>Güven Otopark</h3>
        <h4>Yonetici şifre oluşturma</h4>
       
        
        <fieldset>
          <input name="email" placeholder="E-posta" type="email" tabindex="5" >
        </fieldset>
        <fieldset>
          <input name="password3" placeholder="Şifre" type="text" tabindex="6" >
        </fieldset>
        <fieldset>
          <input name="password4" placeholder="Şifreyi Tekrar Giriniz" type="text" tabindex="6" >
        </fieldset>
        <fieldset>
          <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Kaydı Gönder.</button>
        </fieldset>
      </form>
    </div>
    </body>
</html>
