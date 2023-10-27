/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao;

/**
 *
 * @author chump
 */
public class InterCodes{
    private String Codescode;
    private String Codesstatus;

    
    
    public InterCodes(String Codescode, String Codesstatus) {
        this.Codescode = Codescode;
        this.Codesstatus = Codesstatus;
    }
    
    public InterCodes(String Codescode) {
        this.Codescode = Codescode;
    }
    
    public InterCodes() {
    }

    public String getCodescode() {
        return Codescode;
    }

    public void setCodescode(String Codescode) {
        this.Codescode = Codescode;
    }

    public String getCodesstatus() {
        return Codesstatus;
    }

    public void setCodesstatus(String Codesstatus) {
        this.Codesstatus = Codesstatus;
    }
    
    
}
