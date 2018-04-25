/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kino;

import java.util.ArrayList;

/**
 *
 * @author Arekl
 */
public class Zamowienie {
    private int id;
    private int user;
    private ArrayList<Bilet> bilety;
    private ArrayList<Integer> ilosc;
    private ArrayList<String> miejsca;

    public Zamowienie(int id, int user, ArrayList<Bilet> bilety, ArrayList<Integer> ilosc, ArrayList<String> miejsca) {
        this.id = id;
        this.user = user;
        this.bilety = bilety;
        this.ilosc = ilosc;
        this.miejsca = miejsca;
    }

    public int getId() {
        return id;
    }

    public int getUser() {
        return user;
    }

    public ArrayList<Bilet> getBilety() {
        return bilety;
    }

    public ArrayList<Integer> getIlosc() {
        return ilosc;
    }

    public ArrayList<String> getMiejsca() {
        return miejsca;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public void setBilety(ArrayList<Bilet> bilety) {
        this.bilety = bilety;
    }

    public void setIlosc(ArrayList<Integer> ilosc) {
        this.ilosc = ilosc;
    }

    public void setMiejsca(ArrayList<String> miejsca) {
        this.miejsca = miejsca;
    }
    
}
