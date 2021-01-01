package com.info.cms.action;

import com.info.cms.facade.ReferenceData;
import com.info.cms.facade.SysUsersFacade;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.StringHelper;
import com.info.cms.helper.UIConstants;
import com.info.cms.presentation.entity.PeResult;
import com.info.cms.presentation.entity.PeUsers;
import com.info.wifi.cms.entity.AuditLog;
import com.info.wifi.cms.entity.SysAuthorities;
import com.info.wifi.cms.entity.SysUsers;
import com.info.wifi.cms.entity.controller.SysUsersJpaController;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

public final class SysUsersAccountAction extends MyActionSupport
        implements ModelDriven<PeUsers>, IOperations {

    private PeUsers peUsers = new PeUsers(null, ADV_AGENCY_ID);

    public SysUsersAccountAction() {
        super();
        initialize();
    }

    @Override
    public void initialize() {

        peUsers.setModifiedBy(currentUser.getUsername());
        peUsers.setCreatedBy(currentUser.getUsername());
        peUsers.setPeStatusList(ReferenceData.getStatusList());
        peUsers.setReportFilterName("");
        peUsers.setToDate(DateHelper.gePreviousMonthDate(-3));
        peUsers.initializeReport();

        if (getCURRENT_AUTHORITY().equals(UIConstants.ADVERTISER_AUTHORITY)) {
            List<SysAuthorities> list = new ArrayList<SysAuthorities>();
            list.add(ReferenceData.getAllAuthority(getCURRENT_AUTHORITY()));
            peUsers.setAuthorityList(list);

        } else {

            peUsers.setAuthorityList(ReferenceData.getAllAuthorities());
        }

    }

    @Override
    public void validateSearchInput() {
    }

    @Override
    public String search() {
        try {

            new SysUsersFacade().searchUsers(peUsers, currentUser);

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String userLoginLogoutHistory() {
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (peUsers.getAuthority().equals(UIConstants.ADVERTISER_AUTHORITY)
                && StringHelper.isNullOrEmpty(peUsers.getOwnerName())) {
            addFieldError("reseller", getText("E_G76"));
        }

        if (!peUsers.getAuthority().equals(UIConstants.ADVERTISER_AUTHORITY)) {
            peUsers.setAdvAgencyId(null);

        }

        if (peUsers.getAuthority().equals("-1")) {
            addFieldError("role", getText("E_G01"));
        }

        if (!StringHelper.isValidEmail(peUsers.getEmail())) {
            addFieldError("email", getText("E_G02"));

        }
        if (StringHelper.isNullOrEmpty(peUsers.getUsername()) || peUsers.getUsername().length() < 4) {
            addFieldError("username", getText("E_G03"));

        }

        if (StringHelper.isNullOrEmpty(peUsers.getUserFullName())) {
            addFieldError("userFullName", getText("E_G35"));

        }
        if (StringHelper.isNullOrEmpty(peUsers.getPassword())) {
            addFieldError("password", getText("E_G47"));
        }
        if (StringHelper.isNullOrEmpty(peUsers.getRePassword())) {
            addFieldError("rePassword", getText("E_G28"));
        } else if (!Pattern.matches(UIConstants.REGULAR_EXP.PASSWORD_EXP.value, peUsers.getPassword())) {
            addActionError(getText("E_G54"));

        } else if (!peUsers.getRePassword().equals(peUsers.getPassword())) {
            addActionError(getText("E_G48"));
        } else if (new SysUsersJpaController().findSysUsers(peUsers.getUsername()) != null) {
            addActionError(getText("E_G45"));
        }
        try {
            Date date = DateHelper.INPUT_DATETIME_FORMAT_DAY_END(peUsers.getToDate());
            boolean result = DateHelper.isGreaterToCurrentDate(date);
            logger.info("result:" + result);
            if (result == false) {
                addFieldError("todate", getText("E_G58"));
            }

        } catch (Exception ex) {
            addFieldError("todate", getText("E_G58"));
            logger.info("Error in parsing Date:" + ex.getMessage());
        }

    }

    @Override
    public String save() {

        try {
            validateSaveInput();
            if (getFieldErrors().size() <= 0 && getActionMessages().size()
                    <= 0 && getActionErrors().size() <= 0) {
                SysUsersFacade facade = new SysUsersFacade();
                if (facade.saveUser(peUsers)) {
                    addActionMessage(getText("I_USR06"));
                    AuditLog auditLog = new AuditLog();
                    auditLog.setAction(UIConstants.OPERATION.ADD.value);
                    auditLog.setRecordId(new BigInteger("0"));
                    auditLog.setComponent(this.getClass().getSimpleName());
                    List messagePerameter = new ArrayList();
                    messagePerameter.add(currentUser.getUsername());
                    messagePerameter.add(currentUser.getUsername());
                    auditLog.setMessage(getText("A_SE02", messagePerameter));
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

    public String getSelectedUser() {

        new SysUsersFacade().setSelectedUser(request.getParameter("username"), peUsers);
        return SUCCESS;
    }

    public String changePassword() {

        try {

            validateChangePassword();
            if (getFieldErrors().size() <= 0 && getActionMessages().size()
                    <= 0 && getActionErrors().size() <= 0) {

                SysUsers sysUsersOld = new SysUsersFacade().getUserByName(currentUser.getUsername());
                SysUsers sysUsers = new SysUsers();
                sysUsers.setUsername(currentUser.getUsername());
                sysUsers.setModifiedBy(currentUser.getUsername());
                sysUsers.setDateModified(DateHelper.getCurrentDate());
                //sysUsers.setPassword(StringHelper.paasordEncodeMD5(peUsers.getPassword(), ReferenceData.getSetting("SYS_USER_PASSWORD_ENCRIPTION").getSystemValue()));
                sysUsers.setPassword(peUsers.getPassword());
                sysUsers.setIsEncripted("N");//ReferenceData.getSetting("SYS_USER_PASSWORD_ENCRIPTION").getSystemValue());
                new SysUsersJpaController().changePassword(sysUsers);
                addActionMessage(getText("I_USR02"));
                AuditLog auditLog = new AuditLog();
                auditLog.setAction(UIConstants.OPERATION.CHANGE_PASSWORD.value);
                auditLog.setComponent(this.getClass().getSimpleName());
                auditLog.setRecordId(new BigInteger("0"));
                auditLog.setPreviousData(StringHelper.getXMLFromObject(sysUsersOld));
                List messagePerameter = new ArrayList();
                messagePerameter.add(currentUser.getUsername());
                messagePerameter.add(currentUser.getUsername());
                auditLog.setMessage(getText("A_SE03", messagePerameter));
                auditLog.setAdvAgencyId((ADV_AGENCY_ID));
                saveAuditLog(auditLog);

            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    private void validateChangePassword() {
        SysUsers sysUsersOld = new SysUsersFacade().getUserByName(currentUser.getUsername());
        if (StringHelper.isNullOrEmpty(peUsers.getOldPassword())) {
            addFieldError("oldPassword", getText("E_G27"));

        }
        if (StringHelper.isNullOrEmpty(peUsers.getRePassword())) {
            addFieldError("rePassword", getText("E_G28"));
        }
        if (StringHelper.isNullOrEmpty(peUsers.getPassword())) {
            addFieldError("password", getText("E_G47"));

        } else {

            if (!peUsers.getRePassword().equals(peUsers.getPassword())) {
                addActionMessage(getText("E_G29"));

            }
            if (!Pattern.matches(UIConstants.REGULAR_EXP.PASSWORD_EXP.value, peUsers.getPassword())) {
                addActionMessage(getText("E_G54"));

            }
            if (!currentUser.getPassword().equals(peUsers.getOldPassword())) {
                // if (!currentUser.getPassword().equals(StringHelper.paasordEncodeMD5(peUsers.getOldPassword(), sysUsersOld.getIsEncripted()))) {
                addActionMessage(getText("E_G31"));

            }
        }

    }

    @Override
    public void validateEditInput() {

        if (peUsers.getAuthority().equals(UIConstants.ADVERTISER_AUTHORITY)
                && StringHelper.isNullOrEmpty(peUsers.getOwnerName())) {
            addFieldError("reseller", getText("E_G76"));
        }

        if (!peUsers.getAuthority().equals(UIConstants.ADVERTISER_AUTHORITY)) {
            peUsers.setAdvAgencyId(null);

        }

        if (peUsers.getAuthority().equals("-1")) {
            addFieldError("role", getText("E_G01"));
        }

        if (!StringHelper.isValidEmail(peUsers.getEmail())) {
            addFieldError("email", getText("E_G02"));

        }

        if (StringHelper.isNullOrEmpty(peUsers.getUserFullName())) {
            addFieldError("userFullName", getText("E_G35"));

        }
        try {
            Date date = DateHelper.INPUT_DATETIME_FORMAT_DAY_END(peUsers.getToDate());
            boolean result = DateHelper.isGreaterToCurrentDate(date);
            logger.info("result:" + result);
            if (result == false) {
                addFieldError("todate", getText("E_G58"));
            }

        } catch (Exception ex) {
            addFieldError("todate", getText("E_G58"));
            logger.info("Error in parsing Date:" + ex.getMessage());
        }

    }

    @Override
    public String edit() {

        try {

            validateEditInput();
            if (isValidInput()) {
                peUsers.setModifiedBy(currentUser.getUsername());
                PeResult result = new PeResult();
                result.setData(new SysUsersFacade().getUserByName((peUsers.getUsername())));
                new SysUsersFacade().editSysUser(peUsers);
                addActionMessage(getText("I_USR07"));
                AuditLog auditLog = new AuditLog();
                auditLog.setAction(UIConstants.OPERATION.UPDATE.value);
                auditLog.setRecordId(new BigInteger("0"));
                auditLog.setComponent(this.getClass().getSimpleName());
                auditLog.setPreviousData(StringHelper.getXMLFromObject(result.getData()));
                List messagePerameter = new ArrayList();
                messagePerameter.add(peUsers.getUsername());
                messagePerameter.add(currentUser.getUsername());
                auditLog.setMessage(getText("A_SE04", messagePerameter));
                auditLog.setAdvAgencyId((ADV_AGENCY_ID));
                saveAuditLog(auditLog);
                peUsers.resetFields();
                return FORWARD;
            }

        } catch (Exception ex) {
            return saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    private SysUsers validateResetPassword() {

        SysUsers user = null;
        if (StringHelper.isNullOrEmpty(peUsers.getUsername())) {
            addFieldError("username", getText("E_G03"));
        } else {

            SysUsersJpaController controller = new SysUsersJpaController();
            user = controller.findSysUsers(peUsers.getUsername());
            if (user == null) {
                addActionMessage(getText("I_USR04"));
            }

        }
        if (StringHelper.isNullOrEmpty(peUsers.getPassword())) {
            addFieldError("password", getText("E_G28"));
        } else if (!Pattern.matches(UIConstants.REGULAR_EXP.PASSWORD_EXP.value, peUsers.getPassword())) {
            addFieldError("password", getText("E_G54"));

        }

        return user;
    }

    public String reSetPassword() {
        try {
            SysUsers user = validateResetPassword();
            if (isValidInput()) {
                // user.setPassword(StringHelper.paasordEncodeMD5(peUsers.getPassword(), ReferenceData.getSetting("SYS_USER_PASSWORD_ENCRIPTION").getSystemValue()));
                user.setPassword(peUsers.getPassword());
                user.setDateModified(new Date());
                user.setIsEncripted("N");//ReferenceData.getSetting("SYS_USER_PASSWORD_ENCRIPTION").getSystemValue());
                user.setModifiedBy(currentUser.getUsername());
                PeResult result = new PeResult();
                result.setData(user);
                //result.setId(user.);
                user = new SysUsersJpaController().changePassword(user);
                List perameter = new ArrayList();
                perameter.add(peUsers.getUsername());
                perameter.add(currentUser.getUsername());
                addActionMessage(getText("I_USR05", perameter));
                AuditLog auditLog = new AuditLog();
                auditLog.setAction(UIConstants.OPERATION.CHANGE_PASSWORD.value);
                auditLog.setComponent(this.getClass().getSimpleName());
                auditLog.setRecordId(new BigInteger("0"));
                auditLog.setPreviousData(StringHelper.getXMLFromObject(result.getData()));
                auditLog.setMessage(getText("A_SE05", perameter));
                auditLog.setAdvAgencyId((ADV_AGENCY_ID));
                saveAuditLog(auditLog);

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
