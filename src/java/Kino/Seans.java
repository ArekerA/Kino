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
public class Seans {
    private int id;
    private int idFilmu;
    private int idWersji;
    private String data;
    private int sala;

    public Seans(int id, int idFilmu, int idWersji, String data, int sala) {
        this.id = id;
        this.idFilmu = idFilmu;
        this.idWersji = idWersji;
        this.data = data;
        this.sala = sala;
    }

    public int getId() {
        return id;
    }

    public int getIdFilmu() {
        return idFilmu;
    }

    public int getIdWersji() {
        return idWersji;
    }

    public String getData() {
        return data;
    }

    public int getSala() {
        return sala;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdFilmu(int idFilmu) {
        this.idFilmu = idFilmu;
    }

    public void setIdWersji(int idWersji) {
        this.idWersji = idWersji;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void setSala(int sala) {
        this.sala = sala;
    }
    
}
