/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao;

import java.io.Serializable;

/**
 *
 * @author chump
 */
public class InterComent implements Serializable{
    private int ComentId;
    private String ComentCont;
    private int ComentLikes;
    private int ComentDislikes;
    private String ComentDate;
    private String ComentHour;
    private int ComentPubNumId;
    private int ComentIUserNum;

    public InterComent() {
    }

    public InterComent(int ComentId, String ComentCont, int ComentLikes, int ComentDislikes, String ComentDate, String ComentHour, int ComentPubNumId, int ComentIUserNum) {
        this.ComentId = ComentId;
        this.ComentCont = ComentCont;
        this.ComentLikes = ComentLikes;
        this.ComentDislikes = ComentDislikes;
        this.ComentDate = ComentDate;
        this.ComentHour = ComentHour;
        this.ComentPubNumId = ComentPubNumId;
        this.ComentIUserNum = ComentIUserNum;
    }

    public int getComentId() {
        return ComentId;
    }

    public void setComentId(int ComentId) {
        this.ComentId = ComentId;
    }

    public String getComentCont() {
        return ComentCont;
    }

    public void setComentCont(String ComentCont) {
        this.ComentCont = ComentCont;
    }

    public int getComentLikes() {
        return ComentLikes;
    }

    public void setComentLikes(int ComentLikes) {
        this.ComentLikes = ComentLikes;
    }

    public int getComentDislikes() {
        return ComentDislikes;
    }

    public void setComentDislikes(int ComentDislikes) {
        this.ComentDislikes = ComentDislikes;
    }

    public String getComentDate() {
        return ComentDate;
    }

    public void setComentDate(String ComentDate) {
        this.ComentDate = ComentDate;
    }

    public String getComentHour() {
        return ComentHour;
    }

    public void setComentHour(String ComentHour) {
        this.ComentHour = ComentHour;
    }

    public int getComentPubNumId() {
        return ComentPubNumId;
    }

    public void setComentPubNumId(int ComenttPubNumId) {
        this.ComentPubNumId = ComenttPubNumId;
    }

    public int getComentIUserNum() {
        return ComentIUserNum;
    }

    public void setComentIUserNum(int ComentIUserNum) {
        this.ComentIUserNum = ComentIUserNum;
    }
}
