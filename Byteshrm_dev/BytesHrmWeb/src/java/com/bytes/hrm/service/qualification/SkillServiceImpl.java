/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Skill;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.qualification.SkillDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class SkillServiceImpl implements SkillService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    SkillDao dao = factory.getSkillDao();

    @Override
    public Skill create(Skill t) {
        return dao.create(t);
        
    }

    @Override
    public Skill read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Skill update(Skill t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Skill> findAll() {
        return dao.findAll();
    }

   
    

}
