<!DOCTYPE html>
<html>
    <head>

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="Kino.*" %>
        <%@page import="java.util.ArrayList"%>
        <title>Kino Planeta</title>
        <link rel="stylesheet" href="style_1.css">
    </head>
    <body>
        <header>        
            <div class="logo">
                <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
        <div class="zawartosc" >           
            <div id="menu">
            </div>

            <div id ="cos">

                <div class="nngg">
                    <%    out.println("   Witaj Ponownie " + session.getAttribute("logged-user-nick") + "!");  %> 
                </div>
                <div class="Profil"  id="1" style="display: none">
                    
                   <div class="Profilinfo">  ZMIANA LOGINU: </div>
                    <br>
                    <%    out.println("Twój Aktualny Login to: " + session.getAttribute("logged-user-nick"));  %> 
                    <br>
                    <br>
                    Podaj Nowy Login:
                    <input type="text" name="login"> 
                      <br>
                      Podaj STARE Hasło:
                    <input type="password" name="pass3"> 
                    <br>
                    <input name="potwierdz" type="submit" value="Potwierdź"> 
                    <input name="potwierdz" type="submit" onclick="Funkcja4()" value="Powrót"> 
                </div>
                  <div class="Profil"  id="2" style="display: none">
                      <div class="Profilinfo">  ZMIANA MAILA: </div>
                    <br>
                         <%    out.println("Twój Aktualny e-mail to: " + session.getAttribute("logged-user-email"));  %> 
                    <br>
                    <br>
                    Podaj Nowy Mail:
                    <input type="text" name="mail"> 
                      <br>
                      Podaj STARE Hasło:
                    <input type="password" name="pass3"> 
                    <br>
                    <input name="potwierdz" type="submit" value="Potwierdź"> 
                    <input name="potwierdz" type="submit" onclick="Funkcja4()" value="Powrót"> 
                </div>
                  <div class="Profil"  id="3" style="display: none">
                      <div class="Profilinfo">  ZMIANA HASŁA </div>
                    <br>
                    Podaj Nowe Hasło:
                    <input type="password" name="pass"> 
                    <br>
                    Powtórz Nowe Hasło:
                    <input type="password" name="pass2"> 
                    <br>
                    Podaj STARE Hasło:
                    <input type="password" name="pass3"> 
                    <br>
                    <input name="potwierdz" type="submit" value="Potwierdź"> 
                    <input name="potwierdz" type="submit" onclick="Funkcja4()" value="Powrót"> 
                </div>
                <div class="Profil" id="0">
                    <div class="Profilinfo">  PROFIL: </div>

                    <br>


                    <%    out.println("TWÓJ LOGIN: <div class='Profilinfo'>" + session.getAttribute("logged-user-nick") + "</div>");  %>

                    <br>


                    <%    out.println("TWÓJ MAIL: <div class='Profilinfo'>" + session.getAttribute("logged-user-email") + "</div>");%>

                    <br>

                    <input type="submit" value="Zmień Login" onclick="Funkcja1()">   




                    <input type="submit" value="Zmień Maila" onclick="Funkcja2()" > 






                    <input type="submit" value="Zmień Hasło" onclick="Funkcja3()">
                    <script>
                        function Funkcja1()
                        {

                              document.getElementById('0').style.display = 'none';
                              document.getElementById('1').style.display = 'inline-block';


                        }
                        function Funkcja2()
                        {

                                
                              document.getElementById('0').style.display = 'none';
                              document.getElementById('2').style.display = 'inline-block';


                        }
                        function Funkcja3()
                        {

                                
                              document.getElementById('0').style.display = 'none';
                              document.getElementById('3').style.display = 'inline-block';


                        }
                        function Funkcja4()
                        {

                                
                              document.getElementById('1').style.display = 'none';
                              document.getElementById('2').style.display = 'none';
                              document.getElementById('3').style.display = 'none';
                              document.getElementById('0').style.display = 'inline-block';


                        }
                    </script>
                </div>
            </div>

            <div class="Transakcje">
                <p> Historia Transakcji: </p>
                <p>
                    <% Database.polacz();
                    int a =0;
                        ArrayList<Zamowienie> zamowienia = Database.readZamowienia();
                        for (Zamowienie z : zamowienia) {;
                            if (Integer.toString(z.getUser()).equals(session.getAttribute("logged-user-id"))) // Chyba Dobry Warunek
                            {
                                out.println("Tutaj Bedą zamówienia");
                                a=a+1;
                            }
                        }
                        if (a==0)
                        {
                            out.println("Jeszcze nie dokonałeś żadnego zakupu");
                        }
                    %> </p>
            </div>       

            <footer>
                Made by LA,SM,BŻ. All rigths reserved :) 
            </footer>
        </div>
        <jsp:include page="menu.jsp"/>
    </body>
</html>