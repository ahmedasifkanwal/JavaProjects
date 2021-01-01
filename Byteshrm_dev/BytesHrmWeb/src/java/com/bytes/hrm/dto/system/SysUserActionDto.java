/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.system;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class SysUserActionDto implements Serializable {
   
    private Integer id;
    private String sysUserName;
    private String createdBy;
    private Date createdDate;
   
    private String updateBy;
    
    private Date updateDate;
    
    private String status;
    
    private String authority;
    
    private SysModulesDto moduleId;
    
    private SysActionDto actionId;

    public SysUserActionDto() {
    }

    public SysUserActionDto(Integer id) {
        this.id = id;
    }

    public SysUserActionDto(Integer id, String createdBy, Date createdDate, String status) {
        this.id = id;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public SysModulesDto getModuleId() {
        return moduleId;
    }

    public void setModuleId(SysModulesDto moduleId) {
        this.moduleId = moduleId;
    }

    public SysActionDto getActionId() {
        return actionId;
    }

    public void setActionId(SysActionDto actionId) {
        this.actionId = actionId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SysUserActionDto)) {
            return false;
        }
        SysUserActionDto other = (SysUserActionDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.info.wifi.SysUserAction[ id=" + id + " ]";
    }
    
}
