/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.helper;

import java.io.Serializable;
import java.util.List;
import org.axocode.dao.InterComent;
import org.axocode.dao.service.InterComentService;

/**
 *
 * @author chump
 */
public class InterComentHelper extends Helpers<InterComent> implements Serializable{

    private InterComentService comentService;
    
    public InterComentHelper() 
    {
    }
    
public boolean isValidaCamposOk() {
    return isNotNullAndNotEmpity(t.getComentCont()) 
            && isNotNullAndNotEmpity(t.getComentDate())
            && isNotNullAndNotEmpity(t.getComentHour());
}

    @Override
    public boolean addT() 
    {
        comentService = new InterComentService();
        t = new InterComent();
        
        
        t.setComentCont(getParameter("ComentCont"));
        t.setComentDate(getParameter("ComentDate"));
        t.setComentHour(getParameter("ComentHour"));
        t.setComentPubNumId(Integer.parseInt(getParameter("ComentPubNumId")));
        t.setComentIUserNum(Integer.parseInt(getParameter("ComentIUserNum")));
        if( isValidaCamposOk( ) )
        {   
            System.out.println("publicado");
            return comentService.addInterComent(t );
        }
        System.out.println("error0");
        return false;
    }

    @Override
    public List<InterComent> getListT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updateT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public InterComent getTByKey() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
