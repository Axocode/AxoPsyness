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
public class InterClinicUsers implements Serializable{
    private int ClinicUsersId;
    private InterUsers ClinicUsersIUserNum;
    private InterClinic ClinicUsersClinicNum;
    private String ClinicUsersRol;

    public InterClinicUsers() {
    }

    public InterClinicUsers(int ClinicUsersId, InterUsers ClinicUsersIUserNum, InterClinic ClinicUsersClinicNum, String ClinicUsersRol) {
        this.ClinicUsersId = ClinicUsersId;
        this.ClinicUsersIUserNum = ClinicUsersIUserNum;
        this.ClinicUsersClinicNum = ClinicUsersClinicNum;
        this.ClinicUsersRol = ClinicUsersRol;
    }
    
    public int getClinicUsersId() {
        return ClinicUsersId;
    }

    public void setClinicUsersId(int ClinicUsersId) {
        this.ClinicUsersId = ClinicUsersId;
    }

    public InterUsers getClinicUsersIUserNum() {
        return ClinicUsersIUserNum;
    }

    public void setClinicUsersIUserNum(InterUsers ClinicUsersIUserNum) {
        this.ClinicUsersIUserNum = ClinicUsersIUserNum;
    }

    public InterClinic getClinicUsersClinicNum() {
        return ClinicUsersClinicNum;
    }

    public void setClinicUsersClinicNum(InterClinic ClinicUsersClinicNum) {
        this.ClinicUsersClinicNum = ClinicUsersClinicNum;
    }

    public String getClinicUsersRol() {
        return ClinicUsersRol;
    }

    public void setClinicUsersRol(String ClinicUsersRol) {
        this.ClinicUsersRol = ClinicUsersRol;
    }
    
    
}
