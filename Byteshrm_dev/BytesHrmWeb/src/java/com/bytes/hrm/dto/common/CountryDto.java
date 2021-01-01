/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.common;

import com.bytes.hrm.dao.entity.Country;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class CountryDto  implements  Serializable{

    /**
     * @return the country
     */
    public  Country getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry( Country country) {
        this.country = country;
    }

    /**
     * @return the countryList
     */
    public List< Country> getCountryList() {
        return countryList;
    }

    /**
     * @param countryList the countryList to set
     */
    public void setCountryList(List< Country> countryList) {
        this.countryList = countryList;
    }
    
   private  Country country=new  Country();   
   private List< Country> countryList=new ArrayList<>();
    
}
