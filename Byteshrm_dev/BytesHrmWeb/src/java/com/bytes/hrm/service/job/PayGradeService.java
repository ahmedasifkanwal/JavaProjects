/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.job;

import com.bytes.hrm.dao.entity.PayGrade;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface PayGradeService {
  
    PayGrade create(PayGrade t);

    PayGrade read(Integer id);

    PayGrade update(PayGrade t);

    void delete(Integer id);

    List<PayGrade> findAll();

}
