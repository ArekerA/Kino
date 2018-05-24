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
    private ArrayList<Integer> idz;
    private ArrayList<Bilet> bilety;
    private ArrayList<Integer> ilosc;
    private ArrayList<ArrayList<Miejsce>> miejsca;
    private ArrayList<ArrayList<Integer>> idm;

    public Zamowienie(int id, int user, ArrayList<Integer> idz, ArrayList<Bilet> bilety, ArrayList<Integer> ilosc, ArrayList<ArrayList<Miejsce>> miejsca, ArrayList<ArrayList<Integer>> idm) {
        this.id = id;
        this.user = user;
        this.idz = idz;
        this.bilety = bilety;
        this.ilosc = ilosc;
        this.miejsca = miejsca;
        this.idm = idm;
    }
     public Zamowienie() {
        
    }

    public int getId() {
        return id;
    }

    public int getUser() {
        return user;
    }

    public ArrayList<Integer> getIdz() {
        return idz;
    }

    public ArrayList<Bilet> getBilety() {
        return bilety;
    }

    public ArrayList<Integer> getIlosc() {
        return ilosc;
    }

    public ArrayList<ArrayList<Miejsce>> getMiejsca() {
        return miejsca;
    }
    public ArrayList<ArrayList<Integer>> getIdm() {
        return idm;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public void setIdz(ArrayList<Integer> idz) {
        this.idz = idz;
    }

    public void setBilety(ArrayList<Bilet> bilety) {
        this.bilety = bilety;
    }

    public void setIlosc(ArrayList<Integer> ilosc) {
        this.ilosc = ilosc;
    }

    public void setMiejsca(ArrayList<ArrayList<Miejsce>> miejsca) {
        this.miejsca = miejsca;
    }
    public void setIdm(ArrayList<ArrayList<Integer>> idm) {
        this.idm = idm;
    }
    
}
