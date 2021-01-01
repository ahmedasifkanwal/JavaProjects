/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.asset;

import com.bytes.hrm.dao.entity.AstAsset;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class AstAssetDto  implements  Serializable{

    /**
     * @return the astAsset
     */
    public AstAsset getAstAsset() {
        return astAsset;
    }

    /**
     * @param astAsset the astAsset to set
     */
    public void setAstAsset(AstAsset astAsset) {
        this.astAsset = astAsset;
    }

    /**
     * @return the astAssetList
     */
    public List<AstAsset> getAstAssetList() {
        return astAssetList;
    }

    /**
     * @param astAssetList the astAssetList to set
     */
    public void setAstAssetList(List<AstAsset> astAssetList) {
        this.astAssetList = astAssetList;
    }
    
   private AstAsset astAsset=new AstAsset();   
   private List<AstAsset> astAssetList=new ArrayList<>();
    
}
