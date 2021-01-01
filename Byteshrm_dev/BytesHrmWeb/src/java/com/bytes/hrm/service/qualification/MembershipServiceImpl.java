/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Membership;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.qualification.MembershipDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class MembershipServiceImpl implements MembershipService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    MembershipDao dao = factory.getMembershipDao();

    @Override
    public Membership create(Membership t) {
        return dao.create(t);
        
    }

    @Override
    public Membership read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Membership update(Membership t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Membership> findAll() {
        return dao.findAll();
    }

   
    

}
