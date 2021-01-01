/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.pim;


import com.bytes.hrm.dao.entity.EmpSkill;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface EmpSkillService {

    EmpSkill create(EmpSkill t);

    EmpSkill read(Integer id);

    List<EmpSkill> readByEmpNumber(Integer empNumber);

    EmpSkill update(EmpSkill t);

    void delete(Integer id);

    List<EmpSkill> findAll();

}
