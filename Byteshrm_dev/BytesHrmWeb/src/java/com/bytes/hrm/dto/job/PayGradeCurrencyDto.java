/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.job;

import com.bytes.hrm.dao.entity.PayGrade;
import com.bytes.hrm.dao.entity.PayGradeCurrency;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class PayGradeCurrencyDto {

  
    /**
     * @return the payGradeCurrency
     */
    public PayGradeCurrency getPayGradeCurrency() {
        return payGradeCurrency;
    }

    /**
     * @param payGradeCurrency the payGradeCurrency to set
     */
    public void setPayGradeCurrency(PayGradeCurrency payGradeCurrency) {
        this.payGradeCurrency = payGradeCurrency;
    }

    /**
     * @return the payGradeCurrencyList
     */
    public List<PayGradeCurrency> getPayGradeCurrencyList() {
        return payGradeCurrencyList;
    }

    /**
     * @param payGradeCurrencyList the payGradeCurrencyList to set
     */
    public void setPayGradeCurrencyList(List<PayGradeCurrency> payGradeCurrencyList) {
        this.payGradeCurrencyList = payGradeCurrencyList;
    }
   private PayGradeCurrency payGradeCurrency=new PayGradeCurrency();   
   private List<PayGradeCurrency> payGradeCurrencyList=new ArrayList<>();
   
}
