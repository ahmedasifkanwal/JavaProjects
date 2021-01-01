    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpReportingMethod;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpReportingMethodDto  implements  Serializable{

    /**
     * @return the empReportingMethod
     */
    public EmpReportingMethod getEmpReportingMethod() {
        return empReportingMethod;
    }

    /**
     * @param empReportingMethod the empReportingMethod to set
     */
    public void setEmpReportingMethod(EmpReportingMethod empReportingMethod) {
        this.empReportingMethod = empReportingMethod;
    }

    /**
     * @return the empReportingMethodList
     */
    public List<EmpReportingMethod> getEmpReportingMethodList() {
        return empReportingMethodList;
    }

    /**
     * @param empReportingMethodList the empReportingMethodList to set
     */
    public void setEmpReportingMethodList(List<EmpReportingMethod> empReportingMethodList) {
        this.empReportingMethodList = empReportingMethodList;
    }
    
   private EmpReportingMethod empReportingMethod=new EmpReportingMethod();   
   private List<EmpReportingMethod> empReportingMethodList=new ArrayList<>();
    
}
