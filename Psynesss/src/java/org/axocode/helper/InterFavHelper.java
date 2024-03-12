package org.axocode.helper;
import java.io.Serializable;
import java.util.List;
import org.axocode.dao.InterFav;
import org.axocode.dao.service.InterFavService;



/**
 *
 * @author alumno
 */
public class InterFavHelper extends Helpers<InterFav> implements Serializable
{
    private InterFavService usersService;
    
    public InterFavHelper() 
    {}
 

//    @Override
  //  public List<InterFav> getListT() 
  //  {
 //       usersService = new InterFavService();
  //      return usersService.getInterFavList();
 //   }


    @Override
    public boolean addT() {
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
    public InterFav getTByKey() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<InterFav> getListT() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}