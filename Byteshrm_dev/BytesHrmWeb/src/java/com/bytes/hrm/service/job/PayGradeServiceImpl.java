/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;


import com.bytes.hrm.dao.entity.PayGrade;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.PayGradeDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PayGradeServiceImpl implements PayGradeService {
// create the required DAO Factory

    DAOFactory factory = DAOFactory.getDAOFactory();
    PayGradeDao dao = factory.getPayGradeDao();

    @Override
    public PayGrade create(PayGrade t) {
        return dao.create(t);
        
    }

    @Override
    public PayGrade read(Integer id) {
        return dao.read(id);
    }

    @Override
    public PayGrade update(PayGrade t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<PayGrade> findAll() {
        return dao.findAll();
    }

   
    

}
