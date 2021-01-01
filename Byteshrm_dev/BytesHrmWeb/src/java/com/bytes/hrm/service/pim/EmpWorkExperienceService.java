/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;

import com.bytes.hrm.dao.entity.EmpWorkExperience;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpWorkExperienceService {

    EmpWorkExperience create(EmpWorkExperience t);

    EmpWorkExperience read(Integer id);
    
    List<EmpWorkExperience> readByEmpNumber(Integer empNumber);

    EmpWorkExperience update(EmpWorkExperience t);

    void delete(Integer id);

    List<EmpWorkExperience> findAll();

}
