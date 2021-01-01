/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpBasicsalary;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpBasicsalaryService {

    EmpBasicsalary create(EmpBasicsalary t);

    EmpBasicsalary read(Integer id);
    
    List<EmpBasicsalary> readByEmpNumber(Integer empNumber);

    EmpBasicsalary update(EmpBasicsalary t);

    void delete(Integer id);

    List<EmpBasicsalary> findAll();

}
