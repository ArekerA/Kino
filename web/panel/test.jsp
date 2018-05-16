<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page import="Kino.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <link rel="stylesheet" href="../styles/style-panel.css">
    </head>
    <body>
        ${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}
        <div class="content">
        <%
            /*
            Database.polacz();
            Database.init();
            Database.init2();
            Database.zamknij();
*/
        %>
        </div>
    </body>
</html>
