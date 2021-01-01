/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;
import com.bytes.hrm.dao.entity.OperationalCountry;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.OperationalCountryDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class OperationalCountryServiceImpl implements OperationalCountryService {
    
    // create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    OperationalCountryDao dao = factory.getOperationalCountryDao();

    @Override
    public OperationalCountry create(OperationalCountry t) {
        return dao.create(t);
        
    }

    @Override
    public OperationalCountry read(Integer id) {
        return dao.read(id);
    }

    @Override
    public OperationalCountry update(OperationalCountry t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<OperationalCountry> findAll() {
        return dao.findAll();
    }

   
    

}
