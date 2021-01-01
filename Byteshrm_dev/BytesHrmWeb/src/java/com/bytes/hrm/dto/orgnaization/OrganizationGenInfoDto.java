/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.orgnaization;

import com.bytes.hrm.dto.pim.*;
import com.bytes.hrm.dao.entity.OrganizationGenInfo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class OrganizationGenInfoDto  implements  Serializable{

    /**
     * @return the organizationGenInfo
     */
    public OrganizationGenInfo getOrganizationGenInfo() {
        return organizationGenInfo;
    }

    /**
     * @param organizationGenInfo the organizationGenInfo to set
     */
    public void setOrganizationGenInfo(OrganizationGenInfo organizationGenInfo) {
        this.organizationGenInfo = organizationGenInfo;
    }

    /**
     * @return the organizationGenInfoList
     */
    public List<OrganizationGenInfo> getOrganizationGenInfoList() {
        return organizationGenInfoList;
    }

    /**
     * @param organizationGenInfoList the organizationGenInfoList to set
     */
    public void setOrganizationGenInfoList(List<OrganizationGenInfo> organizationGenInfoList) {
        this.organizationGenInfoList = organizationGenInfoList;
    }
    
   private OrganizationGenInfo organizationGenInfo=new OrganizationGenInfo();   
   private List<OrganizationGenInfo> organizationGenInfoList=new ArrayList<>();
    
}
