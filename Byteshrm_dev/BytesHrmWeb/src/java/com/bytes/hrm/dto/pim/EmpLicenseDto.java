/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpLicense;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpLicenseDto  implements  Serializable{

    /**
     * @return the empLicense
     */
    public EmpLicense getEmpLicense() {
        return empLicense;
    }

    /**
     * @param empLicense the empLicense to set
     */
    public void setEmpLicense(EmpLicense empLicense) {
        this.empLicense = empLicense;
    }

    /**
     * @return the empLicenseList
     */
    public List<EmpLicense> getEmpLicenseList() {
        return empLicenseList;
    }

    /**
     * @param empLicenseList the empLicenseList to set
     */
    public void setEmpLicenseList(List<EmpLicense> empLicenseList) {
        this.empLicenseList = empLicenseList;
    }
    
   private EmpLicense empLicense=new EmpLicense();   
   private List<EmpLicense> empLicenseList=new ArrayList<>();
    
}
