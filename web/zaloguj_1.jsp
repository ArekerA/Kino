<%-- 
    Document   : zaloguj
    Created on : 2018-05-02, 10:18:44
    Author     : Mateusz
--%>

<%@page contentType="text/html"  pageEncoding="UTF-8"%>
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
            DANE DO LOGOWANIA NIE POPRAWNE
            <br>
            <br>
            <h1>Podaj PRAWIDŁOWE dane do logowania</h1> 
            <form action="login.jsp" method="post">
             Login:
              <br>
             <input type="text" name="login"> 
             <br><br>
             Hasło:
              <br>
              <input type="password" name="haslo"> 
             <br><br>
            <input type="submit" value="Potwierdź">
            </form>
            <br>
            <h2>Nie masz konta?</h2>
             
            
            <form action="rejestruj.jsp" method="post">
                 <input type="submit" value="Zarejestruj się">
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
