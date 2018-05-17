<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<body>
<script> 
    <% if (session.getAttribute("logged-user-id") == null) { %>
        document.getElementById("menu").innerHTML = '<li><a href="index.jsp">Aktualności</a></li>'+
    '<li><a href="filmy.jsp">Filmy</a></li>'+
    '<li><a href="repertuar.jsp">Repertuar</a></li>'+
    '<li><a href="cennik.jsp">Cennik</a></li>'+
    '<li><a href="infro.jsp">Informacje</a></li>'+
    '<li><a href="zaloguj.jsp">Zaloguj</a></li>';
 <%   }
    else
    { %>
            document.getElementById("menu").innerHTML = '<li><a href="index.jsp">Aktualności</a></li>'+
    '<li><a href="filmy.jsp">Filmy</a></li>'+
    '<li><a href="repertuar.jsp">Repertuar</a></li>'+
    '<li><a href="cennik.jsp">Cennik</a></li>'+
    '<li><a href="infro.jsp">Informacje</a></li>'+
    '<li><a href="profil.jsp">Mój Profil</a></li>' +
      '<li><a href="wyloguj.jsp">Wyloguj</a></li>';
   <% } %>

</script>
</body>
</html>