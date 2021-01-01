/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.job;

import com.bytes.hrm.dao.entity.EmploymentStatus;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmploymentStatusDto  implements  Serializable{

    /**
     * @return the jobTitle
     */
    public EmploymentStatus getEmploymentStatus() {
        return jobTitle;
    }

    /**
     * @param jobTitle the jobTitle to set
     */
    public void setEmploymentStatus(EmploymentStatus jobTitle) {
        this.jobTitle = jobTitle;
    }

    /**
     * @return the jobTitleList
     */
    public List<EmploymentStatus> getEmploymentStatusList() {
        return jobTitleList;
    }

    /**
     * @param jobTitleList the jobTitleList to set
     */
    public void setEmploymentStatusList(List<EmploymentStatus> jobTitleList) {
        this.jobTitleList = jobTitleList;
    }
    
   private EmploymentStatus jobTitle=new EmploymentStatus();   
   private List<EmploymentStatus> jobTitleList=new ArrayList<>();
    
}
