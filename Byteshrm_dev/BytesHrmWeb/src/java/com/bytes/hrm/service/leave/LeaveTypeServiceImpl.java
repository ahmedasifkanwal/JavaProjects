/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveType;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveTypeDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveTypeServiceImpl implements LeaveTypeService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveTypeDao dao = factory.getLeaveTypeDao();
    
    
    @Override
    public LeaveType create(LeaveType t) {
        return dao.create(t);
    }

    @Override
    public LeaveType read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveType update(LeaveType t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveType> findAll() {
      return dao.findAll();
    }
    


   
    

}
