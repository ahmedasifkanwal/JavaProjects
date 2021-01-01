/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import com.info.wifi.cms.entity.SysAction;
import com.info.wifi.cms.entity.SysAuthorities;
import com.info.wifi.cms.entity.SysModules;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PeUsers extends PeCommon implements Serializable {

    private List<PeUsers> peUsersList = new ArrayList<PeUsers>();
    private List<SysAuthorities> authorityList = new ArrayList<SysAuthorities>();

    private List<SysAction> peSysActionList = new ArrayList<SysAction>();
    private List<SysModules> peSysModulesList = new ArrayList<SysModules>();

    private String username;
    private String email;
    private String userFullName;
    private String password;
    private String oldPassword;
    private String rePassword;
    private String status;

    private String customerName;

    private Date dateCreated;
    private Date lastLoginDate;
    private String createdBy;
    private Date dateModified;
    private Date expiryDate;
    private String modifiedBy;
    private String authority;
    private String title;
    private String description;
    private String loginUser;

    private String toDate;

   
    public PeUsers() {
       
    }

    public PeUsers(String module, String ADV_AGENCY_ID) {
      
        super.Pecommon(module, null, ADV_AGENCY_ID);
    }

    public PeUsers(String username, String password, String status, Date dateCreated, String createdBy) {
        this.username = username;
        this.password = password;
        this.status = status;
        this.dateCreated = dateCreated;
        this.createdBy = createdBy;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getDateModified() {
        return dateModified;
    }

    /**
     *
     * @param dateModified
     */
    public void setDateModified(Date dateModified) {
        this.dateModified = dateModified;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    /**
     * @return the rePassword
     */
    public String getRePassword() {
        return rePassword;
    }

    /**
     * @param rePassword the rePassword to set
     */
    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    /**
     * @return the Status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param Status the Status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the groupName
     */
    public String getAuthority() {
        return authority;
    }

    /**
     * @param groupName the groupName to set
     */
    public void setAuthority(String authority) {
        this.authority = authority;
    }

    /**
     * @return the oldPassword
     */
    public String getOldPassword() {
        return oldPassword;
    }

    /**
     * @param oldPassword the oldPassword to set
     */
    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    /**
     * @return the peUsersList
     */
    public List<PeUsers> getPeUsersList() {
        return peUsersList;
    }

    /**
     * @param peUsersList the peUsersList to set
     */
    public void setPeUsersList(List<PeUsers> peUsersList) {
        this.peUsersList = peUsersList;
    }

    /**
     * @return the loginUser
     */
    public String getLoginUser() {
        return loginUser;
    }

    /**
     * @param loginUser the loginUser to set
     */
    public void setLoginUser(String loginUser) {
        this.loginUser = loginUser;
    }

    /**
     * @return the customerName
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * @param customerName the customerName to set
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void resetFields() {

        this.username = "";
        this.password = "";
        this.oldPassword = "";
        this.rePassword = "";
        this.authority = "";

    }

    /**
     * @return the authorityList
     */
    public List<SysAuthorities> getAuthorityList() {
        return authorityList;
    }

    /**
     * @param authorityList the authorityList to set
     */
    public void setAuthorityList(List<SysAuthorities> authorityList) {
        this.authorityList = authorityList;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the userFullName
     */
    public String getUserFullName() {
        return userFullName;
    }

    /**
     * @param userFullName the userFullName to set
     */
    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    /**
     * @return the toDate
     */
    public String getToDate() {
        return toDate;
    }

    /**
     * @param toDate the toDate to set
     */
    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    /**
     * @return the expiryDate
     */
    public Date getExpiryDate() {
        return expiryDate;
    }

    /**
     * @param expiryDate the expiryDate to set
     */
    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    /**
     * @return the peSysActionList
     */
    public List<SysAction> getPeSysActionList() {
        return peSysActionList;
    }

    /**
     * @param peSysActionList the peSysActionList to set
     */
    public void setPeSysActionList(List<SysAction> peSysActionList) {
        this.peSysActionList = peSysActionList;
    }

    /**
     * @return the peSysModulesList
     */
    public List<SysModules> getPeSysModulesList() {
        return peSysModulesList;
    }

    /**
     * @param peSysModulesList the peSysModulesList to set
     */
    public void setPeSysModulesList(List<SysModules> peSysModulesList) {
        this.peSysModulesList = peSysModulesList;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
   
}
