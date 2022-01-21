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
  <title>YÖNETİCİ SAYFASI</title>
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'><link rel="stylesheet" href=" Styles/kullanici.css">
<link rel="stylesheet" href=" Styles/profilcard.css">
<link rel="stylesheet" href=" Styles/parksecim.css">   
    <link rel="StyleSheet" href="Styles/PersonelTablo.css"/>
</head> 
<body>
   
    <%
        
        Cookie [] cookies = request.getCookies();
        DBUser db = new DBUser();
        HttpSession oturum = request.getSession();
               String epostaa = "";
               boolean d = oturum.getAttribute("Ymail") != null;
               if(d){
                   epostaa =oturum.getAttribute("Ymail").toString();
               }
if(cookies != null){
    for(int i = 0; i < cookies.length; i++){
        if(cookies[i].getName().equals("mail")){
            epostaa = cookies[i].getValue();
            break;
        }
    }
}
    %>
    
   
    <p style="color: white;">Hoşgeldin <%= epostaa %></p>
    <nav class="area" >
		
		<a href="#second"><i class="fas fa-home"></i></a>
                <a href="#first"><i class="far fa-user"></i></a>
		<a href="#fourth"><i class="fas fa-users"></i></a>
	</nav>
	   
	 <div class= 'container'> 
             
             
	   <section id= 'first'>
		 
        <div class="card-container">
          
           <img class="round" style="width: 150px; height: 150px " src="https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-4-512.png"  alt="user" />
           
           <br>
            
            <%
               DBUser dbb = new DBUser();
               
               ResultSet r = dbb.verigetirr(epostaa);
while(r.next()){ 
          out.print("<div id='hizala'>");                                                                      
        out.print("<div id='div-sol'>");
            out.print("<p class='psol'>ad</p>");
            out.print("<p class='psol'>soyad</p>");
           out.print("<p class='psol'>eposta</p>");
            out.print("<p class='psol'>sifre</p>");
        out.print("</div>");
        
        out.print("<div id='div-sag'>");
            out.print("<p class='psag'>"+ r.getString("ad") +  "</p>");
            out.print("<p class='psag'>"+ r.getString("soyad") +  "</p>");
            out.print("<p class='psag'>"+ r.getString("eposta") +  "</p>");
            out.print("<p class='psag'>"+ r.getString("sifre") +  "</p>");
        out.print("</div>");
        
    out.print("</div>");
    out.print("</div>");
}

            %>
           
           
            <div class = "card-container"> 
        <form action="" method="post"> <!--yonetici bilgilerini guncelle -->
            <label id = "label_eposta"> AD :  </label>
            <input type="text" name="yonad" value="" /> <br> 
            <input type="hidden" name="deger" value="kullanici"> 
                
                    
            <label id = "label_eposta"> SOYAD :  </label>
            <input type="text" name="yonsoyad" value="" /> <br> 
            
             <label id = "label_eposta"> E-POSTA :  </label>
            <input type="text" name="yonetici_eposta" value="" /> <br> 
            <label id="label_sifre"> ŞİFRE :   </label>
            <input type="text" name="yoneticisifre" value="" /> <br>
            <label id="label_sifretek"> ŞİFRE TEKRAR :   </label>
            <input type="text" name="yoneticisifre1" value="" /> </br>
            <input style="margin-bottom: 10px; margin-left: 140px;" type="submit" value="GÖNDER" name="yonetici_sifre_sifirlama" />
           
            
        
        
        </form> 
    </div>
               
    
              
      
            
    
   
    
        </div>
            
     
               
               
	   </section>
	   
             
             
	   <section id= 'second'>
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
              <table id="personel_tablo">
                  <tr>
                      
                      <th>AD</th>
                      <th>SOYAD</th>
                      <th>NUMARA</th>
                      <th>PLAKA</th>
                      <th>EPOSTA</th>
                  </tr>
              <%
             
              ResultSet result = db.kullaniciGetir();
              
                while (result.next()) {
                    
                    
                        out.print("<tr>");
                        out.print("<td>" + result.getString("ad")+"</td>" );
                        out.print("<td>" + result.getString("soyad")+"</td>");
                        out.print("<td>" + result.getString("numara")+"</td>");
                        out.print("<td>" + result.getString("plaka")+"</td>");
                        out.print("<td>" + result.getString("eposta")+"</td>");
                       %>  
                       <td><a href="yonetici.jsp?id=<%= result.getString("ID")%>#fourth">Bilgileri Sil</a></td>
                       <%
                        out.print("<tr>");
                        
                    }

                       String sil = request.getParameter("id");
                       if(sil != null){
                       db.kullanicisil(Integer.valueOf(sil));
                        response.sendRedirect("yonetici.jsp#fourth");
}
              
              
              
              %>
              
              
              
              </table>
              <%
                String yon_eposta = request.getParameter("yonetici_eposta"); 
                String yon_sifre = request.getParameter("yoneticisifre");
                String yon_ad = request.getParameter("yonad");
                String yon_soyad = request.getParameter("yonsoyad");
                String yonetici_sifre_sifirlama = request.getParameter("yonetici_sifre_sifirlama");
                
                
                User2 user2 = new User2(yon_eposta, yon_sifre, yon_ad, yon_soyad);
                
                
                
if(yonetici_sifre_sifirlama != null){
    if(!yon_eposta.equals("") && !yon_sifre.equals("") && !yon_ad.equals("") && !yon_soyad.equals("")){
        db.yonetici_guncelle(user2);
        response.sendRedirect("yonetici_giris.jsp");
        out.print("Bilgiler güncellendi");
    }
    else{
        out.print("Tüm alanları doldurun");
    }
}
            %>
	   </section>
	 </div>
<!-- partial -->
  
</body>
</html>
