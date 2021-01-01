/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Education;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.qualification.EducationDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EducationServiceImpl implements EducationService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    EducationDao dao = factory.getEducationDao();

    @Override
    public Education create(Education t) {
        return dao.create(t);
        
    }

    @Override
    public Education read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Education update(Education t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Education> findAll() {
        return dao.findAll();
    }

   
    

}
