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
public class Aktualnosc {
    private int id;
    private String data;
    private String img;
    private String tytul;
    private String tekst;

    public Aktualnosc(int id, String data, String img, String tytul, String tekst) {
        this.id = id;
        this.data = data;
        this.img = img;
        this.tytul = tytul;
        this.tekst = tekst;
    }

    public int getId() {
        return id;
    }

    public String getData() {
        return data;
    }

    public String getImg() {
        return img;
    }

    public String getTytul() {
        return tytul;
    }

    public String getTekst() {
        return tekst;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public void setTekst(String tekst) {
        this.tekst = tekst;
    }
    
}
