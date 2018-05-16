<%-- 
    Document   : zaloguj
    Created on : 2018-05-02, 10:18:44
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>        
            <div class="logo">
                    <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
    </header>
    <div class="zawartosc"> <ul class="menu" id="menu">
        </ul>
           
    <section>
        <div class="login">
             <br>
            PODANE HASŁA NIE SĄ TAKIE SAME
            <br>
            <br>
            <h1>Podaj wymagane dane</h1> 
            <form action="register.jsp" method="post">
             Imię (albo ksywka):
              <br>
             <input type="text" name="login"> 
             <br><br>
             Hasło (tylko wymyśl coś oryginalnego):
              <br>
              <input type="password" name="haslo"> 
              <br><br>
              Potwierdź Hasło (wpisz po prostu drugi raz):
              <br>
              <input type="password" name="confirmed"> 
             <br><br>
             Adres email (ten z małpą):
              <br>
              <input type="email" name="email"> 
              <br><br>
            <input type="submit" value="Potwierdź">
            </form>
        </div>
    </section>
    <footer>
        Made by LA,SM,ŻM. All rigths reserved :)
    </footer>
</div>

<script src="menu.js"></script>
    </body>
</html>
