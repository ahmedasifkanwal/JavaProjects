/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.qualification;


import com.bytes.hrm.dao.entity.Education;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class EducationDto  implements  Serializable{

    /**
     * @return the education
     */
    public Education getEducation() {
        return education;
    }

    /**
     * @param education the education to set
     */
    public void setEducation(Education education) {
        this.education = education;
    }

    /**
     * @return the educationList
     */
    public List< Education> getEducationList() {
        return educationList;
    }

    /**
     * @param educationList the educationList to set
     */
    public void setEducationList(List< Education> educationList) {
        this.educationList = educationList;
    }

    
   private  Education education=new  Education();   
   private List< Education> educationList=new ArrayList<>();
    
}
