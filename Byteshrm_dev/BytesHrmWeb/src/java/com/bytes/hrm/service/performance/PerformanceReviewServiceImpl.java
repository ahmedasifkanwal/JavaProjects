/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceReview;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.performance.PerformanceReviewDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PerformanceReviewServiceImpl implements PerformanceReviewService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    PerformanceReviewDao dao = factory.getPerformanceReviewDao();

    @Override
    public PerformanceReview create(PerformanceReview t) {
        return dao.create(t);
        
    }

    @Override
    public PerformanceReview read(Integer id) {
        return dao.read(id);
    }

    @Override
    public PerformanceReview update(PerformanceReview t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<PerformanceReview> findAll() {
        return dao.findAll();
    }

   
    

}
