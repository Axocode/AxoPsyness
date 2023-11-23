package org.axocode.dao;

import java.io.Serializable;
import java.util.Date;

public class InterPub implements Serializable{
    
    private Integer PubNumId;
    private String PubCont;
    private int PubMg;
    private String PubDate;
    private String PubHour;

    public InterPub(){}
    
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
    
}
