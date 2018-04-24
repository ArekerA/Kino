/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kino;

/**
 *
 * @author Arekl
 */
public class Strona {
    private int id;
    private String nazwa;
    private String tekst;

    public Strona(int id, String nazwa, String tekst) {
        this.id = id;
        this.nazwa = nazwa;
        this.tekst = tekst;
    }

    public int getId() {
        return id;
    }

    public String getNazwa() {
        return nazwa;
    }

    public String getTekst() {
        return tekst;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public void setTekst(String tekst) {
        this.tekst = tekst;
    }
    
}
