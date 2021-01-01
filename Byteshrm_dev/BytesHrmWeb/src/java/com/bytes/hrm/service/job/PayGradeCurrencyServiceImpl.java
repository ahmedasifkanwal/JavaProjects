/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.PayGradeCurrency;
import com.bytes.hrm.dao.entity.PayGradeCurrencyPK;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.job.PayGradeCurrencyDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class PayGradeCurrencyServiceImpl implements PayGradeCurrencyService {

    DAOFactory factory = DAOFactory.getDAOFactory();
    PayGradeCurrencyDao dao = factory.getPayGradeCurrencyDao();

    @Override
    public PayGradeCurrency create(PayGradeCurrency t) {

        PayGradeCurrencyPK payGradeCurrencyPK = new PayGradeCurrencyPK();
        payGradeCurrencyPK.setCurrencyId(t.getCurrencyType().getCurrencyId());
        payGradeCurrencyPK.setPayGradeId(t.getPayGrade().getId());
        t.setPayGradeCurrencyPK(payGradeCurrencyPK);
        dao.create(t);
        return t;
    }

    @Override
    public PayGradeCurrency read(PayGradeCurrencyPK id) {
      return dao.read(id);
    }

    @Override
    public PayGradeCurrency update(PayGradeCurrency t) {
        PayGradeCurrencyPK payGradeCurrencyPK = new PayGradeCurrencyPK();
        payGradeCurrencyPK.setCurrencyId(t.getCurrencyType().getCurrencyId());
        payGradeCurrencyPK.setPayGradeId(t.getPayGrade().getId());
        t.setPayGradeCurrencyPK(payGradeCurrencyPK);
        return dao.update(t);
    }

    @Override
    public void delete(PayGradeCurrencyPK id) {
    }

    @Override
    public List<PayGradeCurrency> findAll() {
        return null;
    }

}
