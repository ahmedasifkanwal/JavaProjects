/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpEducation;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpEducationService {

    EmpEducation create(EmpEducation t);

    EmpEducation read(Integer id);

    List<EmpEducation> readByEmpNumber(Integer empNumber);

    EmpEducation update(EmpEducation t);

    void delete(Integer id);

    List<EmpEducation> findAll();

}
