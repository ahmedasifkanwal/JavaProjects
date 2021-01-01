/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Skill;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface SkillService {
  
    Skill create(Skill t);

    Skill read(Integer id);

    Skill update(Skill t);

    void delete(Integer id);

    List<Skill> findAll();

}
