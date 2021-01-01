/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.job;

import com.bytes.hrm.dao.entity.PayGrade;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class PayGradeDto  implements  Serializable{

    /**
     * @return the payGrade
     */
    public PayGrade getPayGrade() {
        return payGrade;
    }

    /**
     * @param payGrade the payGrade to set
     */
    public void setPayGrade(PayGrade payGrade) {
        this.payGrade = payGrade;
    }

    /**
     * @return the payGradeList
     */
    public List<PayGrade> getPayGradeList() {
        return payGradeList;
    }

    /**
     * @param payGradeList the payGradeList to set
     */
    public void setPayGradeList(List<PayGrade> payGradeList) {
        this.payGradeList = payGradeList;
    }

    
   private PayGrade payGrade=new PayGrade();   
   private List<PayGrade> payGradeList=new ArrayList<>();
    
    
}
