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
public class Film {
    private int id;
    private String tytul;
    private String czas;
    private String img;
    private String opis;
    private String link;

    public Film(int id, String tytul, String czas, String img, String opis, String link) {
        this.id = id;
        this.tytul = tytul;
        this.czas = czas;
        this.img = img;
        this.opis = opis;
        this.link = link;
    }

    public int getId() {
        return id;
    }

    public String getTytul() {
        return tytul;
    }

    public String getCzas() {
        return czas;
    }

    public String getImg() {
        return img;
    }
    
    public String getLink() {
        return link;
    }

    public String getOpis() {
        return opis;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public void setCzas(String czas) {
        this.czas = czas;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }
    
     public void setLink(String link) {
        this.link = link;
    }
}
