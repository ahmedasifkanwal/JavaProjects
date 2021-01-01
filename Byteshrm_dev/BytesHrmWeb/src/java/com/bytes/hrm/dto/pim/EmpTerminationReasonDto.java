    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpTerminationReason;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpTerminationReasonDto  implements  Serializable{

    /**
     * @return the empTerminationReason
     */
    public EmpTerminationReason getEmpTerminationReason() {
        return empTerminationReason;
    }

    /**
     * @param empTerminationReason the empTerminationReason to set
     */
    public void setEmpTerminationReason(EmpTerminationReason empTerminationReason) {
        this.empTerminationReason = empTerminationReason;
    }

    /**
     * @return the empTerminationReasonList
     */
    public List<EmpTerminationReason> getEmpTerminationReasonList() {
        return empTerminationReasonList;
    }

    /**
     * @param empTerminationReasonList the empTerminationReasonList to set
     */
    public void setEmpTerminationReasonList(List<EmpTerminationReason> empTerminationReasonList) {
        this.empTerminationReasonList = empTerminationReasonList;
    }
    
   private EmpTerminationReason empTerminationReason=new EmpTerminationReason();   
   private List<EmpTerminationReason> empTerminationReasonList=new ArrayList<>();
    
}
