<%-- 
    Document   : repertuar
    Created on : 2018-05-05, 11:27:38
    Author     : Bartek
--%>

<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="Kino.Wersja"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Kino.Database"%>
<%@page import="Kino.Film"%>
<%@page import="Kino.Seans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kino Planeta</title>
        <link rel="stylesheet" href="style.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    </head>
    <body>
        <header>        
            <div class="logo">
                <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
        <div class="zawartosc">           
            <ul class="menu" id="menu">
            </ul>

            <section>
                <article>
                    <%
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date dzis = new Date();
                        Date wybrana = new Date();
                        Date jutro = new Date();
                        Date dwa = new Date();
                        Date trzy = new Date();
                        Date cztery = new Date();
                        Date piec = new Date();
                        Date szesc = new Date();
                        jutro.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000);
                        dwa.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 2);
                        trzy.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 3);
                        cztery.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 4);
                        piec.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 5);
                        szesc.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 6);
                    %>
                    <input type="button" onclick = "pokazuj('dzis')" value=<%String ds = dateFormat.format(dzis);
            out.println(ds);%> class="dzien">
                    <input type="button" onclick = "pokazuj('jutro')" value=<%String jt = dateFormat.format(jutro);
            out.println(jt);%>class="dzien">
                    <input type="button" onclick = "pokazuj('dwa')" value=<%String dw = dateFormat.format(dwa);
            out.println(dw);%>class="dzien">
                    <input type="button" onclick = "pokazuj('trzy')" value=<%String tr = dateFormat.format(trzy);
            out.println(tr);%>class="dzien">
                    <input type="button" onclick = "pokazuj('cztery')" value=<%String cz = dateFormat.format(cztery);
            out.println(cz);%>class="dzien">
                    <input type="button" onclick = "pokazuj('piec')" value=<%String pi = dateFormat.format(piec);
            out.println(pi);%>class="dzien">
                    <input type="button" onclick = "pokazuj('szesc')" value=<%String sz = dateFormat.format(szesc);
            out.println(sz);%>class="dzien">

                    <script>
                        function pokazuj(i) {

                            document.getElementById('dzis').style.display = 'none';
                            document.getElementById('jutro').style.display = 'none';
                            document.getElementById('dwa').style.display = 'none';
                            document.getElementById('trzy').style.display = 'none';
                            document.getElementById('cztery').style.display = 'none';
                            document.getElementById('piec').style.display = 'none';
                            document.getElementById('szesc').style.display = 'none';
                            document.getElementById(i).style.display = 'inline';



                        }

                    </script>
                </article>



                <%

                    String wyb;
                    Database.polacz();
                    ArrayList<Seans> seanse = Database.readSeanse(wybrana);
                    ArrayList<Film> filmy = Database.readFilmy();
                    ArrayList<Wersja> wersje = Database.readWersje();
                    int pom1 = 0;

                    Date data = new Date();
                    out.print("<div class='mm' id='dzis' style='display:block-inline'>");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");
                    for (Seans s : Database.readSeanse(data)) {
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div >");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000);
                    out.print("<div class='mm' id='jutro' style='display:none'>");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");

                    for (Seans s : Database.readSeanse(data)) {
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000);
                    out.print("<div class='mm' id='dwa' style='display:none'>");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");

                    for (Seans s : Database.readSeanse(data)) {
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000);
                    out.print("<div class='mm' id='trzy' style='display:none'>");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");

                    for (Seans s : Database.readSeanse(data)) {
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000);
                    out.print("<div class='mm' id='cztery' style='display:none' >");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");

                    for (Seans s : Database.readSeanse(data)) {
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000);
                    out.print("<div class='mm' id='piec' style='display:none' >");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");

                    for (Seans s : Database.readSeanse(data)) {
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000);
                    out.print("<div class='mm'  id='szesc' style='display:none'>");
                    out.println("<article> Repertuar dla Dnia: ");
                    wyb = dateFormat.format(data);
                    out.println(wyb);
                    out.println("</article>");

                    for (Seans s : Database.readSeanse(data)) {
                    
                        out.println("<div class = 'z2' id='z2'>" + "<div class='tytuł2'>" + filmy.get(s.getIdFilmu()).getTytul() + " (" + filmy.get(s.getIdFilmu()).getCzas() + ") "
                                + "</div>" + "<div class='wersja2'>"
                                + wersje.get(s.getIdWersji()).getTekst() + ' '
                                + "</div>" + "<div class='godzina'>"
                                + "Godzina Rozpoczęcia Seansu: " + s.getData().substring(11) + ' ' + "</div><a href=\"kupbilet.jsp\" onclick=\"window.open('kupbilet.jsp?id="+s.getId()+"', 'newwindow', 'width=600,height=600'); return false;\">Kup Bilet</a></div>");
                    }
                    out.print("</div>");

                    Database.zamknij();
                %>                    

           


            </section>
            <footer>
                Made by LA,SM,ŻB. All rigths reserved :) 
            </footer>
        </div>
        <jsp:include page="menu.jsp"/>
        <script>
            function myFunction(url, title, w, h) {
                id=tile;
                String x=url.toString()+"?id="+title.toString();
                url=x;
                // Fixes dual-screen position                         Most browsers      Firefox
                var dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : window.screenX;
                var dualScreenTop = window.screenTop !== undefined ? window.screenTop : window.screenY;

                var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
                var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

                var left = ((width / 2) - (w / 2)) + dualScreenLeft;
                var top = ((height / 2) - (h / 2)) + dualScreenTop;
                var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
                
                // Puts focus on the newWindow
                if (window.focus) {
                    newWindow.focus();
                }
                    
            }
        </script>
    </body>
</html>
