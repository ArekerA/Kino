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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
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
            st.executeUpdate("CREATE TABLE Filmy ( id INT NOT NULL, tytul TEXT NOT NULL, czas TEXT NOT NULL, img TEXT NOT NULL, opis TEXT NOT NULL, link TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Sale ( id INT NOT NULL, obraz TEXT NOT NULL, miejsca TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Wersje ( id INT NOT NULL, tekst TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Seanse ( id INT NOT NULL, id_filmu INT NOT NULL, id_wersji INT NOT NULL, data TEXT NOT NULL, sala INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_filmu) REFERENCES Filmy(id), FOREIGN KEY (id_wersji) REFERENCES Wersje(id), FOREIGN KEY (sala) REFERENCES Sale(id));");
            st.executeUpdate("CREATE TABLE Miejsca ( id INT NOT NULL, id_seansu INT NOT NULL, miejsce INT NOT NULL, dostepnosc INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_seansu) REFERENCES Seanse(id));");
            st.executeUpdate("CREATE TABLE Aktualnosci ( id INT NOT NULL, data TEXT NOT NULL, img TEXT NOT NULL, tytul TEXT NOT NULL, tekst TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Strony ( id INT NOT NULL, nazwa TEXT NOT NULL, tekst TEXT NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Bilety ( id INT NOT NULL, nazwa TEXT NOT NULL, cena NUMERIC NOT NULL, PRIMARY KEY (id));");
            st.executeUpdate("CREATE TABLE Userzy ( id INT NOT NULL, nick TEXT NOT NULL, email TEXT NOT NULL, pass TEXT NOT NULL, level INT NOT NULL, PRIMARY KEY (id));");
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
            st.executeUpdate("INSERT INTO Filmy VALUES ( 0, 'Tomb Raider', '118 min', 'b1.jpg', 'Lara Croft to niepokorna córka ekscentrycznego podróżnika, który zniknął, gdy dziewczyna miała kilkanaście lat. Teraz, jako 21-letnia kobieta, podąża własną ścieżką, odmawiając spełnienia woli ojca, który chciał dla niej spokojnego życia. Zostawia wszystko za sobą i udaje się w ostatnie znane miejsce jego pobytu. Poszukując śladów, musi odnaleźć osławiony grobowiec na mitycznej wyspie u wybrzeży Japonii. Jeśli nie przezwycięży własnych lęków, może nie przeżyć niezwykle niebezpiecznej wyprawy. Jak wiele poświęci, by poznać tajemnicę zniknięcia ojca i zyskać miano tomb raidera?','https://www.youtube.com/embed/8ndhidEmUbI');");
            st.executeUpdate("INSERT INTO Filmy VALUES ( 1, 'Han Solo: Gwiezdne wojny - historie', '118 min', 'c1.jpg', 'Młody Han Solo przemierzając galaktykę staje się przemytnikiem.','https://www.youtube.com/embed/jPEYpryMp2s');");
            st.executeUpdate("INSERT INTO Filmy VALUES ( 2, 'Deadpool2', '218 min', 'd1.jpg', 'Po przeżyciu wypadku oszpecony superbohater stara się odzyskać swoją pasję do życia podróżując po świecie i walcząc z przestępcami. ','https://www.youtube.com/embed/D86RtevtfrA');");
            st.executeUpdate("INSERT INTO Sale VALUES ( 0, 'sala1.jpg', '0,0,100,100;100,0,100,100;0,100,100,100;100,100,100,100');");
            st.executeUpdate("INSERT INTO Wersje VALUES ( 0, '2D');");
            st.executeUpdate("INSERT INTO Seanse VALUES ( 0, 0, 0, datetime('now'), 0);");
            st.executeUpdate("INSERT INTO Seanse VALUES ( 1, 0, 0, datetime('now'), 0);");
            st.executeUpdate("INSERT INTO Seanse VALUES ( 2, 0, 0, datetime('now'), 0);");
            st.executeUpdate("INSERT INTO Miejsca VALUES ( 0, 0, 0, 0),( 1, 0, 1, 0),( 2, 0, 2, 0),( 3, 0, 3, 0);");
            st.executeUpdate("INSERT INTO Aktualnosci VALUES ( 0, date('now'), 'a1.jpg', 'Tomb Raider już dostępny', 'Lara Croft (Alicia Vikander) wyrusza na poszukiwania swojego zaginionego ojca, lorda Richarda Crofta (Dominic West), który zniknął, gdy dziewczyna miała kilkanaście lat. Podczas swoich poszukiwań rozbija się u wybrzeży tajemniczej wyspy niedaleko Japonii. W trakcie pobytu na nieznanym lądzie dziewczyna przechodzi zmianę psychiczną oraz fizyczną i staje się słynną poszukiwaczką przygód znaną jako \"Tomb Raider\"');");
            st.executeUpdate("INSERT INTO Strony VALUES ( 0, 'kontakt', 'dane kontaktowe');");
            st.executeUpdate("INSERT INTO Bilety VALUES ( 0, 'normalny', 12.50);");
            st.executeUpdate("INSERT INTO Userzy VALUES ( 0, 'admin', 'admin@example.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 3),( 2, 'prac', 'admin@example.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 2);");
            st.executeUpdate("INSERT INTO Zamowienia VALUES ( 0, 0);");
            st.executeUpdate("INSERT INTO Zamowienia_Bilety VALUES ( 0, 0, 0, 2, '2,3');");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static User login(String login, String pass)
    {
        User c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from Userzy where nick='"+login+"' and pass='"+pass+"';");
            r.next();
            c = new User(r.getInt("Id"), r.getString("nick"), r.getString("email"), r.getInt("level"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd login() id: "+login+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Film> readFilmy()
    {
        ArrayList<Film> c = new ArrayList<Film>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from filmy;");
            while (r.next())
                c.add(new Film(r.getInt("Id"), r.getString("tytul"), r.getString("czas"), r.getString("img"), r.getString("opis"), r.getString("link")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readFilmy()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Film readFilm(int id)
    {
        Film c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from filmy where id="+id+";");
            r.next();
            c = new Film(r.getInt("Id"), r.getString("tytul"), r.getString("czas"), r.getString("img"), r.getString("opis"), r.getString("link"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readFilm() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Sala> readSale()
    {
        ArrayList<Sala> c = new ArrayList<Sala>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from sale;");
            while (r.next())
                c.add(new Sala(r.getInt("Id"), r.getString("obraz"), r.getString("miejsca")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readSale()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Sala readSala(int id)
    {
        Sala c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from sale where id="+id+";");
            r.next();
            c = new Sala(r.getInt("Id"), r.getString("obraz"), r.getString("miejsca"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readSala() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Wersja> readWersje()
    {
        ArrayList<Wersja> c = new ArrayList<Wersja>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from wersje;");
            while (r.next())
                c.add(new Wersja(r.getInt("Id"), r.getString("tekst")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readWersje()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Wersja readWersja(int id)
    {
        Wersja c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from wersje where id="+id+";");
            r.next();
            c = new Wersja(r.getInt("Id"), r.getString("tekst"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readWersja() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Seans> readSeanse()
    {
        ArrayList<Seans> c = new ArrayList<Seans>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from seanse;");
            while (r.next())
                c.add(new Seans(r.getInt("id"), r.getInt("id_filmu"), r.getInt("id_wersji"), r.getString("data"), r.getInt("sala")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readSeanse()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Seans> readSeanse(Date data)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date(data.getTime() + 1 * 24 * 60 * 60 * 1000);
        ArrayList<Seans> c = new ArrayList<Seans>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("SELECT * FROM Seanse WHERE strftime('%s', data) BETWEEN strftime('%s', '"+dateFormat.format(data)+"') AND strftime('%s', '"+dateFormat.format(d)+"')");
            while (r.next())
                c.add(new Seans(r.getInt("id"), r.getInt("id_filmu"), r.getInt("id_wersji"), r.getString("data"), r.getInt("sala")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readSeanse(Date data)\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Seans readSeans(int id)
    {
        Seans c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from seanse where id="+id+";");
            r.next();
            c = new Seans(r.getInt("id"), r.getInt("id_filmu"), r.getInt("id_wersji"), r.getString("data"), r.getInt("sala"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readSeans() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Miejsce> readMiejsca()
    {
        ArrayList<Miejsce> c = new ArrayList<Miejsce>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from miejsca;");
            while (r.next())
                c.add(new Miejsce(r.getInt("id"), r.getInt("id_seansu"), r.getInt("miejsce"), r.getInt("dostepnosc")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readMiejsca()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Miejsce readMiejsce(int id)
    {
        Miejsce c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from miejsca where id="+id+";");
            r.next();
            c = new Miejsce(r.getInt("id"), r.getInt("id_seansu"), r.getInt("miejsce"), r.getInt("dostepnosc"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readMiejsce() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Aktualnosc> readAktualnosci()
    {
        ArrayList<Aktualnosc> c = new ArrayList<Aktualnosc>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from aktualnosci;");
            while (r.next())
                c.add(new Aktualnosc(r.getInt("id"), r.getString("data"), r.getString("img"), r.getString("tytul"), r.getString("tekst")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readAktualnosci()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Aktualnosc readAktualnosc(int id)
    {
        Aktualnosc c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from aktualnosci where id="+id+";");
            r.next();
            c = new Aktualnosc(r.getInt("id"), r.getString("data"), r.getString("img"), r.getString("tytul"), r.getString("tekst"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readAktualnosc() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Strona> readStrony()
    {
        ArrayList<Strona> c = new ArrayList<Strona>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from strony;");
            while (r.next())
                c.add(new Strona(r.getInt("id"), r.getString("nazwa"), r.getString("tekst")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readStrony()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Strona readStrona(int id)
    {
        Strona c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from strony where id="+id+";");
            r.next();
            c = new Strona(r.getInt("id"), r.getString("nazwa"), r.getString("tekst"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readStrona() id: "+id+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Strona readStrona(String nazwa)
    {
        Strona c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from strony where nazwa='"+nazwa+"';");
            r.next();
            c = new Strona(r.getInt("id"), r.getString("nazwa"), r.getString("tekst"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readStrona() nazwa: "+nazwa+"\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Bilet> readBilety()
    {
        ArrayList<Bilet> c = new ArrayList<Bilet>();
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from bilety;");
            while (r.next())
                c.add(new Bilet(r.getInt("id"), r.getString("nazwa"), r.getDouble("cena")));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readBilety()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Bilet readBilet(int id)
    {
        Bilet c = null;
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("Select * from bilety where id="+id+";");
            r.next();
            c = new Bilet(r.getInt("id"), r.getString("nazwa"), r.getDouble("cena"));
            st.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readBilety()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static ArrayList<Zamowienie> readZamowienia()
    {
        ArrayList<Zamowienie> c = new ArrayList<Zamowienie>();
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet r = st.executeQuery("Select * from zamowienia;");
            while (r.next())
            {
                ResultSet r2 = st2.executeQuery("Select * from Zamowienia_Bilety where id_zamowienia="+r.getInt("id")+";");
                ArrayList<Bilet> c2 = new ArrayList<Bilet>();
                ArrayList<Integer> c3 = new ArrayList<Integer>();
                ArrayList<String> c4 = new ArrayList<String>();
                ArrayList<Integer> c5 = new ArrayList<Integer>();
                String s = "";
                while (r2.next())
                {
                    c2.add(readBilet(r2.getInt("id_biletu")));
                    c3.add(new Integer(r2.getInt("ilosc")));
                    c4.add(r2.getString("miejsca"));
                    c5.add(r2.getInt("id"));
                }
                c.add(new Zamowienie(r.getInt("id"), r.getInt("user"), c5, c2, c3, c4));
            }
            st.close();
            st2.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readZamowienia()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static Zamowienie readZamowienie(int id)
    {
        Zamowienie c = null;
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet r = st.executeQuery("Select * from zamowienia where id="+id+";");
            r.next();
            ResultSet r2 = st2.executeQuery("Select * from Zamowienia_Bilety where id_zamowienia="+r.getInt("id")+";");
            ArrayList<Bilet> c2 = new ArrayList<Bilet>();
            ArrayList<Integer> c3 = new ArrayList<Integer>();
            ArrayList<String> c4 = new ArrayList<String>();
            ArrayList<Integer> c5 = new ArrayList<Integer>();
            String s = "";
            while (r2.next())
            {
                c2.add(readBilet(r2.getInt("id_biletu")));
                c3.add(new Integer(r2.getInt("ilosc")));
                c4.add(r2.getString("miejsca"));
                c5.add(r2.getInt("id"));
            }
            c = new Zamowienie(r.getInt("id"), r.getInt("user"), c5, c2, c3, c4);
            st.close();
            st2.close();
        } catch (SQLException e) {
            System.out.println("====\nBląd readZamowienie()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
        }
        finally {
            return c;
        }
    }
    public static int readNextIdAktualnosc()
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from aktualnosci;");
            r.next();
            return r.getInt("max")+1;
        } catch (SQLException e) {
            System.out.println("====\nBląd createAktualnosc()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return -1;
        }
    }
    public static boolean createAktualnosc(String img, String tytul, String tekst)
    {
        try {
            Statement st = con.createStatement();
            int id = readNextIdAktualnosc();
            st.executeUpdate("INSERT INTO aktualnosci VALUES("+id+", datetime('now','localtime'), '"+img+"', '"+tytul+"', '"+tekst+"');");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createAktualnosc()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createAktualnosc(Aktualnosc a)
    {
        return createAktualnosc(a.getImg(), a.getTytul(), a.getTekst());
    }
    public static boolean createBilet(String nazwa, double cena)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from bilety;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO bilety VALUES("+id+", '"+nazwa+"', '"+cena+"');");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createBilet()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createBilet(Bilet a)
    {
        return createBilet(a.getNazwa(), a.getCena());
    }
    public static boolean createFilm(String tytul, String czas, String img, String opis, String link)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from filmy;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO filmy VALUES("+id+", '"+tytul+"', '"+czas+"', '"+img+"', '"+opis+"', '"+link+"');");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createFilm()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createFilm(Film a)
    {
        return createFilm(a.getTytul(), a.getCzas(),a.getImg(),a.getOpis(),a.getLink());
    }
    public static boolean createMiejsce(int idSeansu, int miejsce, int dostepnosc)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from miejsca;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO miejsca VALUES("+id+", "+idSeansu+", "+miejsce+", "+dostepnosc+");");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createMiejsce()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createMiejsce(Miejsce a)
    {
        return createMiejsce(a.getIdSeansu(), a.getMiejsce(), a.getDostepnosc());
    }
    public static boolean createSala(String obraz, String miejsca)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from sale;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO sale VALUES("+id+", '"+obraz+"', '"+miejsca+"');");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createSala()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createSala(Sala a)
    {
        return createSala(a.getObraz(), a.getMiejsca());
    }
    public static boolean createSeans(int idFilmu, int idWersji, String data, int sala)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from seanse;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO seanse VALUES("+id+", "+idFilmu+", "+idWersji+", '"+data+"', "+sala+");");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createSeans()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createSeans(Seans a)
    {
        return createSeans(a.getIdFilmu(), a.getIdWersji(), a.getData(), a.getSala());
    }
    public static boolean createStrona(String nazwa, String tekst)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from strony;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO strony VALUES("+id+", '"+nazwa+"', '"+tekst+"');");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createStrona()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createStrona(Strona a)
    {
        return createStrona(a.getNazwa(), a.getTekst());
    }
    public static boolean createUser(String nick, String email, String pass, int lvl)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from userzy;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO userzy VALUES("+id+", '"+nick+"', '"+email+"', '"+pass+"', "+lvl+");");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createUser()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createWersja(String tekst)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from wersje;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO wersje VALUES("+id+", '"+tekst+"');");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createWersja()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean createWersja(Wersja a)
    {
        return createWersja( a.getTekst());
    }
    public static boolean createZamowienie(Zamowienie z)
    {
        try {
            Statement st = con.createStatement();
            ResultSet r = st.executeQuery( "Select MAX(id) as max from zamowienia;");
            r.next();
            int id = r.getInt("max")+1;
            st.executeUpdate("INSERT INTO zamowienia VALUES("+id+", "+z.getUser()+");");
            for(int i = 0; i < z.getBilety().size(); i++)
            {
                Statement st2 = con.createStatement();
                ResultSet r2 = st2.executeQuery( "Select MAX(id) as max from zamowienia_bilety;");
                r2.next();
                int id2 = r2.getInt("max")+1;
                st2.executeUpdate("INSERT INTO zamowienia_bilety VALUES("+id2+", "+id+", "+z.getBilety().get(i).getId()+", "+z.getIlosc().get(i)+", "+z.getMiejsca().get(i)+");");
                st2.close();
            }
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd createZamowienie()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteAktualnosc(int id)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM aktualnosci WHERE id="+id+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteAktualnosc()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteBilet(int id)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM bilety WHERE id="+id+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteBilet()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteFilm(int id)
    {
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            ResultSet r = st3.executeQuery("Select * from seanse where id_filmu="+id+";");
            while (r.next())
                st3.executeUpdate("DELETE FROM miejsca WHERE id_seansu="+r.getInt("id")+";");
            st.executeUpdate("DELETE FROM seanse WHERE id_filmu="+id+";");
            st2.executeUpdate("DELETE FROM filmy WHERE id="+id+";");
            st.close();
            st2.close();
            st3.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteFilm()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteMiejsce(int id)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM miejsca WHERE id="+id+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteMiejsce()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteSala(int id)
    {
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            ResultSet r = st3.executeQuery("Select * from seanse where sala="+id+";");
            while (r.next())
                st3.executeUpdate("DELETE FROM miejsca WHERE id_seansu="+r.getInt("id")+";");
            st.executeUpdate("DELETE FROM seanse WHERE sala="+id+";");
            st2.executeUpdate("DELETE FROM sale WHERE id="+id+";");
            st.close();
            st2.close();
            st3.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteSala()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteSeans(int id)
    {
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            st.executeUpdate("DELETE FROM seanse WHERE id="+id+";");
            st2.executeUpdate("DELETE FROM miejsca WHERE id_seansu="+id+";");
            st.close();
            st2.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteSeans()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteStrona(int id)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM strony WHERE id="+id+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteStrona()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteStrona(String nazwa)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM strony WHERE nazwa='"+nazwa+"';");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteStrona()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteUser(int id)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM userzy WHERE id="+id+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteUser()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteWersja(int id)
    {
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            ResultSet r = st3.executeQuery("Select * from seanse where id_wersji="+id+";");
            while (r.next())
                st3.executeUpdate("DELETE FROM miejsca WHERE id_seansu="+r.getInt("id")+";");
            st.executeUpdate("DELETE FROM seanse WHERE id_wersji="+id+";");
            st.executeUpdate("DELETE FROM wersje WHERE id="+id+";");
            st.close();
            st2.close();
            st3.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteWersja()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean deleteZamowienie(int id)
    {
        try {
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            st.executeUpdate("DELETE FROM zamowienia_bilety WHERE id_zamowienia="+id+";");
            st2.executeUpdate("DELETE FROM zamowienia WHERE id="+id+";");
            st.close();
            st2.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd deleteWersja()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateAktualnosc(Aktualnosc a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE aktualnosci SET data = '"+a.getData()+"', img = '"+a.getImg()+"', tytul = '"+a.getTytul()+"', tekst = '"+a.getTekst()+"' WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateAktualnosc()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateBilet(Bilet a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE bilety SET nazwa = '"+a.getNazwa()+"', cena = "+a.getCena()+" WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateBilet()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateFilm(Film a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE filmy SET tytul = '"+a.getTytul()+"', czas = '"+a.getCzas()+"', img = '"+a.getImg()+"', opis = '"+a.getOpis()+"' WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateFilm()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateMiejsce(Miejsce a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE miejsca SET id_seansu = '"+a.getIdSeansu()+"', miejsce = '"+a.getMiejsce()+"', dostepnosc = '"+a.getDostepnosc()+"' WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateMiejsce()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateSala(Sala a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE sale SET obraz = '"+a.getObraz()+"', miejsca = '"+a.getMiejsca()+"' WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateSala()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateSeans(Seans a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE seanse SET id_filmu = "+a.getIdFilmu()+", id_wersji = "+a.getIdWersji()+", data = '"+a.getData()+"', sala = "+a.getSala()+" WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateSeans()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateStrona(Strona a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE strony SET nazwa = '"+a.getNazwa()+"', tekst = '"+a.getTekst()+"' WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateStrona()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateUser(int id, String nick, String email, String pass, int lvl)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE userzy SET nick = '"+nick+"', email = '"+email+"', pass = '"+pass+"', level="+lvl+" WHERE id = "+id+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateUser()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateWersja(Wersja a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE wersje SET tekst = '"+a.getTekst()+"' WHERE id = "+a.getId()+";");
            st.close();
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateWersja()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
    public static boolean updateZamowienie(Zamowienie a)
    {
        try {
            Statement st = con.createStatement();
            st.executeUpdate("UPDATE zamowienia SET user = '"+a.getUser()+"' WHERE id = "+a.getId()+";");
            st.close();
            for(int i = 0; i < a.getBilety().size(); i++)
            {
                Statement st2 = con.createStatement();
                st2.executeUpdate("UPDATE zamowienia_bilety SET id_biletu = "+a.getBilety().get(i).getId()+", ilosc = "+a.getIlosc().get(i)+", miejsca = '"+a.getMiejsca().get(i)+"' WHERE id = "+a.getIdz().get(i)+";");
                st2.close();
            }
            return true;
        } catch (SQLException e) {
            System.out.println("====\nBląd updateZamowienie()\n" + e.getMessage() + ": " + e.getErrorCode() + "\n=====");
            return false;
        }
    }
}
