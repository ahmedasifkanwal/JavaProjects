/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpLanguage;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpLanguageDto  implements  Serializable{

    /**
     * @return the empLanguage
     */
    public EmpLanguage getEmpLanguage() {
        return empLanguage;
    }

    /**
     * @param empLanguage the empLanguage to set
     */
    public void setEmpLanguage(EmpLanguage empLanguage) {
        this.empLanguage = empLanguage;
    }

    /**
     * @return the empLanguageList
     */
    public List<EmpLanguage> getEmpLanguageList() {
        return empLanguageList;
    }

    /**
     * @param empLanguageList the empLanguageList to set
     */
    public void setEmpLanguageList(List<EmpLanguage> empLanguageList) {
        this.empLanguageList = empLanguageList;
    }
    
   private EmpLanguage empLanguage=new EmpLanguage();   
   private List<EmpLanguage> empLanguageList=new ArrayList<>();
    
}
