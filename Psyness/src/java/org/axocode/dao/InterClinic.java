package org.axocode.dao;

import java.io.Serializable;

public class InterClinic implements Serializable{
    private int ClinicNum;
    private String Clinic;
    private String ClinicImgNum;
    private String ClinicTel;
    private String ClinicStreetNum;
    private String ClinicState;
    private String ClinicCode;
    private String ClinicHour;
    private String ClinicLatitud;
    private String ClinicLongitud;
    private String ClinicType;

    public InterClinic(int ClinicNum, String Clinic, String ClinicImgNum, String ClinicTel, String ClinicStreetNum, String ClinicState, String ClinicCode, String ClinicHour, String ClinicLatitud, String ClinicLongitud, String ClinicType) {
        this.ClinicNum = ClinicNum;
        this.Clinic = Clinic;
        this.ClinicImgNum = ClinicImgNum;
        this.ClinicTel = ClinicTel;
        this.ClinicStreetNum = ClinicStreetNum;
        this.ClinicState = ClinicState;
        this.ClinicCode = ClinicCode;
        this.ClinicHour = ClinicHour;
        this.ClinicLatitud = ClinicLatitud;
        this.ClinicLongitud = ClinicLongitud;
        this.ClinicType = ClinicType;
    }

    public InterClinic() {
    }
    
    public int getClinicNum() {
        return ClinicNum;
    }

    public void setClinicNum(int ClinicNum) {
        this.ClinicNum = ClinicNum;
    }

    public String getClinic() {
        return Clinic;
    }

    public void setClinic(String Clinic) {
        this.Clinic = Clinic;
    }

    public String getClinicImgNum() {
        return ClinicImgNum;
    }

    public void setClinicImgNum(String ClinicImgNum) {
        this.ClinicImgNum = ClinicImgNum;
    }

    public String getClinicTel() {
        return ClinicTel;
    }

    public void setClinicTel(String ClinicTel) {
        this.ClinicTel = ClinicTel;
    }

    public String getClinicStreetNum() {
        return ClinicStreetNum;
    }

    public void setClinicStreetNum(String ClinicStreetNum) {
        this.ClinicStreetNum = ClinicStreetNum;
    }

    public String getClinicState() {
        return ClinicState;
    }

    public void setClinicState(String ClinicState) {
        this.ClinicState = ClinicState;
    }

    public String getClinicCode() {
        return ClinicCode;
    }

    public void setClinicCode(String ClinicCode) {
        this.ClinicCode = ClinicCode;
    }

    public String getClinicHour() {
        return ClinicHour;
    }

    public void setClinicHour(String ClinicHour) {
        this.ClinicHour = ClinicHour;
    }

    public String getClinicLatitud() {
        return ClinicLatitud;
    }

    public void setClinicLatitud(String ClinicLatitud) {
        this.ClinicLatitud = ClinicLatitud;
    }

    public String getClinicLongitud() {
        return ClinicLongitud;
    }

    public void setClinicLongitud(String ClinicLongitud) {
        this.ClinicLongitud = ClinicLongitud;
    }

    public String getClinicType() {
        return ClinicType;
    }

    public void setClinicType(String ClinicType) {
        this.ClinicType = ClinicType;
    }

    
}