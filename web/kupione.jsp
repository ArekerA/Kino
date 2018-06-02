<%-- 
    Document   : kupione
    Created on : 2018-05-21, 11:10:11
    Author     : Mateusz
--%>

<%@page import="Kino.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
       
        
        <%
            String[] miejsca = request.getParameterValues("miejsca");
            String[] wybor = request.getParameterValues("wybor");
            
            Database.polacz();
            Zamowienie z = new Zamowienie();
            z.setUser(Integer.parseInt(session.getAttribute("logged-user-id").toString()));
            ArrayList<Bilet> c1 = new ArrayList<Bilet>();
            ArrayList<Integer> c2 = new ArrayList<Integer>();
            ArrayList<ArrayList<Miejsce>> c3 = new ArrayList<ArrayList<Miejsce>>();
            for(String s : wybor)
            {
                Bilet b = new Bilet();
                b.setId(Integer.parseInt(s));
                c1.add(b);

            c2.add(1);
            }
            
            for(String aa : miejsca)
            {
                ArrayList<Miejsce> mArray = new ArrayList<Miejsce>();
                Miejsce m = new Miejsce();
                m.setId(Integer.parseInt(aa));
                mArray.add(m);
                c3.add(mArray);
            }

            z.setBilety(c1);
            z.setIlosc(c2);
            z.setMiejsca(c3);
            Database.createZamowienie(z);
            Database.zamknij();
        %>
    </body>
</html>