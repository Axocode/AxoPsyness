/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.helper;

import java.io.Serializable;
import java.util.List;
import org.axocode.dao.InterUsers;
import org.axocode.dao.service.InterUsersService;


/**
 *
 * @author alumno
 */
public class InterUsersHelper extends Helpers<InterUsers> implements Serializable
{
    private InterUsersService usersService;
    
    public InterUsersHelper() 
    {
    }
    
    public boolean isValidaCamposOk( )
    {
        return isNotNullAndNotEmpity( t.getIUser()) 
               && isNotNullAndNotEmpity( t.getIPassword() ) 
               && isNotNullAndNotEmpity( t.getIEmail()) 
               && isNotNullAndNotEmpity( t.getIAge());
    }

    @Override
    public boolean addT() 
    {
        usersService = new InterUsersService();
        t = new InterUsers();
        
        
        t.setIUser(getParameter("IUser"));
        t.setIAge(getParameter("IAge"));
        t.setIEmail(getParameter("IEmail"));
        t.setIPassword(getParameter("IPassword"));
        if( isValidaCamposOk( ) )
        {
            return usersService.addInterUsers(t );
        }
        return false;
    }

    /**
     *
     * @return
     */
    @Override
    public List<InterUsers> getListT() 
    {
        usersService = new InterUsersService();
        return usersService.getInterUsersList();
    }

    /**
     *
     * @return
     */
    @Override
    public boolean updateT()
    {
        usersService = new InterUsersService();
        t = new InterUsers();
        t.setIUser(getParameter("IUser"));
        t.setIAge(getParameter("IAge"));
        t.setIEmail(getParameter("IEmail"));
        t.setIPassword(getParameter("IPassword"));
        if( isValidaCamposOk( ) )
        {
            return usersService.updateUsers(t );
        }
        return false;
        
    }
    
    /**
     *
     * @return
     */
    @Override
    public boolean deleteT()
    {
        usersService = new InterUsersService();
        t = new InterUsers();
        t.setIUser(getParameter("IUser"));
        if( t.getIUser() != null && t.getIUser().length( ) > 0 )
        {
            return usersService.deleteUsers(t );
        }
        return false;
        
    }
/*
    @Override
    public InterUsers getTByKey() 
    {
        int INumUser = 0;
        
        INumUser = Integer.parseInt(getParameter("INumUser" ));
        if( INumUser == 0 || INumUser <= 0 )
        {
            return null;
        }
        usersService = new InterUsersService();
        return usersService.getUserByInterUsers( INumUser );
    }
 */   

    @Override
    public InterUsers getTByKey() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}