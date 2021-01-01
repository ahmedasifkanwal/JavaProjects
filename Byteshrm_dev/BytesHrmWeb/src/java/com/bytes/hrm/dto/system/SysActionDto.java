/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.system;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Collection;
import java.util.Date;
public class SysActionDto implements Serializable {
   
    private Integer id;
    
    private String actionName;
    
    private String description;
    
    private String tiles;
    
    private String actionType;
    
    private Date createdDate;
   
    private String createdBy;
    
    private BigInteger displayOrder;
    
    private String authority;
    
    private String status;
    
    private SysModulesDto moduleId;
   
     private Collection<SysUserActionDto> sysUserActionDtoCollection;

    public SysActionDto() {
    }

    public SysActionDto(Integer id) {
        this.id = id;
    }

    public SysActionDto(Integer id, String actionName, String tiles, String actionType, Date createdDate, BigInteger displayOrder, String authority, String status) {
        this.id = id;
        this.actionName = actionName;
        this.tiles = tiles;
        this.actionType = actionType;
        this.createdDate = createdDate;
        this.displayOrder = displayOrder;
        this.authority = authority;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTiles() {
        return tiles;
    }

    public void setTiles(String tiles) {
        this.tiles = tiles;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public BigInteger getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(BigInteger displayOrder) {
        this.displayOrder = displayOrder;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public SysModulesDto getModuleId() {
        return moduleId;
    }

    public void setModuleId(SysModulesDto moduleId) {
        this.moduleId = moduleId;
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
        if (!(object instanceof SysActionDto)) {
            return false;
        }
        SysActionDto other = (SysActionDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.info.wifi.SysAction[ id=" + id + " ]";
    }
    
}
