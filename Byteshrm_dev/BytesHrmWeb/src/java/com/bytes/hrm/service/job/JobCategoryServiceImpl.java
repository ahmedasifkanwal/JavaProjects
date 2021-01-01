/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;


import com.bytes.hrm.dao.entity.JobCategory;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.JobCategoryDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class JobCategoryServiceImpl implements JobCategoryService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    JobCategoryDao dao = factory.getJobCategoryDao();

    @Override
    public JobCategory create(JobCategory t) {
        return dao.create(t);
        
    }

    @Override
    public JobCategory read(Integer id) {
        return dao.read(id);
    }

    @Override
    public JobCategory update(JobCategory t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<JobCategory> findAll() {
        return dao.findAll();
    }

   
    

}
