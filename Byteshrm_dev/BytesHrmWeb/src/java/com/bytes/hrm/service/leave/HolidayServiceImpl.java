/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.leave;



import com.bytes.hrm.dao.entity.Holiday;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.leave.HolidayDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class HolidayServiceImpl implements HolidayService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    HolidayDao dao = factory.getHolidayDao();
    
    
    @Override
    public Holiday create(Holiday t) {
        return dao.create(t);
    }

    @Override
    public Holiday read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public Holiday update(Holiday t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<Holiday> findAll() {
      return dao.findAll();
    }
    


   
    

}
