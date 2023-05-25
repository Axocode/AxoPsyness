package org.axocode.helper;

import java.io.Serializable;
import java.util.List;
import org.axocode.dao.InterPub;
import org.axocode.dao.InterUsers;
import org.axocode.dao.InterUsersPub;
import org.axocode.dao.service.InterUsersPubService;


/**
 *
 * @author ruizl
 */
public class InterUsersPubHelper extends Helpers<InterUsersPub> implements Serializable{
    
    private InterUsersPubService conextionService;

    public InterUsersPubHelper() {
    }
    
    public boolean isValidaCamposOk( )
    {
        return isNotNull( t.getiUserNum());
    }

    @Override
    public boolean addT() 
    {
        conextionService = new InterUsersPubService();
        t = new InterUsersPub();
        t.setiUserNum(new InterUsers(Integer.parseInt(getParameter("iUserNum"))));
        if( isValidaCamposOk( ) )
        {
            return conextionService.addUsersPub(t );
        }
        return false;
    }

    /**
     *
     * @return
     */
    @Override
    public List<InterUsersPub> getListT() 
    {
        conextionService = new InterUsersPubService();
        return conextionService.getUsersPubList();
    }

    /**
     *
     * @return
     */
    @Override
    public boolean updateT()
    {
        return false;   
    }
    
    /**
     *
     * @return
     */
    @Override
    public boolean deleteT()
    {
        conextionService = new InterUsersPubService();
        t = new InterUsersPub();
        t.setPubNumId(new InterPub(Integer.parseInt(getParameter("PubNumId" ) ) ));
        t.setiUserNum(new InterUsers(Integer.parseInt(getParameter("IUserNum") ) ));
        if( t.getPubNumId().getPubNumId()!= null && t.getPubNumId().getPubNumId() > 0 && 
            t.getiUserNum().getIUserNum()!= null && t.getiUserNum().getIUserNum() > 0 )
        {
            return conextionService.deleteInterUsersPub(t );
        }
        return false;
        
    }

    @Override
    public InterUsersPub getTByKey() 
    {
        Integer PubNumId = null;
        
        
        PubNumId = Integer.parseInt(getParameter("PubNumId" ));
        
        if( PubNumId == null || PubNumId <= 0 )
        {
            return null;
        }
        
        conextionService = new InterUsersPubService( );
        return conextionService.getInterUsersByInterUsersPub(PubNumId);
    }
}
