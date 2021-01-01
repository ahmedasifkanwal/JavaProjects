/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.Leaves;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.LeavesDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeavesServiceImpl implements LeavesService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LeavesDao dao = factory.getLeavesDao();
    
    
    @Override
    public Leaves create(Leaves t) {
        return dao.create(t);
    }

    @Override
    public Leaves read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public Leaves update(Leaves t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<Leaves> findAll() {
      return dao.findAll();
    }
    


   
    

}
