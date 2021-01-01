/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpPassport;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Shahid
 */
public interface EmpPassportService {

    EmpPassport create(EmpPassport t);

    EmpPassport read(Integer id);

    EmpPassport update(EmpPassport t);

    void delete(Integer id);

    List<EmpPassport> findAll();

    Collection<EmpPassport> search(Map<String, Object> m);
}
