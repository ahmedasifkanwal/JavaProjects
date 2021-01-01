package com.info.cms.action;

import com.info.cms.facade.ReferenceData;
import com.info.cms.facade.SysUsersFacade;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeUsersPermission;
import com.info.wifi.cms.entity.AuditLog;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public final class SysUsersAccountPermissionAction extends MyActionSupport
        implements ModelDriven<PeUsersPermission>, IOperations {

    private PeUsersPermission peUsersPermission = new PeUsersPermission();

    public SysUsersAccountPermissionAction() {
        super();
        initialize();
    }

    @Override
    public void initialize() {
        peUsersPermission.setAuthorityList(ReferenceData.getAllAuthorities());
        peUsersPermission.setModifiedBy(currentUser.getUsername());
        peUsersPermission.setCreatedBy(currentUser.getUsername());

    }

    @Override
    public void validateSearchInput() {

    }

    @Override
    public String getSelected() {
        try {
            peUsersPermission.setAuthority(request.getParameter("authority"));
            if (getCURRENT_AUTHORITY().equals(UIConstants.ROLES.ADMIN.value)
                    || getCURRENT_AUTHORITY().equals(UIConstants.ROLES.SYSTEM.value)) {
                new SysUsersFacade().setSelectedAuthorityPermission(request.getParameter("authority"), peUsersPermission, getCURRENT_AUTHORITY());
            } else {
                addActionMessage(getText("I_US_01"));
            }
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public String search() {

        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {

    }

    @Override
    public String save() {

        try {

            if (getFieldErrors().size() <= 0 && getActionMessages().size()
                    <= 0 && getActionErrors().size() <= 0) {
                SysUsersFacade facade = new SysUsersFacade();
                if (facade.saveUserPermission(peUsersPermission)) {
                    addActionError(getText("Permission has been assigned successfully."));
                    AuditLog auditLog = new AuditLog();
                    auditLog.setAction(UIConstants.OPERATION.ADD.value);
                    auditLog.setRecordId(new BigInteger("0"));
                    auditLog.setComponent(this.getClass().getSimpleName());
                    List messagePerameter = new ArrayList();
                    messagePerameter.add(currentUser.getUsername());
                    auditLog.setMessage("Permission has been changed by "
                            + currentUser.getUsername() + " for role " + peUsersPermission.getAuthority());
                    auditLog.setAdvAgencyId((ADV_AGENCY_ID));
                    saveAuditLog(auditLog);

                    new SysUsersFacade().setSelectedAuthorityPermission(request.getParameter("authority"), peUsersPermission, getCURRENT_AUTHORITY());

                }
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {

    }

    @Override
    public String edit() {

        return SUCCESS;
    }

    @Override
    public PeUsersPermission getModel() {
        return peUsersPermission;
    }

    /**
     * @return the peUsersPermission
     */
    public PeUsersPermission getPeUsersPermission() {
        return peUsersPermission;
    }

    /**
     * @param peUsersPermission the peUsersPermission to set
     */
    public void setPeUsersPermission(PeUsersPermission peUsersPermission) {
        this.peUsersPermission = peUsersPermission;
    }

}
