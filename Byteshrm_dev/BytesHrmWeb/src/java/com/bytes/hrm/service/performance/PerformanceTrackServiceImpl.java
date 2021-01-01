/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.PerformanceTrack;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.performance.PerformanceTrackDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PerformanceTrackServiceImpl implements PerformanceTrackService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    PerformanceTrackDao dao = factory.getPerformanceTrackDao();

    @Override
    public PerformanceTrack create(PerformanceTrack t) {
        return dao.create(t);
        
    }

    @Override
    public PerformanceTrack read(Integer id) {
        return dao.read(id);
    }

    @Override
    public PerformanceTrack update(PerformanceTrack t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<PerformanceTrack> findAll() {
        return dao.findAll();
    }

   
    

}
