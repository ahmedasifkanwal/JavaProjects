/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.orgnaization;

import com.bytes.hrm.dao.entity.Subunit;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class SubunitDto  implements  Serializable{

    /**
     * @return the subunitParent
     */
    public Subunit getSubunitParent() {
        return subunitParent;
    }

    /**
     * @param subunitParent the subunitParent to set
     */
    public void setSubunitParent(Subunit subunitParent) {
        this.subunitParent = subunitParent;
    }

    /**
     * @return the subunit
     */
    public Subunit getSubunit() {
        return subunit;
    }

    /**
     * @param subunit the subunit to set
     */
    public void setSubunit(Subunit subunit) {
        this.subunit = subunit;
    }

    /**
     * @return the subunitList
     */
    public List<Subunit> getSubunitList() {
        return subunitList;
    }

    /**
     * @param subunitList the subunitList to set
     */
    public void setSubunitList(List<Subunit> subunitList) {
        this.subunitList = subunitList;
    }
    
   private Subunit subunit=new Subunit();   
    private Subunit subunitParent=new Subunit();   
   private List<Subunit> subunitList=new ArrayList<>();
    
}
