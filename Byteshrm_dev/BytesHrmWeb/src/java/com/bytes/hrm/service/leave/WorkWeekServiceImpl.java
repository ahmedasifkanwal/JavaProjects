/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.WorkWeek;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.WorkWeekDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class WorkWeekServiceImpl implements WorkWeekService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    WorkWeekDao dao = factory.getWorkWeekDao();
    
    
    @Override
    public WorkWeek create(WorkWeek t) {
        return dao.create(t);
    }

    @Override
    public WorkWeek read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public WorkWeek update(WorkWeek t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<WorkWeek> findAll() {
      return dao.findAll();
    }
    


   
    

}
