/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.recruitment;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.JobVacancy;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.recruitment.JobVacancyDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class JobVacancyServiceImpl implements JobVacancyService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    JobVacancyDao dao = factory.getJobVacancyDao();

    @Override
    public JobVacancy create(JobVacancy t) {
        return dao.create(t);
        
    }

    @Override
    public JobVacancy read(Integer id) {
        return dao.read(id);
    }

    @Override
    public JobVacancy update(JobVacancy t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<JobVacancy> findAll() {
        return dao.findAll();
    }

   
    

}
