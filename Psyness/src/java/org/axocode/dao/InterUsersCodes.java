/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao;

/**
 *
 * @author chump
 */
public class InterUsersCodes {
    private InterUsers IUserNum;
    private InterCodes CodesCode;

    public InterUsersCodes(InterUsers IUserNum, InterCodes CodesCode) {
        this.IUserNum = IUserNum;
        this.CodesCode = CodesCode;
    }

    public InterUsersCodes(){
    }

    public InterUsers getIUserNum() {
        return IUserNum;
    }

    public void setIUserNum(InterUsers IUserNum) {
        this.IUserNum = IUserNum;
    }

    public InterCodes getCodesCode() {
        return CodesCode;
    }

    public void setCodesCode(InterCodes CodesCode) {
        this.CodesCode = CodesCode;
    }

  
}   
