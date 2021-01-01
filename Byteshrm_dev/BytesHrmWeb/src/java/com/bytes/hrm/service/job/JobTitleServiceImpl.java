/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;


import com.bytes.hrm.dao.entity.JobTitle;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.JobTitleDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class JobTitleServiceImpl implements JobTitleService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    JobTitleDao dao = factory.getJobTitleDao();

    @Override
    public JobTitle create(JobTitle t) {
        return dao.create(t);
        
    }

    @Override
    public JobTitle read(Integer id) {
        return dao.read(id);
    }

    @Override
    public JobTitle update(JobTitle t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<JobTitle> findAll() {
        return dao.findAll();
    }

   
    

}
