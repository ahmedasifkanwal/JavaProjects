/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceTrackerLog;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.performance.PerformanceTrackerLogDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PerformanceTrackerLogServiceImpl implements PerformanceTrackerLogService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    PerformanceTrackerLogDao dao = factory.getPerformanceTrackerLogDao();

    @Override
    public PerformanceTrackerLog create(PerformanceTrackerLog t) {
        return dao.create(t);
        
    }

    @Override
    public PerformanceTrackerLog read(Integer id) {
        return dao.read(id);
    }

    @Override
    public PerformanceTrackerLog update(PerformanceTrackerLog t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<PerformanceTrackerLog> findAll() {
        return dao.findAll();
    }

   
    

}
