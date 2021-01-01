/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.asset;

import com.bytes.hrm.dao.entity.AstStatus;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class AstStatusDto  implements  Serializable{

    /**
     * @return the astStatus
     */
    public AstStatus getAstStatus() {
        return astStatus;
    }

    /**
     * @param astStatus the astStatus to set
     */
    public void setAstStatus(AstStatus astStatus) {
        this.astStatus = astStatus;
    }

    /**
     * @return the astStatusList
     */
    public List<AstStatus> getAstStatusList() {
        return astStatusList;
    }

    /**
     * @param astStatusList the astStatusList to set
     */
    public void setAstStatusList(List<AstStatus> astStatusList) {
        this.astStatusList = astStatusList;
    }
    
   private AstStatus astStatus=new AstStatus();   
   private List<AstStatus> astStatusList=new ArrayList<>();
    
}
