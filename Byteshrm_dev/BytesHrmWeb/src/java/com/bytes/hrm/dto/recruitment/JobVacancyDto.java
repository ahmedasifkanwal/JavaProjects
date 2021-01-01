/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.recruitment;

import com.bytes.hrm.dto.job.*;
import com.bytes.hrm.dao.entity.JobVacancy;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class JobVacancyDto  implements  Serializable{

    /**
     * @return the jobVacancy
     */
    public JobVacancy getJobVacancy() {
        return jobVacancy;
    }

    /**
     * @param jobVacancy the jobVacancy to set
     */
    public void setJobVacancy(JobVacancy jobVacancy) {
        this.jobVacancy = jobVacancy;
    }

    /**
     * @return the jobVacancyList
     */
    public List<JobVacancy> getJobVacancyList() {
        return jobVacancyList;
    }

    /**
     * @param jobVacancyList the jobVacancyList to set
     */
    public void setJobVacancyList(List<JobVacancy> jobVacancyList) {
        this.jobVacancyList = jobVacancyList;
    }
    
   private JobVacancy jobVacancy=new JobVacancy();   
   private List<JobVacancy> jobVacancyList=new ArrayList<>();
    
}
