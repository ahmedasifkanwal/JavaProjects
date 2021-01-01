/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.LeaveRequestComment;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeaveRequestCommentDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveRequestCommentServiceImpl implements LeaveRequestCommentService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeaveRequestCommentDao dao = factory.getLeaveRequestCommentDao();
    
    
    @Override
    public LeaveRequestComment create(LeaveRequestComment t) {
        return dao.create(t);
    }

    @Override
    public LeaveRequestComment read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public LeaveRequestComment update(LeaveRequestComment t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<LeaveRequestComment> findAll() {
      return dao.findAll();
    }
    


   
    

}
