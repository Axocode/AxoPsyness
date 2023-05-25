/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.helper;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author alumno
 */
public abstract class Helpers<T> implements Serializable
{
    protected HttpServletRequest request;
    protected T t;
    protected List<T> list;

    public Helpers() 
    {
    }
    
    public Helpers addRequest( HttpServletRequest request )
    {
        this.request = request;
        return this;
    }
    
    public String getParameter( String name )
    {
        if( request == null || name == null )
        {
            return null;
        }
        if( name.length() <0 )
        {
            return null;
        }
        return request.getParameter( name );
    }
    
    public abstract boolean addT( );
    public abstract List<T> getListT( );
    public abstract boolean updateT( );
    public abstract boolean deleteT( );
    public abstract T getTByKey( );
    
    public boolean isNullOrEmpity( String valor )
    {
        return valor == null || valor.length() <= 0;
    }
    
    public boolean isNotNullAndNotEmpity( String valor )
    {
        return valor != null && valor.length() > 0;
    }
    
    public boolean isNotNull( Object valor )
    {
        return valor != null;
    }
    
    public Date string2Date( String fecha ) 
    {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        try 
        {
            return simpleDateFormat.parse(fecha );
        } 
        catch (ParseException ex) 
        {
            Logger.getLogger(Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String date2String( Date fecha ) 
    {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return simpleDateFormat.format(fecha );
    }
    
}
