/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceTrackerReviewer;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.performance.PerformanceTrackerReviewerDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PerformanceTrackerReviewerServiceImpl implements PerformanceTrackerReviewerService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    PerformanceTrackerReviewerDao dao = factory.getPerformanceTrackerReviewerDao();

    @Override
    public PerformanceTrackerReviewer create(PerformanceTrackerReviewer t) {
        return dao.create(t);
        
    }

    @Override
    public PerformanceTrackerReviewer read(Integer id) {
        return dao.read(id);
    }

    @Override
    public PerformanceTrackerReviewer update(PerformanceTrackerReviewer t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<PerformanceTrackerReviewer> findAll() {
        return dao.findAll();
    }

   
    

}
