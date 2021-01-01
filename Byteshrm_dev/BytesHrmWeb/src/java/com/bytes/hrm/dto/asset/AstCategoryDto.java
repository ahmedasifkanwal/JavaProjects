/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.asset;

import com.bytes.hrm.dao.entity.AstCategory;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class AstCategoryDto  implements  Serializable{

    /**
     * @return the astCategory
     */
    public AstCategory getAstCategory() {
        return astCategory;
    }

    /**
     * @param astCategory the astCategory to set
     */
    public void setAstCategory(AstCategory astCategory) {
        this.astCategory = astCategory;
    }

    /**
     * @return the astCategoryList
     */
    public List<AstCategory> getAstCategoryList() {
        return astCategoryList;
    }

    /**
     * @param astCategoryList the astCategoryList to set
     */
    public void setAstCategoryList(List<AstCategory> astCategoryList) {
        this.astCategoryList = astCategoryList;
    }
    
   private AstCategory astCategory=new AstCategory();   
   private List<AstCategory> astCategoryList=new ArrayList<>();
    
}
