/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Language;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.qualification.LanguageDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LanguageServiceImpl implements LanguageService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LanguageDao dao = factory.getLanguageDao();

    @Override
    public Language create(Language t) {
        return dao.create(t);
        
    }

    @Override
    public Language read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Language update(Language t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Language> findAll() {
        return dao.findAll();
    }

   
    

}
