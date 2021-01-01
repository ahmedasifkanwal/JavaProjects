/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.recruitment;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.JobCandidate;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface JobCandidateService {
  
    JobCandidate create(JobCandidate t);

    JobCandidate read(Integer id);

    JobCandidate update(JobCandidate t);

    void delete(Integer id);

    List<JobCandidate> findAll();

}
