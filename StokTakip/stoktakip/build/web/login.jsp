<%-- 
    Document   : login
    Created on : 20.Oca.2022, 21:05:00
    Author     : osmtr
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>Login</title>
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="Styles/login.css" rel="stylesheet" />
</head>
<body>
    <%= request.getSession()%>
   <%
        if(request.getSession().getAttribute("usertype") != null)
        {
            if((int)request.getSession().getAttribute("usertype") == 2){
                response.sendRedirect("productList.jsp");

                }else{
                                response.sendRedirect("index.jsp");

            }
        }
        
    %>
    <div class="container">
        <% if(request.getParameter("error") != null){ %>
            <div style="color:black"> <%= "Kullanıcı Bulunamadı"%></div>
        <%}%>
        <form action=""  method="post" >
            <div class="box">
                <h1>Giriş</h1>
                <div class="user">
                    <i class="fas fa-user"></i>
                    <input type="text"
                           name="username"
                           id="username"
                           autocomplete="off"
                           placeholder="Kullanıcı Adı" />
                    <i class="fas fa-unlock-alt"></i>
                    <input type="password"
                           name="password"
                           id="password"
                           autocomplete="off"
                           placeholder="Şifreniz" />
                </div>
                <div class="login-btn">
                    <button type="submit" name="login" class="btn">Giriş</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
 <% 
  String username = request.getParameter("username");
 String password = request.getParameter("password");
   String login = request.getParameter("login"); 
   
   DBUser db =  new DBUser();

    HttpSession oturum = request.getSession(true);

if(username !=null && password !=null && login !=null){
        oturum.setAttribute("username", username);
    ResultSet rs = db.vericek(username, password);
    
    if(DBUser.entry_permit){
            oturum.setAttribute("usertype", rs.getInt("UserTypeId"));

        if(rs.getInt("UserTypeId") == 1)
            response.sendRedirect("index.jsp");
        else if(rs.getInt("UserTypeId") == 2)
            response.sendRedirect("productList.jsp");

    }else{
        response.sendRedirect("login.jsp?error=403");
        
    }
    
    
}
%>