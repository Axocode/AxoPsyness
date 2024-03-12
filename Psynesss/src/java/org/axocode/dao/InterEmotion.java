package org.axocode.dao;

import java.io.Serializable;

public class InterEmotion implements Serializable {
    private int EmotionNum;
    private int EmotionNumUser;
    private double Emotion;
    private double EmotionTagEmotion;
    private double EmotionTagSituation;
    private double EmotionComent;
    private double EmotionDate;
    private double EmotionHour;

    public InterEmotion(int EmotionNum, int EmotionNumUser, double Emotion, double EmotionTagEmotion, double EmotionTagSituation, double EmotionComent, double EmotionDate, double EmotionHour) {
        this.EmotionNum = EmotionNum;
        this.EmotionNumUser = EmotionNumUser;
        this.Emotion = Emotion;
        this.EmotionTagEmotion = EmotionTagEmotion;
        this.EmotionTagSituation = EmotionTagSituation;
        this.EmotionComent = EmotionComent;
        this.EmotionDate = EmotionDate;
        this.EmotionHour = EmotionHour;
    }

    public InterEmotion() {
    }
    
    public int getEmotionNum() {
        return EmotionNum;
    }

    public void setEmotionNum(int EmotionNum) {
        this.EmotionNum = EmotionNum;
    }

    public int getEmotionNumUser() {
        return EmotionNumUser;
    }

    public void setEmotionNumUser(int EmotionNumUser) {
        this.EmotionNumUser = EmotionNumUser;
    }

    public double getEmotion() {
        return Emotion;
    }

    public void setEmotion(double Emotion) {
        this.Emotion = Emotion;
    }

    public double getEmotionTagEmotion() {
        return EmotionTagEmotion;
    }

    public void setEmotionTagEmotion(double EmotionTagEmotion) {
        this.EmotionTagEmotion = EmotionTagEmotion;
    }

    public double getEmotionTagSituation() {
        return EmotionTagSituation;
    }

    public void setEmotionTagSituation(double EmotionTagSituation) {
        this.EmotionTagSituation = EmotionTagSituation;
    }

    public double getEmotionComent() {
        return EmotionComent;
    }

    public void setEmotionComent(double EmotionComent) {
        this.EmotionComent = EmotionComent;
    }

    public double getEmotionDate() {
        return EmotionDate;
    }

    public void setEmotionDate(double EmotionDate) {
        this.EmotionDate = EmotionDate;
    }

    public double getEmotionHour() {
        return EmotionHour;
    }

    public void setEmotionHour(double EmotionHour) {
        this.EmotionHour = EmotionHour;
    }
    
    
    
}
