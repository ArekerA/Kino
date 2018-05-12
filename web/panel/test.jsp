<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <link rel="stylesheet" href="../styles/style-panel.css">
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="content">
        <%
            if (session.getAttribute("logged-user-id") != null) {
                out.print("<h2>Nick: "+ session.getAttribute("logged-user-nick")+"</h2>");
                out.print("<h2>Email: "+ session.getAttribute("logged-user-email")+"</h2>");
                out.print("<h2>Level: "+ session.getAttribute("logged-user-level")+"</h2>");
            }
        %>
        </div>
    </body>
</html>
