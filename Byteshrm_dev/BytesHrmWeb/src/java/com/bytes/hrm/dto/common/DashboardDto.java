/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.common;

import com.bytes.hrm.dao.entity.EmpPassport;
import com.bytes.hrm.dao.entity.Leaves;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class DashboardDto  implements  Serializable{

    /**
     * @return the leavesList
     */
    public List< Leaves> getLeavesList() {
        return leavesList;
    }

    /**
     * @param leavesList the leavesList to set
     */
    public void setLeavesList(List< Leaves> leavesList) {
        this.leavesList = leavesList;
    }

    /**
     * @return the empPassportList
     */
    public List< EmpPassport> getEmpPassportList() {
        return empPassportList;
    }

    /**
     * @param empPassportList the empPassportList to set
     */
    public void setEmpPassportList(List< EmpPassport> empPassportList) {
        this.empPassportList = empPassportList;
    }

  

   private List< Leaves> leavesList=new ArrayList<>();
   private List< EmpPassport> empPassportList=new ArrayList<>();
    
}
