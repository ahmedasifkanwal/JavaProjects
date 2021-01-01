/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeavePeriodHistory;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeavePeriodHistoryDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeavePeriodHistoryServiceImpl implements LeavePeriodHistoryService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeavePeriodHistoryDao dao = factory.getLeavePeriodHistoryDao();
    
    
    @Override
    public LeavePeriodHistory create(LeavePeriodHistory t) {
        return dao.create(t);
    }

    @Override
    public LeavePeriodHistory read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeavePeriodHistory update(LeavePeriodHistory t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeavePeriodHistory> findAll() {
      return dao.findAll();
    }
    


   
    

}
