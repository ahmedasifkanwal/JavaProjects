/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveStatus;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveStatusDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveStatusServiceImpl implements LeaveStatusService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveStatusDao dao = factory.getLeaveStatusDao();
    
    
    @Override
    public LeaveStatus create(LeaveStatus t) {
        return dao.create(t);
    }

    @Override
    public LeaveStatus read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveStatus update(LeaveStatus t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveStatus> findAll() {
      return dao.findAll();
    }
    


   
    

}
