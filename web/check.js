/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function zaloguj()
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("log").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "http://localhost:8080/Kino/Finish?zmienna=ukryj", true);
    xhttp.send();
}
function pokaz()
{
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("log").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "http://localhost:8080/Kino/Finish?zmienna=pokaz", true);
    xhttp.send();
}
