/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.cms.helper.DateHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeReportInputValue;
import com.info.cms.presentation.entity.PeUsers;
import com.info.cms.presentation.entity.PeUsersPermission;
import com.info.cms.report.graph.UIDataTable;
import com.info.wifi.cms.entity.AuditLog;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.SysAction;
import com.info.wifi.cms.entity.SysModules;
import com.info.wifi.cms.entity.SysUserAction;
import com.info.wifi.cms.entity.SysUsers;
import com.info.wifi.cms.entity.controller.AuditLogJpaController;
import com.info.wifi.cms.entity.controller.SysActionJpaController;
import com.info.wifi.cms.entity.controller.SysUserActionJpaController;
import com.info.wifi.cms.entity.controller.SysUsersJpaController;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author naeem
 */
public class SysUsersFacade {
    
    static final Logger logger = Logger.getLogger(SysUsersFacade.class.getName());

    /**
     *
     * @param username
     * @param peUsers
     */
    public void setSelectedUser(String username, PeUsers peUsers) {
        SysUsers user = new SysUsersJpaController().findSysUsers(username);
        mapperJpaUsersToPeUsers(user, peUsers);
    }

    /**
     *
     * @param user
     * @return
     */
    public SysUsers getUserByName(String user) {
        SysUsers users = new SysUsersJpaController().findSysUsers(user);
        return users;
    }

    /**
     *
     * @param users
     * @param peUsers
     */
    public void mapperJpaUsersToPeUsers(SysUsers users, PeUsers peUsers) {
        peUsers.setCreatedBy(users.getCreatedBy());
        peUsers.setDateCreated(users.getDateCreated());
        peUsers.setDateModified(users.getDateModified());
        peUsers.setStatus(users.getStatus());
        peUsers.setLastLoginDate(users.getLastLoginDate());
        peUsers.setModifiedBy(users.getModifiedBy());
        peUsers.setPassword(users.getPassword());
        peUsers.setAuthority(users.getUserAuthority());
        peUsers.setUsername(users.getUsername());
        peUsers.setOwnerName(users.getOwner() == null ? "" : users.getOwner());
        peUsers.setUserFullName(users.getUserFullName());
        peUsers.setEmail(users.getEmail());
        peUsers.setToDate(DateHelper.INPUT_DATE_FORMAT.format(users.getExpiryDate()));
    }

    /**
     *
     * @param peUsers
     * @return
     * @throws Exception
     */
    public boolean saveUser(PeUsers peUsers) throws Exception {
        
        SysUsersJpaController usersController = new SysUsersJpaController();
        peUsers.setDateCreated(DateHelper.getCurrentDate());
        //peUsers.setLastLoginDate(DateHelper.getCurrentDate());
        peUsers.setAuthority(peUsers.getAuthority());
        SysUsers users = mapperPeUsersToJpaUsers(peUsers, UIConstants.OPERATION.ADD.value);
        usersController.create(users);
        return true;
        
    }
    
    private SysUsers mapperPeUsersToJpaUsers(PeUsers peUsers, String mode) throws ParseException {
        
        SysUsers users = new SysUsers();
        if (mode.equals(UIConstants.OPERATION.UPDATE.value)) {
            users.setModifiedBy(peUsers.getModifiedBy());
            users.setDateModified(peUsers.getDateModified());
            
        }
        if (mode.equals(UIConstants.OPERATION.ADD.value)) {
            users.setDateCreated(peUsers.getDateCreated());
            users.setCreatedBy(peUsers.getCreatedBy());
            users.setStatus(UIConstants.STATUS_CODE.ACTIVE.value);
            users.setPassword(peUsers.getPassword());
            // users.setPassword(peUsers.getPassword() == null ? null
            ///    : StringHelper.paasordEncodeMD5(peUsers.getPassword(), ReferenceData.getSetting("SYS_USER_PASSWORD_ENCRIPTION").getSystemValue()));
            users.setIsEncripted("N");
            // users.setIsEncripted(ReferenceData.getSetting("SYS_USER_PASSWORD_ENCRIPTION").getSystemValue());
        }
        if (peUsers.getStatus() != null && !peUsers.getStatus().equals("-1")) {
            users.setStatus(peUsers.getStatus());
        }
        users.setOwner(peUsers.getOwnerName());
        users.setEmail(peUsers.getEmail() == null ? null : peUsers.getEmail());
        users.setUserAuthority(peUsers.getAuthority() == null ? null : peUsers.getAuthority());
        users.setUsername(peUsers.getUsername() == null ? null : peUsers.getUsername());
        users.setUserFullName(peUsers.getUserFullName() == null ? null : peUsers.getUserFullName());
        
        users.setExpiryDate(peUsers.getToDate() == null ? null : DateHelper.INPUT_DATETIME_FORMAT_DAY_END(peUsers.getToDate()));;
        return users;
    }

    /**
     *
     * @param peUsers
     * @param currentUser
     * @return
     */
    public List<PeUsers> searchUsers(PeUsers peUsers, SysUsers currentUser) {
        List<PeUsers> peUsersList = null;
        try {
            
            SysUsers users = mapperPeUsersToJpaUsers(peUsers, UIConstants.OPERATION.SEARCH.value);
            ReportConfiguration reportCon = ReferenceData.getReportConfiguration("SEARCH_SYS_USER_SQL");
            
            List list = new SysUsersJpaController().searchSysUsers(users, reportCon.getSelectSql(), currentUser.getUserAuthority().equals(UIConstants.ROLES.SYSTEM.value));
            peUsers.setSearchResult(UIDataTable.getFormattedTable(list, reportCon.getSelectColumn(), reportCon.getColumnFormat(), reportCon.getReportRequire()));
        } catch (Exception ex) {
            logger.log(Level.INFO, "searchUsers: Error{0}", ex.getMessage());
        }
        
        return peUsersList;
    }
    
    public void printSysUser(PeReportInputValue peReportInput, PeUsers peUsers, SysUsers currentUser) {
        try {
            ReportConfiguration reportCon = ReferenceData.getReportConfiguration("SEARCH_SYS_USER_SQL");
            SysUsers users = mapperPeUsersToJpaUsers(peUsers, UIConstants.OPERATION.SEARCH.value);
            List list = new SysUsersJpaController().searchSysUsers(users, reportCon.getReportSql(), currentUser.getUserAuthority().equals(UIConstants.ROLES.SYSTEM.value));
            UIDataTable.printRecords(list, reportCon.getReportHeader(), reportCon.getReportStyle(), reportCon.getValue());
        } catch (ParseException ex) {
            Logger.getLogger(SysUsersFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param user
     * @param peUsers
     */
    public void getUsersByName(String user, PeUsers peUsers) {
        
        SysUsers selectedUser = new SysUsersJpaController().findSysUsers(user);
        peUsers.setUsername(selectedUser.getUsername());
        // peUsers.setAuthority(new UserAuthoritiesJpaController().getUserAuthorities(user).get(0).getAuthority());
        peUsers.setStatus("A".equals(selectedUser.getStatus()) ? "A" : "I");
        
    }

    /**
     *
     * @param peUsers
     * @return
     * @throws Exception
     */
    public boolean editSysUser(PeUsers peUsers) throws Exception {
        SysUsers users = null;
        SysUsersJpaController usersController = new SysUsersJpaController();
        peUsers.setDateModified(DateHelper.getCurrentDate());
        users = mapperPeUsersToJpaUsers(peUsers, UIConstants.OPERATION.UPDATE.value);
        usersController.editSysUser(users);
        return true;
    }
    
    private void mapSysUsersListToPeUsersList(List usersList, PeUsers peUsers) throws ParseException {
        
        for (Object usersList1 : usersList) {
            Object[] vector = (Object[]) usersList1;
            PeUsers pe = new PeUsers();
            pe.setUsername(vector[0] != null ? vector[0].toString() : null);
            pe.setPassword(vector[1] != null ? vector[1].toString() : null);
            pe.setStatus(vector[2].toString().equals(UIConstants.STATUS_CODE.ACTIVE.value)
                    == true ? UIConstants.STATUS_CODE_DESC.ACTIVE.value
                    : UIConstants.STATUS_CODE_DESC.IN_ACTIVE.value);
            pe.setAuthority(vector[3] != null ? vector[3].toString() : null);
            pe.setDateCreated(vector[4] != null ? DateHelper.DB_DATE_FORMAT.parse(vector[4].toString()) : null);
            pe.setLastLoginDate(vector[5] != null ? DateHelper.DB_DATE_FORMAT.parse(vector[5].toString()) : null);
            pe.setCreatedBy(vector[6] != null ? vector[6].toString() : null);
            pe.setDateModified(vector[7] != null ? DateHelper.DB_DATE_FORMAT.parse(vector[7].toString()) : null);
            pe.setModifiedBy(vector[8] != null ? vector[8].toString() : null);
            pe.setEmail(vector[9] != null ? vector[9].toString() : null);
            pe.setExpiryDate(vector[11] != null ? DateHelper.DB_DATE_FORMAT.parse(vector[11].toString()) : null);
            pe.setUserFullName(vector[12] != null ? vector[12].toString() : null);
            peUsers.getPeUsersList().add(pe);
        }
    }

    /**
     *
     * @param auditLog
     */
    public void saveAuditLog(AuditLog auditLog) {
        try {
            AuditLogJpaController auditLogJpaController = new AuditLogJpaController();
            auditLogJpaController.create(auditLog);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Error in AuditLog Method:{0}", ex.getMessage());
        }
    }
    
    public void setSelectedAuthorityPermission(String authority, PeUsersPermission pe, String currentAuthority) {
        
        List adminlist = new SysUserActionJpaController().getAdminAssignedModule(currentAuthority);
        //Assign module
        List listm = new SysUserActionJpaController().getAssignedDistinctModules(authority);
        for (int m = 0; m < adminlist.size(); m++) {
            Object[] dataAdmin = (Object[]) adminlist.get(m);
            PeUsersPermission obj = new PeUsersPermission();
            obj.setModuleId(dataAdmin[0].toString());
            obj.setModuleName(dataAdmin[1].toString());
            if (listm != null && listm.size() > 0) {
                for (int j = 0; j < listm.size(); j++) {
                    Object[] datam = (Object[]) listm.get(j);
                    if (dataAdmin[0].toString().equals(datam[0].toString())) {
                        obj.setSelModules("true");
                        break;
                    }
                    
                }
                
            }
            pe.getPeModuleList().add(obj);
        }

        //Find Assigned Actions.
        List<SysAction> allActionList = new SysActionJpaController().findSysActionByColumn("Authority", "System");
        
        List assignedList = new SysUserActionJpaController().getAssignedModules(authority);
        
        if (allActionList != null && allActionList.size() > 0) {
            for (int j = 0; j < allActionList.size(); j++) {
                SysAction data = (SysAction) allActionList.get(j);
                PeUsersPermission obj = new PeUsersPermission();
                
                obj.setModuleId(String.valueOf(data.getModuleId().getId()));
                obj.setActionId(data.getId().toString());
                obj.setActionName(data.getDescription());
                
                if (assignedList != null && assignedList.size() > 0) {
                    for (int a = 0; a < assignedList.size(); a++) {
                        
                        Object[] datam = (Object[]) assignedList.get(a);
                        
                        if (data.getId().intValue() == Integer.parseInt(datam[2].toString())) {
                            
                            obj.setSelAction("true");
                            break;
                            
                        }
                        
                    }
                    
                }
                
                pe.getPeUsersPermissionList().add(obj);
                
            }
            
        }
        
    }

    /**
     *
     * @param peUsersPermission
     * @param peUsers
     * @return
     * @throws Exception
     */
    public boolean saveUserPermission(PeUsersPermission peUsersPermission) throws Exception {
        
        peUsersPermission.setDateCreated(DateHelper.getCurrentDate());
        peUsersPermission.setLastLoginDate(DateHelper.getCurrentDate());
        String[] modules = peUsersPermission.getSelModules().split(",");
        String[] actions = peUsersPermission.getSelAction().split(",");
        SysUserActionJpaController sysUserActionJpaController = new SysUserActionJpaController();
        if (modules.length > 0 && actions.length > 0) {
            sysUserActionJpaController.deleteCurrentPermission(peUsersPermission.getAuthority());
            for (String module : modules) {
                String selectedModuleId = module.trim();
                
                for (String action : actions) {
                    String userActionId = action.split("#")[0].trim();
                    String userModuleId = action.split("#")[1].trim();
                    if (selectedModuleId.equals(userModuleId)) {
                        SysUserAction obj = new SysUserAction();
                        obj.setAuthority(peUsersPermission.getAuthority());
                        SysAction actionId = new SysAction(new BigDecimal(userActionId));
                        
                        obj.setActionId(actionId);
                        obj.setAuthority(peUsersPermission.getAuthority());
                        obj.setCreatedBy(peUsersPermission.getCreatedBy());
                        obj.setCreatedDate(DateHelper.getCurrentDate());
                        SysModules moduleId = new SysModules(new BigDecimal(userModuleId));
                        obj.setModuleId(moduleId);
                        obj.setStatus("A");
                        sysUserActionJpaController.create(obj);
                        
                    }
                }
            }
            
        }
        
        return true;
        
    }
}
