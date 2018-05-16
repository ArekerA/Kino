<%-- 
    Document   : kupbilet
    Created on : 2018-05-16, 12:13:26
    Author     : Mateusz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kup Bilet</title>
          <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="kupbilet">
        <table class="miejsca">
            <tr>
            <th class="ekran" colspan="15">EKRAN</th>
            </tr>
            <%
                for(int i=0; i<15; i++)
                {
                    out.println("<tr class=\"rzad\">");
                    for(int a=0; a<15; a++)
                    {
                        out.println("<th class=\"miejsce\">");
                        out.println("<label class=\"container\"><input type=\"checkbox\">  <span class=\"checkmark\"></span></label>");
                       out.println("</th>");
                    }
                    out.println("</tr>");
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
