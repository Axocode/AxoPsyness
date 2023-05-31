package org.axocode.dao;

import java.io.Serializable;

public class InterFlow implements Serializable{
    private Integer FlowSeguidoresID;
    private Integer FlowSeguidorID;
    
    public InterFlow(){
    }

    public Integer getFlowSeguidoresID() {
        return FlowSeguidoresID;
    }

    public void setFlowSeguidoresID(Integer FlowSeguidoresID) {
        this.FlowSeguidoresID = FlowSeguidoresID;
    }

    public Integer getFlowSeguidorID() {
        return FlowSeguidorID;
    }

    public void setFlowSeguidorID(Integer FlowSeguidorID) {
        this.FlowSeguidorID = FlowSeguidorID;
    }

    
}