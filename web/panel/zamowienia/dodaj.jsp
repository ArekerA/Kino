<%-- 
    Document   : dodaj
    Created on : 2018-05-15, 12:10:25
    Author     : Arekl
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Kino.*"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Kino.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodaj Usera</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            Database.polacz();
            if (request.getParameter("user") != null) {
                Database.polacz();
                Zamowienie z = new Zamowienie();
                z.setUser(Integer.parseInt(request.getParameter("user")));
                ArrayList<Bilet> c1 = new ArrayList<Bilet>();
                ArrayList<Integer> c2 = new ArrayList<Integer>();
                ArrayList<ArrayList<Miejsce>> c3 = new ArrayList<ArrayList<Miejsce>>();
                int i = 0;
                while(request.getParameter("ilosc"+i) != null)
                {
                    Bilet b = new Bilet();
                    b.setId(Integer.parseInt(request.getParameter("bilet"+i)));
                    c1.add(b);

                    c2.add(Integer.parseInt(request.getParameter("ilosc"+i)));

                    ArrayList<Miejsce> mArray = new ArrayList<Miejsce>();
                    String a[] = request.getParameterValues("miejsca"+i);
                    for(String aa : a)
                    {
                        Miejsce m = new Miejsce();
                        m.setId(Integer.parseInt(aa));
                        mArray.add(m);
                    }
                    c3.add(mArray);
                    ++i;
                }
                z.setBilety(c1);
                z.setIlosc(c2);
                z.setMiejsca(c3);
                Database.createZamowienie(z);
                Database.zamknij();
            }
            
            String site = new String("index.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
            
        %>

    </body>
</html>
