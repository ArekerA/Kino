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
        document.getElementById("menu").innerHTML = '<ul class="menu"><li><a href="index.jsp">Aktualności</a></li>'+
    '<li><a href="filmy.jsp">Filmy</a></li>'+
    '<li><a href="repertuar.jsp">Repertuar</a></li>'+
    '<li><a href="cennik.jsp">Cennik</a></li>'+
    '<li><a href="infro.jsp">Informacje</a></li>'+
    '<li><a href="zaloguj.jsp">Zaloguj</a></li></ul>';
 <%   }
    else
    { %>
            document.getElementById("menu").innerHTML = '<ul class="menu1"><li><a href="index.jsp">Aktualności</a></li>'+
    '<li><a href="filmy.jsp">Filmy</a></li>'+
    '<li><a href="repertuar.jsp">Repertuar</a></li>'+
    '<li><a href="cennik.jsp">Cennik</a></li>'+
    '<li><a href="infro.jsp">Informacje</a></li>'+
    '<li class="dropdown">'+
    '<a href="javascript:void(0)" class="dropbtn">Profil</a>'+
    '<div class="dropdown-content">'+
      '<a href="profil.jsp">Mój Profil</a>'+
      '<a href="wyloguj.jsp">Wyloguj się</a>'+
    '</div>'+
'</li>'+
'</ul>';
   <% } %>

</script>
</body>
</html>