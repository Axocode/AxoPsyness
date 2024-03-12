package org.axocode.dao;

import java.io.Serializable;

public class InterTagUsers implements Serializable{
    private int TagUserNum;
    private int TagUser;
    private int TagUserSensible;
    private int TagUserAutoestima;
    private int TagUserRelaciones;
    private int TagUserAnsiedad;
    private int TagUserbDepresion;
    private int TagUserConflictos;
    private int TagUserBienestar;
    private int TagUserCrecimiento;
    private int TagUserSalud;
    private int TagUserTranstornos;
    private int TagUserRecaidas;
    private int TagUserSueno;

    public InterTagUsers(int TagUserNum, int TagUser, int TagUserSensible, int TagUserAutoestima, int TagUserRelaciones, int TagUserAnsiedad, int TagUserbDepresion, int TagUserConflictos, int TagUserBienestar, int TagUserCrecimiento, int TagUserSalud, int TagUserTranstornos, int TagUserRecaidas, int TagUserSueno) {
        this.TagUserNum = TagUserNum;
        this.TagUser = TagUser;
        this.TagUserSensible = TagUserSensible;
        this.TagUserAutoestima = TagUserAutoestima;
        this.TagUserRelaciones = TagUserRelaciones;
        this.TagUserAnsiedad = TagUserAnsiedad;
        this.TagUserbDepresion = TagUserbDepresion;
        this.TagUserConflictos = TagUserConflictos;
        this.TagUserBienestar = TagUserBienestar;
        this.TagUserCrecimiento = TagUserCrecimiento;
        this.TagUserSalud = TagUserSalud;
        this.TagUserTranstornos = TagUserTranstornos;
        this.TagUserRecaidas = TagUserRecaidas;
        this.TagUserSueno = TagUserSueno;
    }

    public InterTagUsers() {
    }
    
    public int getTagUserNum() {
        return TagUserNum;
    }

    public void setTagUserNum(int TagUserNum) {
        this.TagUserNum = TagUserNum;
    }

    public int getTagUser() {
        return TagUser;
    }

    public void setTagUser(int TagUser) {
        this.TagUser = TagUser;
    }

    public int getTagUserSensible() {
        return TagUserSensible;
    }

    public void setTagUserSensible(int TagUserSensible) {
        this.TagUserSensible = TagUserSensible;
    }

    public int getTagUserAutoestima() {
        return TagUserAutoestima;
    }

    public void setTagUserAutoestima(int TagUserAutoestima) {
        this.TagUserAutoestima = TagUserAutoestima;
    }

    public int getTagUserRelaciones() {
        return TagUserRelaciones;
    }

    public void setTagUserRelaciones(int TagUserRelaciones) {
        this.TagUserRelaciones = TagUserRelaciones;
    }

    public int getTagUserAnsiedad() {
        return TagUserAnsiedad;
    }

    public void setTagUserAnsiedad(int TagUserAnsiedad) {
        this.TagUserAnsiedad = TagUserAnsiedad;
    }

    public int getTagUserbDepresion() {
        return TagUserbDepresion;
    }

    public void setTagUserbDepresion(int TagUserbDepresion) {
        this.TagUserbDepresion = TagUserbDepresion;
    }

    public int getTagUserConflictos() {
        return TagUserConflictos;
    }

    public void setTagUserConflictos(int TagUserConflictos) {
        this.TagUserConflictos = TagUserConflictos;
    }

    public int getTagUserBienestar() {
        return TagUserBienestar;
    }

    public void setTagUserBienestar(int TagUserBienestar) {
        this.TagUserBienestar = TagUserBienestar;
    }

    public int getTagUserCrecimiento() {
        return TagUserCrecimiento;
    }

    public void setTagUserCrecimiento(int TagUserCrecimiento) {
        this.TagUserCrecimiento = TagUserCrecimiento;
    }

    public int getTagUserSalud() {
        return TagUserSalud;
    }

    public void setTagUserSalud(int TagUserSalud) {
        this.TagUserSalud = TagUserSalud;
    }

    public int getTagUserTranstornos() {
        return TagUserTranstornos;
    }

    public void setTagUserTranstornos(int TagUserTranstornos) {
        this.TagUserTranstornos = TagUserTranstornos;
    }

    public int getTagUserRecaidas() {
        return TagUserRecaidas;
    }

    public void setTagUserRecaidas(int TagUserRecaidas) {
        this.TagUserRecaidas = TagUserRecaidas;
    }

    public int getTagUserSueno() {
        return TagUserSueno;
    }

    public void setTagUserSueno(int TagUserSueno) {
        this.TagUserSueno = TagUserSueno;
    }
    
}
