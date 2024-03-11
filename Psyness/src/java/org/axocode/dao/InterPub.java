package org.axocode.dao;

import java.io.Serializable;

public class InterPub implements Serializable{
    
    private Integer PubNumId;
    private String PubCont;
    private int PubMg;
    private int PubFavs;
    private int PubComent;
    private String PubDate;
    private String PubHour;
    private String PubRol;

    public InterPub(){
    }
    
    public InterPub(Integer PubNumId){
        this.PubNumId = PubNumId;
    }

    public String getPubCont() {
        return PubCont;
    }

    public void setPubCont(String PubCont) {
        this.PubCont = PubCont;
    }

    public int getPubMg() {
        return PubMg;
    }

    public void setPubMg(int PubMg) {
        this.PubMg = PubMg;
    }

    public Integer getPubNumId() {
        return PubNumId;
    }

    public void setPubNumId(Integer PubNumId) {
        this.PubNumId = PubNumId;
    }

    public String getPubDate() {
        return PubDate;
    }

    public void setPubDate(String PubDate) {
        this.PubDate = PubDate;
    }

    public String getPubHour() {
        return PubHour;
    }

    public void setPubHour(String PubHour) {
        this.PubHour = PubHour;
    }

    public int getPubFavs() {
        return PubFavs;
    }

    public void setPubFavs(int PubFavs) {
        this.PubFavs = PubFavs;
    }

    public int getPubComent() {
        return PubComent;
    }

    public void setPubComent(int PubComent) {
        this.PubComent = PubComent;
    }

    public String getPubRol() {
        return PubRol;
    }

    public void setPubRol(String PubRol) {
        this.PubRol = PubRol;
    }
    
}
