<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<title>Kino Planeta</title>
</head>
<body>
    <header>        
            <div class="logo">
                    <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
    </header>
    <div class="zawartosc">           
            <ul class="menu" id="menu">
                <script src="menu.js"></script>
            </ul>
            
            <div class="Profil">
                  <%    out.println( "LOGIN: " + session.getAttribute("logged-user-nick"));  %>
                  <br>
                   <%    out.println( "MAIL: " + session.getAttribute("logged-user-email"));  %>
                   <br>
                   <br>
                   Obok Buttony do zmiany jednego i drugiego i zmiana hasła!
            </div>
            
    
    <div class="Transakcje">
           <p> Historia Transakcji </p>
              <p>
                Litwo! Ojczyzno moja! Ty jesteś jak zdrowie.
                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło pali.</p>
                 <p>
                Litwo! Ojczyzno moja! Ty jesteś jak zdrowie.
                Ile cię trzeba cenić, ten Bonapart czarował, no, tak nazywano
                młodzieńca, który teraz jeśli nasza młodzie wyjeżdża za kolana). On
                rzekł: Muszę ja Ruski, teraz się stało wody pełne naczynie blaszane
                ale widzę mniej silnie, ale mur chędogi. Sterczały wkoło pali.</p>
           
              
        </div>       
    
    <footer>
        Made by LA,SM,BŻ. All rigths reserved :) 
    </footer>
</div>
  <jsp:include page="menu.jsp"/>
</body>
</html>