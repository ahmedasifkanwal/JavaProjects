/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.License;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.qualification.LicenseDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LicenseServiceImpl implements LicenseService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LicenseDao dao = factory.getLicenseDao();

    @Override
    public License create(License t) {
        return dao.create(t);
        
    }

    @Override
    public License read(Integer id) {
        return dao.read(id);
    }

    @Override
    public License update(License t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<License> findAll() {
        return dao.findAll();
    }

   
    

}
