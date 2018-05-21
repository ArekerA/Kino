<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Kino.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zamówienia</title>
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
                    } else if (Integer.valueOf(session.getAttribute("logged-user-level").toString()) < 2) {
                        String site = new String("../index.jsp");
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site);
                    } else {

                        Database.polacz();
            %>
            <div id="add" class="button-green">Dodaj Zamówienie</div>
            <table id="table" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>User</th>
                        <th>Bilety &rarr; Miejsca</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Zamowienie> zamowienia = Database.readZamowienia();
                        for (Zamowienie a : zamowienia) {
                    %>
                    <tr>
                        <td><%=a.getId()%></td>
                        <td><%=Database.readUserNick(a.getUser())%></td>
                        <td><%
                            for (int i = 0; i < a.getBilety().size(); i++) {
                                out.print(a.getBilety().get(i).getNazwa()+" x "+a.getIlosc().get(i)+" &rarr; "+a.getMiejsca().get(i)+"<br>");
                            }
                        %></td>
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
            <div id="dialog-add" title="Dodaj Zamówienie">
                <div class='center'>
                    <form action="dodaj.jsp" method="post" accept-charset="UTF-8">
                        <input class='input-center' type="text" name="nick" placeholder="Nick"><br/><br/>
                        <input class='input-center' type="text" name="email" placeholder="Email"><br/><br/>
                        <input class='input-center' type="password" name="pass" placeholder="Hasło"><br/><br/>
                        Poziom: <select name='lvl'>    
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select><br/><br/>
                        <input type='submit' value='Dodaj' class="button-green">
                    </form>
                </div>
            </div>
            <div id="dialog" title="Modyfikuj Zamówienie">
                <div class='center'>
                    <form action="edit.jsp" method="post" accept-charset="UTF-8">
                        <input id="edit-nick" class='input-center' type="text" name="nick" placeholder="Nick"><br/><br/>
                        <input id="edit-email" class='input-center' type="text" name="email" placeholder="Email"><br/><br/>
                        <input id="edit-pass" class='input-center' type="password" name="pass" placeholder="Hasło (zostaw puste jeśli nie zmieniasz)"><br/><br/>
                        Poziom: <select id="edit-lvl" name='lvl'>    
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select><br/><br/>
                        <input id="edit-id" type="hidden" name="id" value="0">
                        <input type='submit' value='Edytuj' class="button-green">
                    </form>
                    <form action="del.jsp" method="post" accept-charset="UTF-8">
                        <input id="del-id" type="hidden" name="id" value="0">
                        <input type='submit' value='Usuń' class="button-red">
                    </form>
                </div>
            </div>
        </div>
        <script src="../../scripts/jquery-3.3.1.min.js"></script>
        <script src="../../scripts/jquery.dataTables.min.js"></script>
        <script src="../../scripts/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                var table = $('#table').DataTable({
                    "order": [[0, "asc"]],
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Polish.json"
                    },
                    "columnDefs": [
                        {
                            'targets': 2,
                            'render': function (data, type, full, meta) {
                                return data.length > 100 ? data.substr(0, 97) + '…' : data;
                            }
                        }
                    ]
                });
                $('#table tbody').on('click', 'tr', function () {
                    var data = table.row(this).data();
                    $("#dialog").dialog("open");
                    $("#del-id").val(data[0]);
                    $("#edit-id").val(data[0]);
                    $("#edit-nick").val(data[1]);
                    $("#edit-email").val(data[2]);
                    $("#edit-lvl").val(data[3]);
                });
                $("#dialog").dialog({
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
                $("#dialog-add").dialog({
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
                $("#add").click(function () {
                    $("#dialog-add").dialog("open");
                });
            });
        </script>
    </body>
</html>
