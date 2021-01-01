/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.recruitment;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.JobVacancy;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface JobVacancyService {
  
    JobVacancy create(JobVacancy t);

    JobVacancy read(Integer id);

    JobVacancy update(JobVacancy t);

    void delete(Integer id);

    List<JobVacancy> findAll();

}
