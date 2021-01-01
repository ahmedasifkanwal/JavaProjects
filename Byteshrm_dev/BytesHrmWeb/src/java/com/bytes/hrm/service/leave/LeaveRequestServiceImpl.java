/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveRequest;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveRequestDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveRequestServiceImpl implements LeaveRequestService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveRequestDao dao = factory.getLeaveRequestDao();
    
    
    @Override
    public LeaveRequest create(LeaveRequest t) {
        return dao.create(t);
    }

    @Override
    public LeaveRequest read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveRequest update(LeaveRequest t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveRequest> findAll() {
      return dao.findAll();
    }
    


   
    

}
