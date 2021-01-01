/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.JobTitle;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface JobTitleService {
  
    JobTitle create(JobTitle t);

    JobTitle read(Integer id);

    JobTitle update(JobTitle t);

    void delete(Integer id);

    List<JobTitle> findAll();

}
