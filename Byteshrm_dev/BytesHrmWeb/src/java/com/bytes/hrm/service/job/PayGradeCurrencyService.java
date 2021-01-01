/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.PayGradeCurrency;
import com.bytes.hrm.dao.entity.PayGradeCurrencyPK;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface PayGradeCurrencyService {

    PayGradeCurrency create(PayGradeCurrency t);

    PayGradeCurrency read(PayGradeCurrencyPK id);

    PayGradeCurrency update(PayGradeCurrency t);

    void delete(PayGradeCurrencyPK id);

    List<PayGradeCurrency> findAll();

}
