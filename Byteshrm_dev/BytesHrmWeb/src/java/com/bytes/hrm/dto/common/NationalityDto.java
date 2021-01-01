/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.common;

import com.bytes.hrm.dao.entity.Nationality;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class NationalityDto  implements  Serializable{

    /**
     * @return the nationality
     */
    public  Nationality getNationality() {
        return nationality;
    }

    /**
     * @param nationality the nationality to set
     */
    public void setNationality( Nationality nationality) {
        this.nationality = nationality;
    }

    /**
     * @return the nationalityList
     */
    public List< Nationality> getNationalityList() {
        return nationalityList;
    }

    /**
     * @param nationalityList the nationalityList to set
     */
    public void setNationalityList(List< Nationality> nationalityList) {
        this.nationalityList = nationalityList;
    }
    
   private  Nationality nationality=new  Nationality();   
   private List< Nationality> nationalityList=new ArrayList<>();
    
}
