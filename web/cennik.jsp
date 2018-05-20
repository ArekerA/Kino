<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="Kino.*" %>
        <title>Kino Planeta</title>
    </head>
    <body>
        <header>        
            <div class="logo">
                <img src="img/kino_logo.png" alt="Kino Planeta">
            </div>
        </header>
        <div class="zawartosc"> <ul class="menu" id="menu">
            </ul>
            <aside>
                <div class="boczne">
                    <p>Kino Planeta</p>
                    <p>Kraków, Warszawska 24</p>
                    <a href="mailto:someone@example.com?Subject=Hello%20again">Napisz do nas</a>
                </div>

            </aside>
            <section>
                <article>
                    <table>
                        <tr><td>Seans</td><td>Normalny</td><td>Ulgowy</td></tr>

                        <tr>    <td><div class="dwade">2D</div></td>    <td><div class="dwade">13zł</div></td>   <td><div class="dwade">10zł</div></td>   </tr>

                        <tr>    <td><div class="trzyde">3D</div></td>     <td><div class="trzyde">15zł</div></td>       <td><div class="trzyde">13zł</div></td>   </tr>
                    </table>    
                </article>

            </section>
            <footer>
                Made by LA,SM,BŻ. All rigths reserved :)
            </footer>
        </div>

        <jsp:include page="menu.jsp"/>
    </body>
</html>