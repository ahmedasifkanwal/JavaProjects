/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;


import com.bytes.hrm.dao.entity.EmpSkill;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpSkillDto implements Serializable {

    /**
     * @return the empSkill
     */
    public EmpSkill getEmpSkill() {
        return empSkill;
    }

    /**
     * @param empSkill the empSkill to set
     */
    public void setEmpSkill(EmpSkill empSkill) {
        this.empSkill = empSkill;
    }

    /**
     * @return the empSkillList
     */
    public List<EmpSkill> getEmpSkillList() {
        return empSkillList;
    }

    /**
     * @param empSkillList the empSkillList to set
     */
    public void setEmpSkillList(List<EmpSkill> empSkillList) {
        this.empSkillList = empSkillList;
    }

    
 
    private EmpSkill empSkill = new EmpSkill();
    private List<EmpSkill> empSkillList = new ArrayList<>();
}
