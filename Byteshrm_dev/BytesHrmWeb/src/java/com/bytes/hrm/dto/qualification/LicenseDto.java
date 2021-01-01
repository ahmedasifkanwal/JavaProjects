/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.qualification;

import com.bytes.hrm.dto.job.*;
import com.bytes.hrm.dto.common.*;
import com.bytes.hrm.dao.entity.License;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class LicenseDto  implements  Serializable{

    /**
     * @return the license
     */
    public  License getLicense() {
        return license;
    }

    /**
     * @param license the license to set
     */
    public void setLicense( License license) {
        this.license = license;
    }

    /**
     * @return the licenseList
     */
    public List< License> getLicenseList() {
        return licenseList;
    }

    /**
     * @param licenseList the licenseList to set
     */
    public void setLicenseList(List< License> licenseList) {
        this.licenseList = licenseList;
    }
    
   private  License license=new  License();   
   private List< License> licenseList=new ArrayList<>();
    
}
