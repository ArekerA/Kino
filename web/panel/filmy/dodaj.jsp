<%-- 
    Document   : dodaj
    Created on : 2018-05-15, 12:10:25
    Author     : Arekl
--%>

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
        <title>Dodaj Film</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            Database.polacz();
            if (request.getParameter("tytul") != null) {
                Part filePart = request.getPart("img");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String ext = "";
                int i = fileName.lastIndexOf('.');
                if (i > 0) {
                    ext = fileName.substring(i + 1);
                }
                int id = Database.readNextIdFilm();
                fileName = "f" + id + "." + ext;
                File file = new File(request.getRealPath("/") + "img/", fileName);

                InputStream input = filePart.getInputStream();
                Files.copy(input, file.toPath());
                Database.createFilm(request.getParameter("tytul"), request.getParameter("czas"), fileName, request.getParameter("tekst"), request.getParameter("link"));
                
            }
            Database.zamknij();
            String site = new String("index.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        %>

    </body>
</html>
