/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpEducation;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpEducationDto  implements  Serializable{

    /**
     * @return the empEducation
     */
    public EmpEducation getEmpEducation() {
        return empEducation;
    }

    /**
     * @param empEducation the empEducation to set
     */
    public void setEmpEducation(EmpEducation empEducation) {
        this.empEducation = empEducation;
    }

    /**
     * @return the empEducationList
     */
    public List<EmpEducation> getEmpEducationList() {
        return empEducationList;
    }

    /**
     * @param empEducationList the empEducationList to set
     */
    public void setEmpEducationList(List<EmpEducation> empEducationList) {
        this.empEducationList = empEducationList;
    }
    
   private EmpEducation empEducation=new EmpEducation();   
   private List<EmpEducation> empEducationList=new ArrayList<>();
    
}
