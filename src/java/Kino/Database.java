/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Arekl
 */
package Kino;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.sqlite.*;

public class Database {
    static Connection con;
    public static Connection polacz() {
        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:mydb.sqlite");
        }catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    public static void zamknij()
    {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(JDBC.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void init()
    {
         try {
            Statement st = con.createStatement();
            st.executeUpdate("CREATE TABLE Filmy ( id INT NOT NULL, tytul TEXT NOT NULL, czas TEXT NOT NULL, img TEXT NOT NULL, opis TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Sale ( id INT NOT NULL, obraz TEXT NOT NULL, miejsca TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Wersje ( id INT NOT NULL, tekst TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Seanse ( id INT NOT NULL, id_filmu INT NOT NULL, id_wersji INT NOT NULL, data TEXT NOT NULL, sala INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_filmu) REFERENCES Filmy(id), FOREIGN KEY (id_wersji) REFERENCES Wersje(id), FOREIGN KEY (sala) REFERENCES Sale(id));");
            st.executeUpdate("CREATE TABLE Miejsca ( id INT NOT NULL, id_seansu INT NOT NULL, miejsce INT NOT NULL, dostepnosc INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_seansu) REFERENCES Seanse(id));");
            st.executeUpdate("CREATE TABLE Akrualnosci ( id INT NOT NULL, data TEXT NOT NULL, img TEXT NOT NULL, tytul TEXT NOT NULL, tekst TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Strony ( id INT NOT NULL, nazwa TEXT NOT NULL, tekst TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Bilety ( id INT NOT NULL, nazwa TEXT NOT NULL, cena NUMERIC NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Userzy ( id INT NOT NULL, nick TEXT NOT NULL, email TEXT NOT NULL, pass TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Zamowienia ( id INT NOT NULL, user INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (user) REFERENCES Userzy(id));");
            st.executeUpdate("CREATE TABLE Zamowienia_Bilety ( id INT NOT NULL, id_zamowienia INT NOT NULL, id_biletu INT NOT NULL, ilosc INT NOT NULL, miejsca TEXT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_zamowienia) REFERENCES Zamowienia(id), FOREIGN KEY (id_biletu) REFERENCES Bilety(id));");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void init2()
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("INSERT INTO Filmy VALUES ( 0, 'Tomb Raider', '118 min', '1.jpg', 'Lara Croft to niepokorna córka ekscentrycznego podróżnika, który zniknął, gdy dziewczyna miała kilkanaście lat. Teraz, jako 21-letnia kobieta, podąża własną ścieżką, odmawiając spełnienia woli ojca, który chciał dla niej spokojnego życia. Zostawia wszystko za sobą i udaje się w ostatnie znane miejsce jego pobytu. Poszukując śladów, musi odnaleźć osławiony grobowiec na mitycznej wyspie u wybrzeży Japonii. Jeśli nie przezwycięży własnych lęków, może nie przeżyć niezwykle niebezpiecznej wyprawy. Jak wiele poświęci, by poznać tajemnicę zniknięcia ojca i zyskać miano tomb raidera?');");
            st.executeUpdate("INSERT INTO Sale VALUES ( 0, 'sala1.jpg', '0,0,100,100;100,0,100,100;0,100,100,100;100,100,100,100');");
            st.executeUpdate("INSERT INTO Wersje VALUES ( 0, '2D');");
            st.executeUpdate("INSERT INTO Seanse VALUES ( 0, 0, 0, date('now'), 0);");
            st.executeUpdate("INSERT INTO Miejsca VALUES ( 0, 0, 0, 0),( 1, 0, 1, 0),( 2, 0, 2, 0),( 3, 0, 3, 0);");
            st.executeUpdate("INSERT INTO Akrualnosci VALUES ( 0, date('now'), 'a1.jpg', 'Tomb Raider już dostępny', 'Lara Croft (Alicia Vikander) wyrusza na poszukiwania swojego zaginionego ojca, lorda Richarda Crofta (Dominic West), który zniknął, gdy dziewczyna miała kilkanaście lat. Podczas swoich poszukiwań rozbija się u wybrzeży tajemniczej wyspy niedaleko Japonii. W trakcie pobytu na nieznanym lądzie dziewczyna przechodzi zmianę psychiczną oraz fizyczną i staje się słynną poszukiwaczką przygód znaną jako \"Tomb Raider\"');");
            st.executeUpdate("INSERT INTO Strony VALUES ( 0, 'kontakt', 'dane kontaktowe');");
            st.executeUpdate("INSERT INTO Bilety VALUES ( 0, 'normalny', 12.50);");
            st.executeUpdate("INSERT INTO Userzy VALUES ( 0, 'admin', 'admin@example.com', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918');");
            st.executeUpdate("INSERT INTO Zamowienia VALUES ( 0, 0);");
            st.executeUpdate("INSERT INTO Zamowienia_Bilety VALUES ( 0, 0, 0, 2, '2,3');");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
