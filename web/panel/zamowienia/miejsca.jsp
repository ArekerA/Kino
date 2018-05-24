<%-- 
    Document   : miejsca
    Created on : 2018-05-24, 18:41:26
    Author     : Arekl
--%>

<%@page import="Kino.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("id") != null)
    {
        Database.polacz();
        for (Miejsce b : Database.readMiejsca(Integer.parseInt(request.getParameter("id")))) {
            out.print("<option value=\"" + b.getId() + "\">" + b.getMiejsce() + "</option>");
        }
        Database.zamknij();
    }
%>
