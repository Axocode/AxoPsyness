package org.axocode.dao;

import java.io.Serializable;

public class InterScorePub implements Serializable{
    private int ScorePubNum;
    private int ScorePub;
    private String ScorePubSadness;
    private String ScorePubJoy;
    private String ScorePubLove;
    private String ScorePubAnger;
    private String ScorePubFear;
    private String ScorePubSurprise;

    public InterScorePub(int ScorePubNum, int ScorePub, String ScorePubSadness, String ScorePubJoy, String ScorePubLove, String ScorePubAnger, String ScorePubFear, String ScorePubSurprise) {
        this.ScorePubNum = ScorePubNum;
        this.ScorePub = ScorePub;
        this.ScorePubSadness = ScorePubSadness;
        this.ScorePubJoy = ScorePubJoy;
        this.ScorePubLove = ScorePubLove;
        this.ScorePubAnger = ScorePubAnger;
        this.ScorePubFear = ScorePubFear;
        this.ScorePubSurprise = ScorePubSurprise;
    }

    public InterScorePub() {
    }
    
    public int getScorePubNum() {
        return ScorePubNum;
    }

    public void setScorePubNum(int ScorePubNum) {
        this.ScorePubNum = ScorePubNum;
    }

    public int getScorePub() {
        return ScorePub;
    }

    public void setScorePub(int ScorePub) {
        this.ScorePub = ScorePub;
    }

    public String getScorePubSadness() {
        return ScorePubSadness;
    }

    public void setScorePubSadness(String ScorePubSadness) {
        this.ScorePubSadness = ScorePubSadness;
    }

    public String getScorePubJoy() {
        return ScorePubJoy;
    }

    public void setScorePubJoy(String ScorePubJoy) {
        this.ScorePubJoy = ScorePubJoy;
    }

    public String getScorePubLove() {
        return ScorePubLove;
    }

    public void setScorePubLove(String ScorePubLove) {
        this.ScorePubLove = ScorePubLove;
    }

    public String getScorePubAnger() {
        return ScorePubAnger;
    }

    public void setScorePubAnger(String ScorePubAnger) {
        this.ScorePubAnger = ScorePubAnger;
    }

    public String getScorePubFear() {
        return ScorePubFear;
    }

    public void setScorePubFear(String ScorePubFear) {
        this.ScorePubFear = ScorePubFear;
    }

    public String getScorePubSurprise() {
        return ScorePubSurprise;
    }

    public void setScorePubSurprise(String ScorePubSurprise) {
        this.ScorePubSurprise = ScorePubSurprise;
    }
    
    
}
