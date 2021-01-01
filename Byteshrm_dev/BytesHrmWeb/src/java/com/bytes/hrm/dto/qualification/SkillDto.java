/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.qualification;

import com.bytes.hrm.dao.entity.Skill;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class SkillDto  implements  Serializable{

    /**
     * @return the skill
     */
    public  Skill getSkill() {
        return skill;
    }

    /**
     * @param skill the skill to set
     */
    public void setSkill( Skill skill) {
        this.skill = skill;
    }

    /**
     * @return the skillList
     */
    public List< Skill> getSkillList() {
        return skillList;
    }

    /**
     * @param skillList the skillList to set
     */
    public void setSkillList(List< Skill> skillList) {
        this.skillList = skillList;
    }
    
   private  Skill skill=new  Skill();   
   private List< Skill> skillList=new ArrayList<>();
    
}
