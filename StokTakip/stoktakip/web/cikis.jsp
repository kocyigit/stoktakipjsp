<%-- 
    Document   : cikis
    Created on : 20.Oca.2022, 21:53:43
    Author     : osmtr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%     
    HttpSession oturum = request.getSession(true);
    oturum.removeAttribute("username");
    oturum.removeAttribute("usertype");
    
        response.sendRedirect("login.jsp");

 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Hello World!</h1>
</body>
</html>
