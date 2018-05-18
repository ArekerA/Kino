<%-- 
    Document   : kupbilet
    Created on : 2018-05-16, 12:13:26
    Author     : Mateusz
--%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Kino.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
       
        <div class="kupbilet">
        <table class="miejsca">
            <tr>
            <th class="ekran" colspan="15">EKRAN</th>
            </tr>
            <%
                
                Database.polacz();
                ArrayList<Miejsce> miejsca1=Database.readMiejsca();
                ArrayList<Miejsce> miejsca=new ArrayList<Miejsce>();
                for(int size=0; size<miejsca1.size(); size++)
                {
                    if(miejsca1.get(size).getIdSeansu()==3)
                    {
                        miejsca.add(miejsca1.get(size));
                    }
                }
                
                for(int i=0; i<15; i++)
                {
                    
                    out.println("<tr class=\"rzad\">");
                    for(int a=0; a<15; a++)
                    {
                        out.println("<th class=\"miejsce\">");
                        
                        if (miejsca.get(14*i+(a+i)).getDostepnosc()==1)
                        {
                            out.println("<label class=\"container\"><input type=\"checkbox\" checked onclick=\"return false;\">  <span class=\"checkmark\" ></span></label>");
                        }
                        else
                        {
                            out.println("<label class=\"container\"><input type=\"checkbox\">  <span class=\"checkmark\"></span></label>");
                        }
                        
                       out.println("</th>");
                    }
                    out.println("</tr>");
                    Database.zamknij();
                }
            %>
            </table>
            <div class="kup">
            <h1>Podaj dane</h1> 
            <form action="" method="post">
             Imię:
             <input type="text" name="imie"> 
             <br>
             Nazwisko:
              <input type="text" name="nazwisko"> 
              <br>
              
             Adres email (ten z małpą):
              <input type="email" name="email"> 
              <br>
              Telefon:
              <input type="number" name="phone"> 
              <br>
            <input type="submit" value="Kupuję!">
            </form>
        </div>
            <div>
        
        
    </body>
</html>
