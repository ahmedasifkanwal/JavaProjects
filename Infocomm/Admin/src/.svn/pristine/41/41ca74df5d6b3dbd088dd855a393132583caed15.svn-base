package com.info.cms.action;

import com.info.cms.facade.ReferenceData;
import com.info.cms.facade.SysAuthorityFacade;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeResult;
import com.info.cms.presentation.entity.PeUsers;
import com.info.wifi.cms.entity.AuditLog;
import com.info.wifi.cms.entity.SysAuthorities;
import com.info.wifi.cms.util.SqlResult;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public final class SysAuthorityAction extends MyActionSupport
        implements ModelDriven<PeUsers>, IOperations {

    private PeUsers peUsers = new PeUsers();

    public SysAuthorityAction() {
        super();
        initialize();
    }

    @Override
    public void initialize() {

        peUsers.setCreatedBy(currentUser.getUsername());
        peUsers.setPeStatusList(ReferenceData.getStatusList());
        getSelected();

    }

    @Override
    public void validateSearchInput() {
    }

    @Override
    public String search() {
        try {
            validateSearchInput();
            SqlResult result = new SysAuthorityFacade().search(peUsers);
            peUsers.setSearchResult(result.getData().toString());
            if (result.isStatus() == false) {
                List messagePerameter = new ArrayList();
                messagePerameter.add(result.getCount());
                addActionMessage(getText("I_USR08", messagePerameter));
            }
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(peUsers.getAuthority())) {
            addFieldError("authority", getText("E_CE11"));
        }
        if (StringHelper.isNullOrEmpty(peUsers.getTitle())) {
            addFieldError("title", getText("E_CE13"));
        }
        if (StringHelper.isNullOrEmpty(peUsers.getDescription())) {
            addFieldError("description", getText("E_CE12"));
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                SysAuthorityFacade facade = new SysAuthorityFacade();
                if (facade.save(peUsers)) {
                    AuditLog auditLog = new AuditLog();
                    auditLog.setAction(UIConstants.OPERATION.ADD.value);
                    auditLog.setRecordId(new BigInteger("0"));
                    auditLog.setComponent(this.getClass().getSimpleName());
                    List messagePerameter = new ArrayList();
                    messagePerameter.add(peUsers.getAuthority());
                    messagePerameter.add(currentUser.getUsername());
                    String auditMessage = getText("A_SE01", messagePerameter);
                    addActionMessage(auditMessage);
                    auditLog.setMessage(auditMessage);
                    auditLog.setAdvAgencyId((ADV_AGENCY_ID));
                    saveAuditLog(auditLog);
                    peUsers.resetFields();
                    return FORWARD;

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

        if (StringHelper.isNullOrEmpty(peUsers.getTitle())) {
            addFieldError("title", getText("E_CE13"));
        }
        if (StringHelper.isNullOrEmpty(peUsers.getDescription())) {
            addFieldError("description", getText("E_CE12"));
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {
                SysAuthorityFacade facade = new SysAuthorityFacade();
                PeResult result = facade.edit(peUsers);
                if (result.getStatus()) {
                    addActionMessage(getText("I_VE01"));
                    SysAuthorities oldSysAuthority = (SysAuthorities) result.getData();
                    AuditLog auditLog = new AuditLog();
                    auditLog.setAction(UIConstants.OPERATION.ADD.value);
                    auditLog.setRecordId(new BigInteger(peUsers.getAuthority_id()));
                    auditLog.setComponent(this.getClass().getSimpleName());
                    auditLog.setPreviousData(StringHelper.getXMLFromObject(oldSysAuthority));
                    List messagePerameter = new ArrayList();
                    messagePerameter.add(oldSysAuthority.getAuthority());
                    messagePerameter.add(currentUser.getUsername());
                    auditLog.setMessage(getText("A_VE03", messagePerameter));
                    auditLog.setAdvAgencyId((ADV_AGENCY_ID));
                    saveAuditLog(auditLog);
                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    /**
     * @return the peUsers
     */
    public PeUsers getPeUsers() {
        return peUsers;
    }

    /**
     * @param peUsers the peUsers to set
     */
    public void setPeUsers(PeUsers peUsers) {
        this.peUsers = peUsers;
    }

    @Override
    public PeUsers getModel() {
        return getPeUsers();
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                peUsers.setAuthority_id(id);
                new SysAuthorityFacade().getSelectedAuthority(peUsers);
                peUsers.setAuthority_id(id);
            }
        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
}
