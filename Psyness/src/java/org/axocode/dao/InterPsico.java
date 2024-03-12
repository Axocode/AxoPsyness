package org.axocode.dao;

import java.io.Serializable;

public class InterPsico implements Serializable{
    private int PsicoUserNum;
    private String PsicoNom;
    private String PsicoTel;
    private String PsicoStretNum;
    private String PsicoState;
    private String PsicoCode;
    private String PsicoIdiom;
    private String PsicoLatitud;
    private String PsicoLongitud;

    public InterPsico(int PsicoUserNum, String PsicoNom, String PsicoTel, String PsicoStretNum, String PsicoState, String PsicoCode, String PsicoIdiom, String PsicoLatitud, String PsicoLongitud) {
        this.PsicoUserNum = PsicoUserNum;
        this.PsicoNom = PsicoNom;
        this.PsicoTel = PsicoTel;
        this.PsicoStretNum = PsicoStretNum;
        this.PsicoState = PsicoState;
        this.PsicoCode = PsicoCode;
        this.PsicoIdiom = PsicoIdiom;
        this.PsicoLatitud = PsicoLatitud;
        this.PsicoLongitud = PsicoLongitud;
    }

    public InterPsico() {
    }
    
    public int getPsicoUserNum() {
        return PsicoUserNum;
    }

    public void setPsicoUserNum(int PsicoUserNum) {
        this.PsicoUserNum = PsicoUserNum;
    }

    public String getPsicoNom() {
        return PsicoNom;
    }

    public void setPsicoNom(String PsicoNom) {
        this.PsicoNom = PsicoNom;
    }

    public String getPsicoTel() {
        return PsicoTel;
    }

    public void setPsicoTel(String PsicoTel) {
        this.PsicoTel = PsicoTel;
    }

    public String getPsicoStretNum() {
        return PsicoStretNum;
    }

    public void setPsicoStretNum(String PsicoStretNum) {
        this.PsicoStretNum = PsicoStretNum;
    }

    public String getPsicoState() {
        return PsicoState;
    }

    public void setPsicoState(String PsicoState) {
        this.PsicoState = PsicoState;
    }

    public String getPsicoCode() {
        return PsicoCode;
    }

    public void setPsicoCode(String PsicoCode) {
        this.PsicoCode = PsicoCode;
    }

    public String getPsicoIdiom() {
        return PsicoIdiom;
    }

    public void setPsicoIdiom(String PsicoIdiom) {
        this.PsicoIdiom = PsicoIdiom;
    }

    public String getPsicoLatitud() {
        return PsicoLatitud;
    }

    public void setPsicoLatitud(String PsicoLatitud) {
        this.PsicoLatitud = PsicoLatitud;
    }

    public String getPsicoLongitud() {
        return PsicoLongitud;
    }

    public void setPsicoLongitud(String PsicoLongitud) {
        this.PsicoLongitud = PsicoLongitud;
    }
}
