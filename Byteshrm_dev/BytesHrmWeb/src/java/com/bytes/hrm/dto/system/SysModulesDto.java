/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.system;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Collection;

public class SysModulesDto implements Serializable {

    private Integer id;
    private String description;
    private Integer moduleType;
    private Integer displayOrder;
    private String cssStyle;
    private String status;
    private String groupType;
    private Collection<SysActionDto> sysActionDtoCollection;

    private Collection<SysUserActionDto> sysUserActionDtoCollection;

    public SysModulesDto() {
    }

    public SysModulesDto(Integer id) {
        this.id = id;
    }

    public SysModulesDto(Integer id, String description, Integer moduleType, Integer displayOrder, String status) {
        this.id = id;
        this.description = description;
        this.moduleType = moduleType;
        this.displayOrder = displayOrder;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getModuleType() {
        return moduleType;
    }

    public void setModuleType(Integer moduleType) {
        this.moduleType = moduleType;
    }

    public Integer getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }

    public String getCssStyle() {
        return cssStyle;
    }

    public void setCssStyle(String cssStyle) {
        this.cssStyle = cssStyle;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   public Collection<SysActionDto> getSysActionDtoCollection() {
        return sysActionDtoCollection;
    }

    public void setSysActionDtoCollection(Collection<SysActionDto> sysActionDtoCollection) {
        this.sysActionDtoCollection = sysActionDtoCollection;
    }

    
    public Collection<SysUserActionDto> getSysUserActionDtoCollection() {
        return sysUserActionDtoCollection;
    }

    public void setSysUserActionDtoCollection(Collection<SysUserActionDto> sysUserActionDtoCollection) {
        this.sysUserActionDtoCollection = sysUserActionDtoCollection;
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
        if (!(object instanceof SysModulesDto)) {
            return false;
        }
        SysModulesDto other = (SysModulesDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.info.wifi.SysModules[ id=" + id + " ]";
    }

    /**
     * @return the groupType
     */
    public String getGroupType() {
        return groupType;
    }

    /**
     * @param groupType the groupType to set
     */
    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }

}
