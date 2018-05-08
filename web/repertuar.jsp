<%-- 
    Document   : repertuar
    Created on : 2018-05-05, 11:27:38
    Author     : Bartek
--%>

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
                        Date jutro = new Date() ;
                        Date dwa = new Date() ;
                        Date trzy = new Date() ;
                        Date cztery = new Date() ;
                        Date piec = new Date() ;
                        Date szesc = new Date() ;
                        jutro.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 );
                        dwa.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 2);
                        trzy.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 3 );
                        cztery.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 4 );
                        piec.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 5);
                        szesc.setTime(dzis.getTime() + 1 * 24 * 60 * 60 * 1000 * 6);     
        %>
        <input type="button" afterclick="<%wybrana=dzis;%>" value=<%String ds = dateFormat.format(dzis); out.println(ds);%>>
        <input type="button" afterclick="<%wybrana=jutro;%>" value=<%String jt = dateFormat.format(jutro); out.println(jt);%>>
          
           <button afterclick="<%wybrana=dwa;%>" type="button"><%String dw = dateFormat.format(dwa); out.println(dw);%></button>
           <button afterclick="<%wybrana=trzy;%>" type="button"><%String tr = dateFormat.format(trzy); out.println(tr);%></button>
           <button  type="button"><%String cz = dateFormat.format(cztery); out.println(cz);%></button>
           <button  type="button"><%String pi = dateFormat.format(piec); out.println(pi);%></button>
           <button  type="button"><%String sz = dateFormat.format(szesc); out.println(sz);%></button>
           <button type="button">Wybierz datę<%// Tu sie ma kalendarz otwierać%> </button>
              
 
        </article>
           

              
               <%   
                   
                  
                    out.println("<article> Repertuar dla Dnia: ");
                    String wyb = dateFormat.format(wybrana);
                    out.println(wyb);
                    out.println("</article>");
                Database.polacz();
                ArrayList<Seans> seanse = Database.readSeanse(wybrana);
                ArrayList<Film> filmy = Database.readFilmy();
                ArrayList<Wersja> wersje = Database.readWersje();
                int pom1=0;
                
                Date data = new Date();
                    out.print("<div id='dzis'>");
                    out.print("dziś");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //dziś
                        //s.getTitle();
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000 );
                    out.print("<div id='dzis'>");
                    out.print("jutro");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //jutro
                    }
                     out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000 );
                    out.print("<div id='dzis'>");
                    out.print("dwa");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //+2
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000 );
                    out.print("<div id='trzy'>");
                    out.print("trzy");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //+3
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000 );
                    out.print("<div id='cztery'>");
                    out.print("cztery");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //+4
                    }
                     out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000 );
                    out.print("<div id='piec'>");
                    out.print("piec");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //+5
                    }
                    out.print("</div>");
                    data.setTime(data.getTime() + 1 * 24 * 60 * 60 * 1000 );
                    out.print("<div id='szesc'>");
                    out.print("szesc");
                    for(Seans s : Database.readSeanse(data))
                    {
                        //+6
                    }
                    out.print("</div>");
                 
                   
                    
                    
                    
                
               /*    for(int i=0;i<seanse.size();i++)
                    
                    
                   {     
                       String s = seanse.get(i).getData();
                       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
                       Date date = sdf.parse(s);
                       String g = wybrana.toString();
                       String wybr = dateFormat.format(wybrana);
                       
      
                    out.println("<div id='dzis'>" + "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                    
                    out.println("<div id='jutro'>" + "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                    
                     out.println("<div id='pojutrze'>" + "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                     
                     out.println("<div id='trzy'>" + "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                     
                     out.println("<div id='cztery'>"+ "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                     
                     out.println("<div id='piec'>"+ "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                     
                     out.println("<div id='szesc'>" + "<div id='test'>" + "<div class='tytuł'>" + filmy.get(seanse.get(i).getIdFilmu()).getTytul() 
                                + "</div>" + "<div class='wersja'>" + 
                                wersje.get(seanse.get(i).getIdWersji()).getTekst() 
                                + "</div>"  + "<div class='godzina'>"
                               + s +  "</div></div>" + "</div>");
                     out.println("<div id='wybierzdate'>" + "</div>");
                       
                   }*/
                          Database.zamknij();
  %>                    
               
                   
 
     
    </section>
    <footer>
        Made by LA,SM,ŻB. All rigths reserved :) 
    </footer>
</div>
<script src="menu.js"></script>
</body>
</html>
