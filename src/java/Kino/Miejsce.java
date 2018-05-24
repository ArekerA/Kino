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
public class Miejsce {
    private int id;
    private int idSeansu;
    private int miejsce;
    private int dostepnosc;

    public Miejsce() {
    }

    public Miejsce(int id, int idSeansu, int miejsce, int dostepnosc) {
        this.id = id;
        this.idSeansu = idSeansu;
        this.miejsce = miejsce;
        this.dostepnosc = dostepnosc;
    }

    public int getId() {
        return id;
    }

    public int getIdSeansu() {
        return idSeansu;
    }

    public int getMiejsce() {
        return miejsce;
    }

    public int getDostepnosc() {
        return dostepnosc;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdSeansu(int idSeansu) {
        this.idSeansu = idSeansu;
    }

    public void setMiejsce(int miejsce) {
        this.miejsce = miejsce;
    }

    public void setDostepnosc(int dostepnosc) {
        this.dostepnosc = dostepnosc;
    }
    
}
