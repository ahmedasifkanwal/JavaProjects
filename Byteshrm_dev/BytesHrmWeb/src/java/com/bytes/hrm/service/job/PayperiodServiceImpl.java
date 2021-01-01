/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;


import com.bytes.hrm.dao.entity.Payperiod;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.system.SysAuthoritiesDao;
import com.bytes.hrm.dao.factory.job.PayperiodDao;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PayperiodServiceImpl implements PayperiodService {
// create the required DAO Factory

    DAOFactory factory = DAOFactory.getDAOFactory();
    PayperiodDao dao = factory.getPayperiodDao();

    @Override
    public Payperiod create(Payperiod t) {
        return dao.create(t);
        
    }

    @Override
    public Payperiod read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Payperiod update(Payperiod t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Payperiod> findAll() {
        return dao.findAll();
    }

   
    

}
