/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveLeaveEntitlement;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveLeaveEntitlementDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveLeaveEntitlementServiceImpl implements LeaveLeaveEntitlementService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveLeaveEntitlementDao dao = factory.getLeaveLeaveEntitlementDao();
    
    
    @Override
    public LeaveLeaveEntitlement create(LeaveLeaveEntitlement t) {
        return dao.create(t);
    }

    @Override
    public LeaveLeaveEntitlement read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveLeaveEntitlement update(LeaveLeaveEntitlement t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveLeaveEntitlement> findAll() {
      return dao.findAll();
    }
    


   
    

}
