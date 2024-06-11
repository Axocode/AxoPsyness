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
public class InterLocation implements Serializable {
    private int LocationUser;
    private double LocationLatitud;
    private double LocationLongitud;
    private String LocationMessage;
    private String LocationToken;
    
    
    public InterLocation(int LocationUser, double LocationLatitud, double LocationLongitud, String LocationMessage, String LocationToken) {
        this.LocationUser = LocationUser;
        this.LocationLatitud = LocationLatitud;
        this.LocationLongitud = LocationLongitud;
        this.LocationMessage = LocationMessage;
        this.LocationToken = LocationToken;
    }
    
    public InterLocation() {
    }
    
    public int getLocationUser() {
        return LocationUser;
    }

    public void setLocationUser(int LocationUser) {
        this.LocationUser = LocationUser;
    }

    public double getLocationLatitud() {
        return LocationLatitud;
    }

    public void setLocationLatitud(double LocationLatitud) {
        this.LocationLatitud = LocationLatitud;
    }

    public double getLocationLongitud() {
        return LocationLongitud;
    }

    public void setLocationLongitud(double LocationLongitud) {
        this.LocationLongitud = LocationLongitud;
    }

    public String getLocationMessage() {
        return LocationMessage;
    }

    public void setLocationMessage(String LocationMessage) {
        this.LocationMessage = LocationMessage;
    }

    public String getLocationToken() {
        return LocationToken;
    }

    public void setLocationToken(String LocationToken) {
        this.LocationToken = LocationToken;
    }
    
    
}
