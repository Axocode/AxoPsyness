/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.helper;

import java.io.Serializable;
import java.util.List;
import org.axocode.dao.InterPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterPubService;
import org.axocode.dao.service.InterUsersService;


/**
 *
 * @author alumno
 */
public class InterPubHelper extends Helpers<InterPub> implements Serializable
{
    private InterPubService pubService;
    
    public InterPubHelper() 
    {
    }
    
    public boolean isValidaCamposOk( )
    {
        return isNotNullAndNotEmpity( t.getPubCont()) 
                && isNotNullAndNotEmpity( t.getPubDate())
                && isNotNullAndNotEmpity( t.getPubHour());
    }

    @Override
    public boolean addT() 
    {
        pubService = new InterPubService();
        t = new InterPub();
        
        
        t.setPubCont(getParameter("PubCont"));
        t.setPubDate(getParameter("PubDate"));
        t.setPubHour(getParameter("PubHour"));
        if( isValidaCamposOk( ) )
        {
            return pubService.addInterPub(t );
        }
        return false;
    }

    /**
     *
     * @return
     */
   

    /**
     *
     * @return
     */
    
    /**
     *
     * @return
     */


    @Override
    public InterPub getTByKey() {
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
    public List<InterPub> getListT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}