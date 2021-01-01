/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;


import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Kpi;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.performance.KpiDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class KpiServiceImpl implements KpiService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    KpiDao dao = factory.getKpiDao();

    @Override
    public Kpi create(Kpi t) {
        return dao.create(t);
        
    }

    @Override
    public Kpi read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Kpi update(Kpi t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Kpi> findAll() {
        return dao.findAll();
    }

   
    

}
