/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.leave;

import com.bytes.hrm.dao.entity.LeaveType;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveTypeDto implements Serializable {

    /**
     * @return the leaveTypeList
     */
    public List<LeaveType> getLeaveTypeList() {
        return leaveTypeList;
    }

    /**
     * @param leaveTypeList the leaveTypeList to set
     */
    public void setLeaveTypeList(List<LeaveType> leaveTypeList) {
        this.leaveTypeList = leaveTypeList;
    }


    /**
     * @return the leaveType
     */
    public LeaveType getLeaveType() {
        return leaveType;
    }

    /**
     * @param leaveType the leaveType to set
     */  
    public void setLeaveType(LeaveType leaveType) {
        this.leaveType = leaveType;
    }


    ///private string __excludeInReportsIfNoEntitlement 
    private LeaveType leaveType = new LeaveType();
    private List<LeaveType> leaveTypeList = new ArrayList<>();

}
