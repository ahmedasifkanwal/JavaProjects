/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveEntitlementAdjustment;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveEntitlementAdjustmentDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveEntitlementAdjustmentServiceImpl implements LeaveEntitlementAdjustmentService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveEntitlementAdjustmentDao dao = factory.getLeaveEntitlementAdjustmentDao();
    
    
    @Override
    public LeaveEntitlementAdjustment create(LeaveEntitlementAdjustment t) {
        return dao.create(t);
    }

    @Override
    public LeaveEntitlementAdjustment read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveEntitlementAdjustment update(LeaveEntitlementAdjustment t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveEntitlementAdjustment> findAll() {
      return dao.findAll();
    }
    


   
    

}
