/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.qualification;

import com.bytes.hrm.dao.entity.Language;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class LanguageDto  implements  Serializable{

    /**
     * @return the language
     */
    public  Language getLanguage() {
        return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage( Language language) {
        this.language = language;
    }

    /**
     * @return the languageList
     */
    public List< Language> getLanguageList() {
        return languageList;
    }

    /**
     * @param languageList the languageList to set
     */
    public void setLanguageList(List< Language> languageList) {
        this.languageList = languageList;
    }
    
   private  Language language=new  Language();   
   private List< Language> languageList=new ArrayList<>();
    
}
