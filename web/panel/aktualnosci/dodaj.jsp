<%-- 
    Document   : dodaj
    Created on : 2018-05-15, 12:10:25
    Author     : Mateusz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
    String tytul = request.getParameter("tytul");    
    String tekst = request.getParameter("tekst");
    String img = request.getParameter("img");
     Class.forName("org.sqlite.JDBC");
    Connection  con = DriverManager.getConnection("jdbc:sqlite:mydb.sqlite");
    Statement st = con.createStatement();
    ResultSet rs ;
    rs = st.executeQuery("SELECT MAX(id) FROM Aktualnosci;");
    rs.next();
    //ResultSet rs;
    int i =  st.executeUpdate("INSERT INTO Aktualnosci (id,data,img,tytul,tekst) VALUES ('SELECT MAX(id)FROM Aktualnosci','SELECT date(now)','"+img+"','"+tytul+"','"+tekst+"');");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("cennik.html");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("infro.html");
    }
%>
    </body>
</html>
