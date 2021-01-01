/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.leave;

import com.bytes.hrm.dao.entity.LeaveEntitlement;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LeaveEntitlementDto implements Serializable {

    /**
     * @return the leaveEntitlement
     */
    public LeaveEntitlement getLeaveEntitlement() {
        return leaveEntitlement;
    }

    /**
     * @param leaveEntitlement the leaveEntitlement to set
     */
    public void setLeaveEntitlement(LeaveEntitlement leaveEntitlement) {
        this.leaveEntitlement = leaveEntitlement;
    }

    /**
     * @return the leaveEntitlementList
     */
    public List<LeaveEntitlement> getLeaveEntitlementList() {
        return leaveEntitlementList;
    }

    /**
     * @param leaveEntitlementList the leaveEntitlementList to set
     */
    public void setLeaveEntitlementList(List<LeaveEntitlement> leaveEntitlementList) {
        this.leaveEntitlementList = leaveEntitlementList;
    }

   
  
    private LeaveEntitlement leaveEntitlement = new LeaveEntitlement();
    private List<LeaveEntitlement> leaveEntitlementList = new ArrayList<>();

}
