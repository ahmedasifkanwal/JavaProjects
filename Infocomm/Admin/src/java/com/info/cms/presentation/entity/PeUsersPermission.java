/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PeUsersPermission extends PeUsers implements Serializable {

    private String selModules;
    private String selAction;
    private String userActionId;
    private String moduleId;
    private String actionId;
    private String moduleName;
    private String actionName;
    private List<PeUsersPermission> peUsersPermissionList = new ArrayList<PeUsersPermission>();
    private List<PeUsersPermission> peModuleList = new ArrayList<PeUsersPermission>();

    public PeUsersPermission() {
    }

    /**
     * @return the selModules
     */
    public String getSelModules() {
        return selModules;
    }

    /**
     * @param selModules the selModules to set
     */
    public void setSelModules(String selModules) {
        this.selModules = selModules;
    }

    /**
     * @return the selAction
     */
    public String getSelAction() {
        return selAction;
    }

    /**
     * @param selAction the selAction to set
     */
    public void setSelAction(String selAction) {
        this.selAction = selAction;
    }

    /**
     * @return the userActionId
     */
    public String getUserActionId() {
        return userActionId;
    }

    /**
     * @param userActionId the userActionId to set
     */
    public void setUserActionId(String userActionId) {
        this.userActionId = userActionId;
    }

    /**
     * @return the moduleId
     */
    public String getModuleId() {
        return moduleId;
    }

    /**
     * @param moduleId the moduleId to set
     */
    public void setModuleId(String moduleId) {
        this.moduleId = moduleId;
    }

    /**
     * @return the actionId
     */
    public String getActionId() {
        return actionId;
    }

    /**
     * @param actionId the actionId to set
     */
    public void setActionId(String actionId) {
        this.actionId = actionId;
    }

    /**
     * @return the moduleName
     */
    public String getModuleName() {
        return moduleName;
    }

    /**
     * @param moduleName the moduleName to set
     */
    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    /**
     * @return the actionName
     */
    public String getActionName() {
        return actionName;
    }

    /**
     * @param actionName the actionName to set
     */
    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    /**
     * @return the peUsersPermissionList
     */
    public List<PeUsersPermission> getPeUsersPermissionList() {
        return peUsersPermissionList;
    }

    /**
     * @param peUsersPermissionList the peUsersPermissionList to set
     */
    public void setPeUsersPermissionList(List<PeUsersPermission> peUsersPermissionList) {
        this.peUsersPermissionList = peUsersPermissionList;
    }

    /**
     * @return the peModuleList
     */
    public List<PeUsersPermission> getPeModuleList() {
        return peModuleList;
    }

    /**
     * @param peModuleList the peModuleList to set
     */
    public void setPeModuleList(List<PeUsersPermission> peModuleList) {
        this.peModuleList = peModuleList;
    }

}
