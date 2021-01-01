/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.action;

import com.info.cms.facade.ReferenceData;
import com.info.cms.facade.SysUsersFacade;
import com.info.cms.helper.DateHelper;
import com.info.cms.helper.StringHelper;
import com.info.wifi.cms.entity.AuditLog;
import com.info.wifi.cms.entity.SysErrorLog;
import com.info.wifi.cms.entity.SysUsers;
import com.info.wifi.cms.entity.controller.SysErrorLogJpaController;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author SALEEM
 */
public class MyActionSupport extends ActionSupport {

    Map session = ActionContext.getContext() != null ? ActionContext.getContext().getSession() : null;
    public SysUsers currentUser = null;
    public String FORWARD = "forward";
    public String GLOBAL_ERROR = "GLOBALERROR";
    private String CURRENT_AUTHORITY = "";
    public HttpServletRequest request = ActionContext.getContext() != null ? (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST) : null;
    public String ACTIVATE = "activate";
    public String REJECT = "reject";
    public String PRINT = "print";
    public String EDIT = "edit";
    public String SUCCESSBUSINESS = "successbusiness";
    public String ADV_AGENCY_ID = "";

    public MyActionSupport() {

        if (session != null && session.get("Users") != null) {
            currentUser = (SysUsers) session.get("Users");
            CURRENT_AUTHORITY = currentUser.getUserAuthority();
            if (!StringHelper.isNullOrEmpty(currentUser.getOwner())) {
                ADV_AGENCY_ID = currentUser.getOwner();

            }
            logger.info(currentUser.getUsername());
        } else {
            currentUser = new SysUsers();
        }

    }
    public static final Logger logger = Logger.getLogger(SysUsersAccountAction.class.getName());

    public void saveAuditLog(AuditLog auditLog) {
        try {
            logger.info("Entering into save Method:Refereshin CACHE");
            ReferenceData.refereshCache("All");
            logger.info("CACHE referesh successfully:");
            SysUsersFacade facade = new SysUsersFacade();
            auditLog.setActionOn(DateHelper.getCurrentDate());
            auditLog.setActionBy(currentUser.getUsername());
            facade.saveAuditLog(auditLog);
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }

    }

    public String saveException(String component, Exception ex) {
        SysErrorLog object = new SysErrorLog();
        object.setComponent(component);
        object.setCreatedOn(DateHelper.getCurrentDate());
        object.setCreatedBy(currentUser.getUsername());
        object.setDescription(ex == null ? "" : ex.toString());
        object.setMessage(ex == null ? "" : ex.getMessage());
        object.setLocalizedMessage(ex == null ? "" : ex.getLocalizedMessage());
        new SysErrorLogJpaController().create(object);
        addActionError("Critical Error:" + object.getMessage());
        logger.log(Level.SEVERE, component, ex);
        return GLOBAL_ERROR;
    }

    public boolean isValidInput() {

        if (getFieldErrors().size() <= 0 && getActionMessages().size() <= 0
                && getActionErrors().size() <= 0) {
            return true;
        }
        return false;

    }

    public String validateBetweenDate(String fromDate, String toDate) {

        if (StringHelper.isNullOrEmpty(fromDate)
                || StringHelper.isNullOrEmpty(toDate)) {
            addActionError(getText("info.fromdate.invalid.todate"));

        } else if (DateHelper.isFromGreaterToDate(fromDate, toDate)) {
            addActionError(getText("info.fromdate.greater.todate"));

        } else {

            return "'" + DateHelper.getSearchFormated(fromDate, DateHelper.DATE_TYPE.BEGIN)
                    + "' and '" + DateHelper.getSearchFormated(toDate, DateHelper.DATE_TYPE.END) + "'";

        }
        return "";

    }

    /**
     * @return the CURRENT_AUTHORITY
     */
    public String getCURRENT_AUTHORITY() {
        return CURRENT_AUTHORITY;
    }

    /**
     * @param CURRENT_AUTHORITY the CURRENT_AUTHORITY to set
     */
    public void setCURRENT_AUTHORITY(String CURRENT_AUTHORITY) {
        this.CURRENT_AUTHORITY = CURRENT_AUTHORITY;
    }

}
