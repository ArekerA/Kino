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
public class Wersja {
    private int id;
    private String tekst;

    public Wersja(int id, String tekst) {
        this.id = id;
        this.tekst = tekst;
    }

    public int getId() {
        return id;
    }

    public String getTekst() {
        return tekst;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTekst(String tekst) {
        this.tekst = tekst;
    }
    
}
