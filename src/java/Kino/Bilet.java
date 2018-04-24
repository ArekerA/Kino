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
public class Bilet {
    private int id;
    private String nazwa;
    private double cena;

    public Bilet(int id, String nazwa, double cena) {
        this.id = id;
        this.nazwa = nazwa;
        this.cena = cena;
    }

    public int getId() {
        return id;
    }

    public String getNazwa() {
        return nazwa;
    }

    public double getCena() {
        return cena;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public void setCena(double cena) {
        this.cena = cena;
    }
    
}
