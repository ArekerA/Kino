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
                <div id='err'> </div>
                <div class="Profil"  id="1" style="display: none">

                    <div class="Profilinfo">  ZMIANA LOGINU: </div>
                    <br>
                    <%    out.println("Twój Aktualny Login to: " + session.getAttribute("logged-user-nick"));  %> 
                    <br>
                    <br>
                    <form action="profil.jsp" method="post">
                        Podaj Nowy Login:
                        <input type="text" name="login"> 
                        <br>
                        Podaj STARE Hasło:
                        <input type="password" name="pass3"> 
                          <input type="hidden" name="form1" value="1"> 
                        <br>
                        <input name="potwierdz" type="submit" value="Potwierdź"> 
                    </form>
                    <br>
                    <input name="potwierdz" type="submit" onclick="Funkcja4()" value="Powrót"> 
                </div>
                <div class="Profil"  id="2" style="display: none">
                    <div class="Profilinfo">  ZMIANA MAILA: </div>
                    <br>
                    <%    out.println("Twój Aktualny e-mail to: " + session.getAttribute("logged-user-email"));%> 
                    <br>
                    <br>
                    <form action="profil.jsp" method="post">
                        Podaj Nowy Mail:
                        <input type="text" name="mail"> 
                        <br>
                        Podaj STARE Hasło:
                        <input type="password" name="pass3"> 
                          <input type="hidden" name="form2" value="2"> 
                        <br>
                        <input name="potwierdz" type="submit" value="Potwierdź"> 
                    </form>
                    <br>
                    <input name="potwierdz" type="submit" onclick="Funkcja4()" value="Powrót"> 
                </div>
                <div class="Profil"  id="3" style="display: none">
                    <div class="Profilinfo">  ZMIANA HASŁA </div>
                    <br>
                    <form action="profil.jsp" method="post">
                        Podaj Nowe Hasło:
                        <input type="password" name="pass"> 
                        <br>
                        Powtórz Nowe Hasło:
                        <input type="password" name="pass2"> 
                        <br>
                        Podaj STARE Hasło:
                        <input type="password" name="pass3">
                        <input type="hidden" name="form3" value="3"> 
                        <br>
                        <input name="potwierdz" type="submit" value="Potwierdź"> 
                    </form>
                    <br>
                    <input name="potwierdz" type="submit" onclick="Funkcja4()" value="Powrót"> 
                </div>
                <div class="Profil" id="0">
                    <div class="Profilinfo">  PROFIL: </div>

                    <br>


                    TWÓJ LOGIN: <div class='Profilinfo'><%=session.getAttribute("logged-user-nick")%></div>

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

                            document.getElementsByName("login").value = null;
                            document.getElementsByName("pass3").value = null;
                            document.getElementsByName("mail").value = null;
                            document.getElementsByName("pass").value = null;
                            document.getElementsByName("pass2").value = null;
                            document.getElementById('1').style.display = 'none';
                            document.getElementById('2').style.display = 'none';
                            document.getElementById('3').style.display = 'none';
                            document.getElementById('0').style.display = 'inline-block';


                        }
                    </script>

                    <%
                        Database.polacz();
                        // 
                        if (request.getParameter("form3") != null) {
                            if (Database.checkPass(SHA256.szyfruj(request.getParameter("pass3").toString()), Integer.parseInt(session.getAttribute("logged-user-id").toString()))) {

                                if (request.getParameter("pass2").equals(request.getParameter("pass"))) {
                                    Database.updateUser(Integer.parseInt(session.getAttribute("logged-user-id").toString()), session.getAttribute("logged-user-nick").toString(), session.getAttribute("logged-user-email").toString(), SHA256.szyfruj(request.getParameter("pass")), Integer.parseInt(session.getAttribute("logged-user-level").toString()));
                                    out.print("<script> document.getElementById('err').innerHTML = 'Udana Zmiana Hasła'; </script>");
                                } else {
                                    out.print("<script> document.getElementById('err').innerHTML = 'PODANE HASŁA NIE SĄ TAKIE SAME - Zmiana Hasła'; </script>");
                                    //wpisane nowe hasła są różne
                                }

                            } else {
                                out.print("<script> document.getElementById('err').innerHTML = 'PODANE BŁĘDNE HASŁO'  ; </script>");
                                
                            }

                        }
                        if (request.getParameter("form2") != null) {
                            if (Database.checkPass(SHA256.szyfruj(request.getParameter("pass3").toString()), Integer.parseInt(session.getAttribute("logged-user-id").toString()))) {

                                if (Database.checkEmail(request.getParameter("mail"))) {

                                    Database.updateUser(Integer.parseInt(session.getAttribute("logged-user-id").toString()), session.getAttribute("logged-user-nick").toString(), request.getParameter("mail"), SHA256.szyfruj(request.getParameter("pass3")), Integer.parseInt(session.getAttribute("logged-user-level").toString()));
                                    session.setAttribute("logged-user-email", request.getParameter("mail"));
                                    out.print("<script> document.getElementById('err').innerHTML = 'Udana Zmiana Maila'; </script>");
                                } else {
                                    out.print("<script> document.getElementById('err').innerHTML = 'PODANY LOGIN JEST ZAJĘTY'; </script>");
                                    // Mail już jest w bazie
                                }

                            } else {
                                out.print("<script> document.getElementById('err').innerHTML = 'PODANE BŁĘDNE HASŁO- Zmiana Maila'; </script>");
                            }

                        }
                        if (request.getParameter("form1") != null) {
                            out.println(Integer.parseInt(session.getAttribute("logged-user-id").toString()));
                            out.println(SHA256.szyfruj(request.getParameter("pass3").toString()));
                            out.println(Database.checkPass(SHA256.szyfruj(request.getParameter("pass3").toString()), Integer.parseInt(session.getAttribute("logged-user-id").toString())));
                            if (Database.checkPass(SHA256.szyfruj(request.getParameter("pass3").toString()), Integer.parseInt(session.getAttribute("logged-user-id").toString()))) {
                                if (Database.checkNick(request.getParameter("login"))) {

                                    Database.updateUser(Integer.parseInt(session.getAttribute("logged-user-id").toString()), request.getParameter("login"), session.getAttribute("logged-user-email").toString(), SHA256.szyfruj(request.getParameter("pass3")), Integer.parseInt(session.getAttribute("logged-user-level").toString()));
                                    session.setAttribute("logged-user-nick", request.getParameter("login"));
                                     out.print("<script> document.getElementById('err').innerHTML = 'Udana Zmiana Loginu'; </script>");
                                } else {
                                    out.print("<script> document.getElementById('err').innerHTML = 'PODANY LOGIN JEST ZAJĘTY'; </script>");
                                    // login juz jest w bazie
                                }
                            } else {
                                out.print("<script> document.getElementById('err').innerHTML = 'PODANE BŁĘDNE HASŁO- Zmiana Loginu'; </script>");
                            }

                        }

                        Database.zamknij();
                    %>
                </div>
            </div>

            <div class="Transakcje">
                <p> Historia Transakcji: </p>
                <p>
                    <% Database.polacz();
                        int a = 0;
                        ArrayList<Zamowienie> zamowienia = Database.readZamowienia();
                        for (Zamowienie z : zamowienia) {;
                            if (Integer.toString(z.getUser()).equals(session.getAttribute("logged-user-id"))) // Chyba Dobry Warunek
                            {
                                out.println("Tutaj Bedą zamówienia");
                                a = a + 1;
                            }
                        }
                        if (a == 0) {
                            out.println("Jeszcze nie dokonałeś żadnego zakupu");
                        }
                        Database.zamknij();
                    %> </p>
            </div>       

            <footer>
                Made by LA,SM,BŻ. All rigths reserved :) 
            </footer>
        </div>
        <jsp:include page="menu.jsp"/>
    </body>
</html>