/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.asset;

import com.bytes.hrm.dao.entity.AstVendor;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class AstVendorDto  implements  Serializable{

    /**
     * @return the astVendor
     */
    public AstVendor getAstVendor() {
        return astVendor;
    }

    /**
     * @param astVendor the astVendor to set
     */
    public void setAstVendor(AstVendor astVendor) {
        this.astVendor = astVendor;
    }

    /**
     * @return the astVendorList
     */
    public List<AstVendor> getAstVendorList() {
        return astVendorList;
    }

    /**
     * @param astVendorList the astVendorList to set
     */
    public void setAstVendorList(List<AstVendor> astVendorList) {
        this.astVendorList = astVendorList;
    }
    
   private AstVendor astVendor=new AstVendor();   
   private List<AstVendor> astVendorList=new ArrayList<>();
    
}
