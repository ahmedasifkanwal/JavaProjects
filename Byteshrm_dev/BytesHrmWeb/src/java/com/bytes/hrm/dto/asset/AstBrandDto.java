/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.asset;

import com.bytes.hrm.dao.entity.AstBrand;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class AstBrandDto  implements  Serializable{

    /**
     * @return the astBrand
     */
    public AstBrand getAstBrand() {
        return astBrand;
    }

    /**
     * @param astBrand the astBrand to set
     */
    public void setAstBrand(AstBrand astBrand) {
        this.astBrand = astBrand;
    }

    /**
     * @return the astBrandList
     */
    public List<AstBrand> getAstBrandList() {
        return astBrandList;
    }

    /**
     * @param astBrandList the astBrandList to set
     */
    public void setAstBrandList(List<AstBrand> astBrandList) {
        this.astBrandList = astBrandList;
    }
    
   private AstBrand astBrand=new AstBrand();   
   private List<AstBrand> astBrandList=new ArrayList<>();
    
}
