/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.JobCategory;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface JobCategoryService {
  
    JobCategory create(JobCategory t);

    JobCategory read(Integer id);

    JobCategory update(JobCategory t);

    void delete(Integer id);

    List<JobCategory> findAll();

}
