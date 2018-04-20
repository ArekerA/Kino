<%-- 
    Document   : test
    Created on : 2018-04-18, 10:49:33
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            out.println("Your IP address is " + request.getRemoteAddr());
        %>
        <%
            Class.forName("org.sqlite.JDBC");

            out.println("<h2>Ścieżka do bazy: " + System.getProperty("user.dir") + "</h2>");
            
            Connection conn = DriverManager.getConnection("jdbc:sqlite:mydb.sqlite");
            Statement st = conn.createStatement();
            try {
                st.executeUpdate("CREATE TABLE test ( id INT NOT NULL, test VARCHAR(50) NOT NULL);");
            } catch (SQLException e) {
                System.out.println("error przy tworzeniu tabeli test"+e);
            }
            try {
                st.executeUpdate("INSERT INTO test values(0,'ttt'),(1,'aaa');");
            } catch (SQLException e) {
            }
            ResultSet rs = st.executeQuery("select * from test;");

            out.println("<table>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("id") + "</td>");
                out.println("<td>" + rs.getString("test") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            rs.close();
            conn.close();
          
        %>
        <%
            
        %>
    </body>
</html>
