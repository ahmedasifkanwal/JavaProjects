/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.job;

import com.bytes.hrm.dao.entity.JobTitle;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class JobTitleDto  implements  Serializable{

    /**
     * @return the jobTitle
     */
    public JobTitle getJobTitle() {
        return jobTitle;
    }

    /**
     * @param jobTitle the jobTitle to set
     */
    public void setJobTitle(JobTitle jobTitle) {
        this.jobTitle = jobTitle;
    }

    /**
     * @return the jobTitleList
     */
    public List<JobTitle> getJobTitleList() {
        return jobTitleList;
    }

    /**
     * @param jobTitleList the jobTitleList to set
     */
    public void setJobTitleList(List<JobTitle> jobTitleList) {
        this.jobTitleList = jobTitleList;
    }
    
   private JobTitle jobTitle=new JobTitle();   
   private List<JobTitle> jobTitleList=new ArrayList<>();
    
}
