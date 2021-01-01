/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;


import com.bytes.hrm.dao.entity.WorkShift;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.WorkShiftDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class WorkShiftServiceImpl implements WorkShiftService {
// create the required DAO Factory

    DAOFactory factory = DAOFactory.getDAOFactory();
    WorkShiftDao dao = factory.getWorkShiftDao();

    @Override
    public WorkShift create(WorkShift t) {
        return dao.create(t);
        
    }

    @Override
    public WorkShift read(Integer id) {
        return dao.read(id);
    }

    @Override
    public WorkShift update(WorkShift t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<WorkShift> findAll() {
        return dao.findAll();
    }

   
    

}
