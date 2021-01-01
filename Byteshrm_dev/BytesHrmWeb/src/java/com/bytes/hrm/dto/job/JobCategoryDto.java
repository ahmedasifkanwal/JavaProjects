/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.job;

import com.bytes.hrm.dao.entity.JobCategory;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shahid
 */
public class JobCategoryDto  implements  Serializable{

    /**
     * @return the jobTitle
     */
    public JobCategory getJobCategory() {
        return jobTitle;
    }

    /**
     * @param jobTitle the jobTitle to set
     */
    public void setJobCategory(JobCategory jobTitle) {
        this.jobTitle = jobTitle;
    }

    /**
     * @return the jobTitleList
     */
    public List<JobCategory> getJobCategoryList() {
        return jobTitleList;
    }

    /**
     * @param jobTitleList the jobTitleList to set
     */
    public void setJobCategoryList(List<JobCategory> jobTitleList) {
        this.jobTitleList = jobTitleList;
    }
    
   private JobCategory jobTitle=new JobCategory();   
   private List<JobCategory> jobTitleList=new ArrayList<>();
    
}
