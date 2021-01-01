/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpDependents;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public interface EmpDependentsService {

    EmpDependents create(EmpDependents t);

    EmpDependents read(Integer id);

    EmpDependents update(EmpDependents t);

    void delete(Integer id);

    List<EmpDependents> findAll();
    
      Collection<EmpDependents> search( Map<String, Object> m);

}
