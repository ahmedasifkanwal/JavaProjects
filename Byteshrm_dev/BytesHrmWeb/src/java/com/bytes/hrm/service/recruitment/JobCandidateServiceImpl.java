/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.recruitment;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.JobCandidate;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.recruitment.JobCandidateDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class JobCandidateServiceImpl implements JobCandidateService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    JobCandidateDao dao = factory.getJobCandidateDao();

    @Override
    public JobCandidate create(JobCandidate t) {
        return dao.create(t);
        
    }

    @Override
    public JobCandidate read(Integer id) {
        return dao.read(id);
    }

    @Override
    public JobCandidate update(JobCandidate t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<JobCandidate> findAll() {
        return dao.findAll();
    }

   
    

}
