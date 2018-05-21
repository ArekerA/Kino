<%-- 
    Document   : test
    Created on : 2018-05-03, 19:19:01
    Author     : Arekl
--%>

<%@page import="Kino.Sala"%>
<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Kino.Database"%>
<%@page import="Kino.Aktualnosc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale</title>
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
            <div id="add" class="button-green">Dodaj Sale</div>
            <table id="table" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Obraz</th>
                        <th>Miejsca</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Sala> sale = Database.readSale();
                        for (Sala a : sale) {
                    %>
                    <tr>
                        <td><%=a.getId()%></td>
                        <td><%=a.getObraz()%></td>
                        <td><%=a.getMiejsca()%></td>
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
            <div id="dialog" title="Modyfikuj Salę">
                <div class='center'>
                    <form action="edit.jsp" method="post" accept-charset="UTF-8">
                        <input id="edit-id" type="hidden" name="id" value="0">
                        <input id="edit-miejsca" class='input-center' type="text" name="miejsca" placeholder="Miejsca"><br/><br/>
                        <input type='submit' value='Edytuj' class="button-green">
                    </form>
                    <form action="del.jsp" method="post" accept-charset="UTF-8">
                        <input id="del-id" type="hidden" name="id" value="0">
                        <input type='submit' value='Usuń' class="button-red">
                    </form>
                </div>
            </div>
            <div id="dialog-add" title="Dodaj Salę">
                <div class='center'>
                    <form action="dodaj.jsp" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <input class='input-center' type="text" name="miejsca" placeholder="Miejsca"><br/><br/>
                        <input type="file" name="img" placeholder="Obraz"><br/><br/>
                        <input type='submit' value='Dodaj' class="button-green">
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
                            'targets': 1,
                            'render': function (data, type, full, meta) {
                                return data.length > 25 ? data.substr(0, 22) + '…' : data;
                            }
                        },
                        {
                            'targets': 2,
                            "width": "50%",
                            'render': function (data, type, full, meta) {
                                return data.length > 100 ? data.substr(0, 97) + '…' : data;
                            }
                        }
                    ]
                });
                $('#table tbody').on('click', 'tr', function () {
                    var data = table.row(this).data();
                    $("#dialog").dialog("open");
                    $("#edit-miejsca").val(data[2]);
                    $("#edit-id").val(data[0]);
                    $("#del-id").val(data[0]);
                });
                $("#dialog").dialog({
                    width: 400,
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
                    width: 400,
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
