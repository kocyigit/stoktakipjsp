<%-- 
    Document   : giris
    Created on : 09.Ara.2021, 23:36:25
    Author     : CELAL
--%>

<%@page import="data.User2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.User"%>
<%@page import="database.DBUser" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>KULLANICI SAYFASI
  </title>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'>
    <link rel="stylesheet" href=" Styles/kullanici.css">
<link rel="stylesheet" href=" Styles/profilcard.css">
<link rel="stylesheet" href=" Styles/parksecim.css">    
    
</head>
<body>
    <% User user = new User(); 
       DBUser db = new DBUser();
       HttpSession oturum = request.getSession();
               String epostaa = oturum.getAttribute("Kmail").toString();
               
               out.print("<p style=\"color: white;\">Hoşgeldin " + epostaa + "</p>");
       
    %>
    
    <nav class="area" >
		
                <a href="#first">  <i class="far fa-user"></i></a>
		<a href="#third"><i class="fas fa-warehouse"></i></a>
		<a href="#fourth"><i class="fas fa-user-cog"></i></i></a>
	</nav>
	   
	 <div class= 'container'> 
             
             
	   <section id= 'first'>
		 
        <div class="card-container">
          
           <img class="round" style="width: 150px; height: 150px " src="https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-4-512.png"  alt="user" />
           
           <br>
            
            <%
               
               ResultSet r = db.verigetir(epostaa);
while(r.next()){
    
    out.print("<div id='ana-div' >");
        out.print("<div id='div-sol'>");
            out.print("<p class='psol'>ad</p>");
            out.print("<p class='psol'>soyad</p>");
            out.print("<p class='psol'>plaka</p>");
            out.print("<p class='psol'>eposta</p>");
            out.print("<p class='psol'>sifre</p>");
        out.print("</div>");
        
        out.print("<div id='div-sag'>");
            out.print("<p class='psag'>"+ r.getString("UserName") +  "</p>");
            out.print("<p class='psag'>"+ r.getString("Password") +  "</p>");
            out.print("<p class='psag'"+ r.getString("Name") +  "</p>");
            out.print("<p class='psag'>"+ r.getString("Surname") +  "</p>");
            out.print("<p class='psag'>"+ r.getDate("CreatedDate") +  "</p>");
            out.print("<p class='psag'>"+ r.getInt("UserTypeId") +  "</p>");
        out.print("</div>");
        
    out.print("</div>");
}
            %>
            <form action="kullanici_giris.jsp">
              <input style="width: 100px; height: 50px; margin-top: 50px; margin-bottom: 10px;" type="submit" value="CIKIS" />
            </form>
            
        </div>
               
               
               
	   </section>
	   
             
             
	
	   
    
    
    
	  <section id= 'third'>
              <div class =selectarea>
                  
                  
                  
                  
                  <button id="a1" name="a1" class="button_select" >A1</button>
                  <button id="a2" name="a2" class="button_select">A2</button>
                  <button id="a3" name="a3" class="button_select">A3</button>
                  <button id="a4" name="a4" class="button_select">A4</button>
                  <button id="a5" name="a5" class="button_select">A5</button>   
                  <button id="a6" name="a6" class="button_select">A6</button>        
                  <button id="a7" name="a7" class="button_select">A7</button>    
                  <button id="a8" name="a8" class="button_select">A8</button> <br>
                  
                  <button class="button_select">B1</button>
                  <button class="button_select">B2</button>
                  <button class="button_select">B3</button>
                  <button class="button_select">B4</button>
                  <button class="button_select">B5</button>   
                  <button class="button_select">B6</button>        
                  <button class="button_select">B7</button>    
                  <button class="button_select">B8</button> <br> 
                  
                  <button class="button_select">C1</button>
                  <button class="button_select">C2</button>
                  <button class="button_select">C3</button>
                  <button class="button_select">C4</button>
                  <button class="button_select">C5</button>   
                  <button class="button_select">C6</button>        
                  <button class="button_select">C7</button>    
                  <button class="button_select">C8</button> <br> 
                  
                  <button class="button_select">D1</button>
                  <button class="button_select">D2</button>
                  <button class="button_select">D3</button>
                  <button class="button_select">D4</button>
                  <button class="button_select">D5</button>   
                  <button class="button_select">D6</button>        
                  <button class="button_select">D7</button>    
                  <button class="button_select">D8</button> <br> 
                  
                  <button class="button_select">E1</button>
                  <button class="button_select">E2</button>
                  <button class="button_select">E3</button>
                  <button class="button_select">E4</button>
                  <button class="button_select">E5</button>   
                  <button class="button_select">E6</button>        
                  <button class="button_select">E7</button>    
                  <button class="button_select">E8</button> <br> 
                  
                  
                  
                  
              </div>
              
	   </section>
	   
    
    
    
    
    
	  <section id= 'fourth'>
              
               <div class = "card-container"> 
        <form action="" method="post"> <!--yonetici guncelle -->
            <label id = "label_eposta"> AD :  </label>
            <input type="text" name="kulad" value="" /> <br> 
            
            <input type="hidden" name="deger" value="kullanici"> 
                
                    
            <label id = "label_eposta"> SOYAD :  </label>
            <input type="text" name="kulsoyad" value="" /> <br> 
            
             <label id = "label_eposta"> NUMARA :  </label>
            <input type="text" name="kulnumara" value="" /> <br>
            
             <label id = "label_eposta"> PLAKA :  </label>
            <input type="text" name="kulplaka" value="" /> <br>
            
             <label id = "label_eposta"> E-POSTA :  </label>
            <input type="text" name="kuleposta" value="" /> <br> 
            <label id="label_sifre"> ŞİFRE :   </label>
            <input type="text" name="kulsifre" value="" /> <br>
            <label id="label_sifretek"> ŞİFRE TEKRAR :   </label>
            <input type="text" name="yoneticisifre1" value="" /> </br>
            <input style="margin-bottom: 10px; margin-left: 140px;" type="submit" value="GÖNDER" name="yonetici_sifre_sifirlama" />
        </form> 
    </div>

              <%
                String yon_eposta = request.getParameter("kuleposta"); 
                String yon_sifre = request.getParameter("kulsifre");
                String yon_ad = request.getParameter("kulad");
                String yon_soyad = request.getParameter("kulsoyad");
                String yon_plaka = request.getParameter("kulplaka");
                String yon_numara = request.getParameter("kulnumara");
                String yonetici_sifre_sıfırlama = request.getParameter("yonetici_sifre_sifirlama");
                User2 user2;
if(yonetici_sifre_sıfırlama !=null){
            
            if(!yon_eposta.equals("") && !yon_sifre.equals("") && 
                    !yon_ad.equals("") &&  
                    !yon_numara.equals("") && !yon_soyad.equals("") &&
                    !yon_plaka.equals("")){
                
            }
            else{
                out.print("<p style=\"color:white; margin-left: 680px;\">Bütün alanları doldurun</p>");
            }
           user2 = new User2(yon_eposta, yon_sifre, yon_ad, yon_soyad, yon_plaka, yon_numara);
                System.out.println("bURADAYIZ");
                db.kullanici_guncelle(user2, epostaa);
                
                response.sendRedirect("kullanici_giris.jsp");
                
            
        }
              %>
              
           
              
              
              
              
              
	   </section>
	 </div>
<!-- partial -->




<script> 
    <% boolean durum =false; %>
let a1 = document.getElementById("a1");


  
</body>
</html>
