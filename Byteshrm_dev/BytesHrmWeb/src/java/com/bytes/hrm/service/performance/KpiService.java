/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.performance;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Kpi;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface KpiService {
  
    Kpi create(Kpi t);

    Kpi read(Integer id);

    Kpi update(Kpi t);

    void delete(Integer id);

    List<Kpi> findAll();

}
