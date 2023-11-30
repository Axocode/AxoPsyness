package org.axocode.dao;

import java.io.Serializable;

public class InterUsers implements Serializable{
    
    private Integer IUserNum;
    private String IUser;
    private String IAge;
    private String IEmail;
    private String IPassword;
    private String IImgNum;
    private String IRol;
    private Integer IUserSeguidores;
    private Integer IUserSeguidos;
    private String IUserDescription;

    public InterUsers(Integer IUserNum, String IUser, String IAge, String IEmail, String IPassword, String IImgNum, String IRol, Integer IUserSeguidores, Integer IUserSeguidos, String IUserDescription) {
        this.IUserNum = IUserNum;
        this.IUser = IUser;
        this.IAge = IAge;
        this.IEmail = IEmail;
        this.IPassword = IPassword;
        this.IImgNum = IImgNum;
        this.IRol = IRol;
        this.IUserSeguidores = IUserSeguidores;
        this.IUserSeguidos = IUserSeguidos;
        this.IUserDescription = IUserDescription;
    }


   
    
    public Integer getIUserSeguidores() {
        return IUserSeguidores;
    }

    public void setIUserSeguidores(Integer IUserSeguidores) {
        this.IUserSeguidores = IUserSeguidores;
    }

    public Integer getIUserSeguidos() {
        return IUserSeguidos;
    }

    public void setIUserSeguidos(Integer IUserSeguidos) {
        this.IUserSeguidos = IUserSeguidos;
    }

    
    
    public InterUsers() {
    }

    public InterUsers ( Integer IUserNum) 
    {
        this.IUserNum = IUserNum;
    }
    
    public Integer getIUserNum() {
        return IUserNum;
    }

    public void setIUserNum(Integer IUserNum) {
        this.IUserNum = IUserNum;
    }

    public String getIUser() {
        return IUser;
    }

    public void setIUser(String IUser) {
        this.IUser = IUser;
    }

    public String getIAge() {
        return IAge;
    }

    public void setIAge(String IAge) {
        this.IAge = IAge;
    }

    public String getIEmail() {
        return IEmail;
    }

    public void setIEmail(String IEmail) {
        this.IEmail = IEmail;
    }

    public String getIPassword() {
        return IPassword;
    }

    public void setIPassword(String IPassword) {
        this.IPassword = IPassword;
    }

    public String getIImgNum() {
        return IImgNum;
    }

    public void setIImgNum(String IImgNum) {
        this.IImgNum = IImgNum;
    }

    public String getIRol() {
        return IRol;
    }

    public void setIRol(String IRol) {
        this.IRol = IRol;
    }

    public String getIUserDescription() {
        return IUserDescription;
    }

    public void setIUserDescription(String IUserDescription) {
        this.IUserDescription = IUserDescription;
    }



}