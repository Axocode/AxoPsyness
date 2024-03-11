package org.axocode.helper;

import java.io.Serializable;
import java.util.List;
import org.axocode.dao.InterTagPub;
import org.axocode.dao.service.InterTagPubService;

public class InterTagPubHelper extends Helpers<InterTagPub> implements Serializable{    
    
    private InterTagPubService tagpubService;

    public InterTagPubHelper() {
    }
    
    
    @Override
    public boolean addT() {
        tagpubService = new InterTagPubService();
        t = new InterTagPub();
        
        t.setTagPub(Integer.parseInt(getParameter("TagPub")));
        t.setTagPubSensible(Integer.parseInt(getParameter("TagPubSensible")));
        t.setTagPubAutoestima(Integer.parseInt(getParameter("TagPubAutoestima")));
        t.setTagPubRelaciones(Integer.parseInt(getParameter("TagPubRelaciones")));
        t.setTagPubAnsiedad(Integer.parseInt(getParameter("TagPubAnsiedad")));
        t.setTagPubDepresion(Integer.parseInt(getParameter("TagPubDepresion")));
        t.setTagPubConflictos(Integer.parseInt(getParameter("TagPubConflictos")));
        t.setTagPubBienestar(Integer.parseInt(getParameter("TagPubBienestar")));
        t.setTagPubCrecimiento(Integer.parseInt(getParameter("TagPubCrecimiento")));
        t.setTagPubSalud(Integer.parseInt(getParameter("TagPubSalud")));
        t.setTagPubTranstornos(Integer.parseInt(getParameter("TagPubTranstornos")));
        t.setTagPubRecaidas(Integer.parseInt(getParameter("TagPubRecaidas")));
        t.setTagPubSueno(Integer.parseInt(getParameter("TagPubSueno")));
        return  tagpubService.addInterTagPub(t);
    }

    @Override
    public List<InterTagPub> getListT() {
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
    public InterTagPub getTByKey() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
