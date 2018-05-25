<!DOCTYPE html>
<html>
    <head>

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="Kino.*" %>
        <%@page import="java.util.ArrayList"%>
        <title>Kino Planeta</title>
        <link rel="stylesheet" href="style.css">
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
                    <%    out.println("   Anulacja Zamówienia ");
                        out.println("<br>");

                        if (request.getParameter("y") == null) {
                            Database.polacz();
                            
                            ArrayList<Zamowienie> zamowienia = Database.readZamowienia();

                            for (Zamowienie a : zamowienia) {
                                if (a.getId() == Integer.parseInt(request.getParameter("z"))) // Chyba Dobry Warunek
                                {

                                    out.println("Zamówienie:  ");
                                    out.print("<br>" + " Typ Biletów: ");
                                    for (int i = 0; i < a.getBilety().size(); i++) {
                                        out.print("<br>" + a.getBilety().get(i).getNazwa() + " x " + a.getIlosc().get(i));
                                    }
                                    out.print("<br>");

                                    Seans s = Database.readSeans(a.getMiejsca().get(0).get(0).getIdSeansu());
                                    out.print("Film:  " + Database.readFilm(s.getIdFilmu()).getTytul() + "<br>");
                                    out.print("Data: " + s.getData() + "<br>");
                                }

                            }

                            out.println("<form action='anuluj.jsp' method='post'>");
                            out.println("<input type='hidden' name='y' value=" + request.getParameter("z") + ">");
                            out.println("<input type='submit' value='Anuluj Zamówienie'>");
                            out.println("</form>");
                            Database.zamknij();
                        } else {

                            Database.polacz();
                            Database.deleteZamowienie(Integer.parseInt(request.getParameter("y")));
                            Database.zamknij();
                            String site = new String("profil.jsp");
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site);

                        }


                    %> 
                </div>
            </div>
        </div>

        <footer>
            Made by LA,SM,BŻ. All rigths reserved :) 
        </footer>
    </div>
    <jsp:include page="menu.jsp"/>
</body>
</html>