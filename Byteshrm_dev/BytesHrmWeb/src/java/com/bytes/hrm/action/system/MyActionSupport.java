/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.action.system;

import com.bytes.hrm.dao.entity.SysUser;
import com.bytes.hrm.dto.system.AuditLogDto;

import com.bytes.hrm.dto.common.RefDto;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author SALEEM
 */
public class MyActionSupport extends ActionSupport {

    /**
     * @return the refDto
     */
    public RefDto getRefDto() {
        return refDto;
    }

    /**
     * @param refDto the refDto to set
     */
    public void setRefDto(RefDto refDto) {
        this.refDto = refDto;
    }

    private RefDto refDto = new RefDto();
    Map session = ActionContext.getContext() != null ? ActionContext.getContext().getSession() : null;
    public SysUser currentUser = null;
    public String FORWARD = "forward";
    public String GLOBAL_ERROR = "GLOBAL_ERROR";
    private String CURRENT_AUTHORITY = "";
    public HttpServletRequest request = ActionContext.getContext() != null ? (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST) : null;
  
    public int ADV_AGENCY_ID = 0;
    public static final Logger LOG = Logger.getLogger(ActionSupport.class.getName());

    public MyActionSupport() {

        if (session != null && session.get("Users") != null) {
            currentUser = (SysUser) session.get("Users");
            CURRENT_AUTHORITY = currentUser.getUserAuthority();
            LOG.info(currentUser.getUsername());
        } else {
            currentUser = new SysUser();
        }
        //Set Static Data
        refDto.initializeReferenceData();

        //
    }

    public void saveAuditLog(AuditLogDto auditLog) {
        try {
            LOG.info("Entering into save Method:Refereshin CACHE");
            //ReferenceData.refereshCache("All");
            /* logger.info("CACHE referesh successfully:");
            SysUsersFacade facade = new SysUsersFacade();
            auditLog.setActionOn(DateHelper.getCurrentDate());
            auditLog.setActionBy(currentUser.getUsername());
            facade.saveAuditLog(auditLog);*/
        } catch (Exception ex) {
            // saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);
        }

    }

    public void saveException(String component, Exception ex) {

        addActionError("Critical Error:" + ex.getMessage());
        /* SysErrorLog object = new SysErrorLog();
        object.setComponent(component);
        object.setCreatedOn(DateHelper.getCurrentDate());
        object.setCreatedBy(currentUser.getUsername());
        object.setDescription(ex == null ? "" : ex.toString());
        object.setMessage(ex == null ? "" : ex.getMessage());
        object.setLocalizedMessage(ex == null ? "" : ex.getLocalizedMessage());
        new SysErrorLogJpaController().create(object);
        addActionError("Critical Error:" + object.getMessage());
        logger.log(Level.SEVERE, component, ex);*/

    }

    public boolean isValidInput() {

        if (getFieldErrors().size() <= 0 && getActionMessages().size() <= 0
                && getActionErrors().size() <= 0) {
            return true;
        }
        return false;

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
