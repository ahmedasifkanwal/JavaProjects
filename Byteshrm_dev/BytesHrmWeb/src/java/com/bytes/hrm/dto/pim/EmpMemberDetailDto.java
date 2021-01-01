/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.pim;

import com.bytes.hrm.dao.entity.EmpMemberDetail;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class EmpMemberDetailDto  implements  Serializable{

    /**
     * @return the empMemberDetail
     */
    public EmpMemberDetail getEmpMemberDetail() {
        return empMemberDetail;
    }

    /**
     * @param empMemberDetail the empMemberDetail to set
     */
    public void setEmpMemberDetail(EmpMemberDetail empMemberDetail) {
        this.empMemberDetail = empMemberDetail;
    }

    /**
     * @return the empMemberDetailList
     */
    public List<EmpMemberDetail> getEmpMemberDetailList() {
        return empMemberDetailList;
    }

    /**
     * @param empMemberDetailList the empMemberDetailList to set
     */
    public void setEmpMemberDetailList(List<EmpMemberDetail> empMemberDetailList) {
        this.empMemberDetailList = empMemberDetailList;
    }
    
   private EmpMemberDetail empMemberDetail=new EmpMemberDetail();   
   private List<EmpMemberDetail> empMemberDetailList=new ArrayList<>();
    
}
