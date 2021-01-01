/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.common;

import com.bytes.hrm.dao.entity.CurrencyType;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class CurrencyTypeDto {

    /**
     * @return the currencyType
     */
    public CurrencyType getCurrencyType() {
        return currencyType;
    }

    /**
     * @param currencyType the currencyType to set
     */
    public void setCurrencyType(CurrencyType currencyType) {
        this.currencyType = currencyType;
    }

    /**
     * @return the currencyTypeList
     */
    public List< CurrencyType> getCurrencyTypeList() {
        return currencyTypeList;
    }

    /**
     * @param currencyTypeList the currencyTypeList to set
     */
    public void setCurrencyTypeList(List< CurrencyType> currencyTypeList) {
        this.currencyTypeList = currencyTypeList;
    }
    private CurrencyType currencyType = new CurrencyType();
    private List< CurrencyType> currencyTypeList = new ArrayList<>();
}
