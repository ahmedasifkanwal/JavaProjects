/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;


import com.bytes.hrm.dao.entity.EmploymentStatus;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.EmploymentStatusDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmploymentStatusServiceImpl implements EmploymentStatusService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EmploymentStatusDao dao = factory.getEmploymentStatusDao();

    @Override
    public EmploymentStatus create(EmploymentStatus t) {
        return dao.create(t);
        
    }

    @Override
    public EmploymentStatus read(Integer id) {
        return dao.read(id);
    }

    @Override
    public EmploymentStatus update(EmploymentStatus t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<EmploymentStatus> findAll() {
        return dao.findAll();
    }

   
    

}
