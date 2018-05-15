<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Kino.Database"%>
<%@page import="Kino.Aktualnosc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aktualności</title>
        <link rel="stylesheet" href="../../styles/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../../styles/jquery-ui.min.css">
        <link rel="stylesheet" href="../../styles/style-panel.css">
    </head>
    <body>
        <jsp:include page="../menu.jsp"/>
        <div class="content">
        <%
            if (session.getAttribute("logged-user-id") == null) {
                String site = new String("../index.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else {
                if (request.getParameter("logut") != null) {
                    session.setAttribute("logged-user-id", null);
                    session.setAttribute("logged-user-nick", null);
                    session.setAttribute("logged-user-email", null);
                    session.setAttribute("logged-user-level", null);
                    String site = new String("../index.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
                else if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) < 2) {
                    String site = new String("../index.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {

                    Database.polacz();
                    %>
                    <div id="add" class="button-green">Dodaj aktualność</div>
                    <table id="table" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Tytuł</th>
                                <th>Tekst</th>
                                <th>Obraz</th>
                                <th>Data</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Aktualnosc> aktualnosci = Database.readAktualnosci();
                            for (Aktualnosc a : aktualnosci) {
                        %>
                        <tr>
                            <td><%=a.getId()%></td>
                            <td><%=a.getTytul()%></td>
                            <td><%=a.getTekst()%></td>
                            <td><%=a.getImg()%></td>
                            <td><%=a.getData()%></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <%
                    Database.zamknij();
                }
            }
        %>
            <div id="dialog" title="Basic dialog">
                
                <p><p id="tescik"></p>This is an animated dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
            </div>
            <div id="dialog-add" title="Dodaj Aktualność">
                
                <p>Tutaj można dodać akutalność</p>
                <form action="dodaj.jsp" method="post">
                Tytuł:
                 <br>
                <input type="text" name="tytul"> 
                 <br>
                 Treść:
                <br>
                <input type="text" name="tekst" >  
                nazwa pliku (np.: ex.jpg):
                <br>
                <input type="text" name="img" > 
                 <br>
                <input type="submit" value="Potwierdź">
                </form>
            </div>
        </div>
        <script src="../../scripts/jquery-3.3.1.min.js"></script>
        <script src="../../scripts/jquery.dataTables.min.js"></script>
        <script src="../../scripts/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function() {
                var table = $('#table').DataTable( {
                    "order": [[ 4, "desc" ]],
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Polish.json"
                    },
                    "columnDefs": [
                        {
                           'targets': 1,
                           'render': function(data, type, full, meta){
                              return data.length > 25 ?data.substr( 0, 22 ) +'…' :data;
                           }
                        },
                        {
                           'targets': 2,
                           "width": "50%",
                           'render': function(data, type, full, meta){
                              return data.length > 100 ?data.substr( 0, 97 ) +'…' :data;
                           }
                        },
                        {
                           'targets': 3,
                           'render': function(data, type, full, meta){
                              return data.length > 25 ?data.substr( 0, 22 ) +'…' :data;
                           }
                        }
                    ]
                } );
                $('#table tbody').on('click', 'tr', function () {
                    var data = table.row( this ).data();
                    $( "#dialog" ).dialog( "open" );
                    $( "#tescik" ).html(data[1]);
                } );
                $( "#dialog" ).dialog({
                    autoOpen: false,
                    show: {
                      effect: "fade",
                      duration: 400
                    },
                    hide: {
                      effect: "fade",
                      duration: 400
                    }
                });
                $( "#dialog-add" ).dialog({
                    autoOpen: false,
                    show: {
                      effect: "fade",
                      duration: 400
                    },
                    hide: {
                      effect: "fade",
                      duration: 400
                    }
                });
                $( "#add" ).click(function() {
                    $( "#dialog-add" ).dialog( "open" );
                });
            } ); 
        </script>
    </body>
</html>
