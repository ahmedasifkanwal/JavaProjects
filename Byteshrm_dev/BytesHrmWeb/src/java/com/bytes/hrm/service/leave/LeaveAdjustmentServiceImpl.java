/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveAdjustment;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveAdjustmentDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveAdjustmentServiceImpl implements LeaveAdjustmentService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveAdjustmentDao dao = factory.getLeaveAdjustmentDao();
    
    
    @Override
    public LeaveAdjustment create(LeaveAdjustment t) {
        return dao.create(t);
    }

    @Override
    public LeaveAdjustment read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveAdjustment update(LeaveAdjustment t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveAdjustment> findAll() {
      return dao.findAll();
    }
    


   
    

}
