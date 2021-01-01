/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpWorkExperience;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpWorkExperienceDto  implements  Serializable{

    /**
     * @return the empWorkExperience
     */
    public EmpWorkExperience getEmpWorkExperience() {
        return empWorkExperience;
    }

    /**
     * @param empWorkExperience the empWorkExperience to set
     */
    public void setEmpWorkExperience(EmpWorkExperience empWorkExperience) {
        this.empWorkExperience = empWorkExperience;
    }

    /**
     * @return the empWorkExperienceList
     */
    public List<EmpWorkExperience> getEmpWorkExperienceList() {
        return empWorkExperienceList;
    }

    /**
     * @param empWorkExperienceList the empWorkExperienceList to set
     */
    public void setEmpWorkExperienceList(List<EmpWorkExperience> empWorkExperienceList) {
        this.empWorkExperienceList = empWorkExperienceList;
    }
    
   private EmpWorkExperience empWorkExperience=new EmpWorkExperience();   
   private List<EmpWorkExperience> empWorkExperienceList=new ArrayList<>();
    
}
