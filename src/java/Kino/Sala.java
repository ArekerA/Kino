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
public class Sala {
    private int id;
    private String obraz;
    private String miejsca;

    public Sala(int id, String obraz, String miejsca) {
        this.id = id;
        this.obraz = obraz;
        this.miejsca = miejsca;
    }

    public int getId() {
        return id;
    }

    public String getObraz() {
        return obraz;
    }

    public String getMiejsca() {
        return miejsca;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setObraz(String obraz) {
        this.obraz = obraz;
    }

    public void setMiejsca(String miejsca) {
        this.miejsca = miejsca;
    }
    
}
