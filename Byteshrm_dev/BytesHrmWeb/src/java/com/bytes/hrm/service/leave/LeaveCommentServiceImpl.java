/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveComment;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveCommentDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveCommentServiceImpl implements LeaveCommentService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveCommentDao dao = factory.getLeaveCommentDao();
    
    
    @Override
    public LeaveComment create(LeaveComment t) {
        return dao.create(t);
    }

    @Override
    public LeaveComment read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveComment update(LeaveComment t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveComment> findAll() {
      return dao.findAll();
    }
    


   
    

}
