package com.bytes.hrm.action.system;

import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.system.SysAuthoritiesDto;
import com.bytes.hrm.service.system.SysAuthoritiesService;
import com.bytes.hrm.service.system.SysAuthoritiesServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigDecimal;
import java.util.logging.Logger;

public final class SysAuthorityAction extends MyActionSupport
        implements ModelDriven<SysAuthoritiesDto> {

    static final Logger LOG = Logger.getLogger(ActionSupport.class.getName());
    private SysAuthoritiesDto sysAuthoritiesDto = new SysAuthoritiesDto();
    SysAuthoritiesService roleService = new SysAuthoritiesServiceImpl();

    public SysAuthorityAction() {

        initialize();
    }

    public void initialize() {

        getSelected();

    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            sysAuthoritiesDto.setSysAuthoritiesList(roleService.findAllRole());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(sysAuthoritiesDto.getSysAuthoritiesVo().getAuthority())) {

            addFieldError("authority", getText("e.authority.req"));
        }
        if (StringHelper.isNullOrEmpty(sysAuthoritiesDto.getSysAuthoritiesVo().getParentAuthority())) {
            addFieldError("title", getText("e.title.req"));
        }
        if (StringHelper.isNullOrEmpty(sysAuthoritiesDto.getSysAuthoritiesVo().getDescription())) {
            addFieldError("description", getText("e.desc.req"));
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                sysAuthoritiesDto.getSysAuthoritiesVo().setCreatedBy(currentUser.getUsername());
                if (roleService.create(sysAuthoritiesDto.getSysAuthoritiesVo()) != null) {
                    /* AuditLog auditLog = new AuditLog();
                     auditLog.setAction(UIConstants.OPERATION.ADD.value);
                     auditLog.setRecordId(new BigInteger("0"));
                     auditLog.setComponent(this.getClass().getSimpleName());
                     List messagePerameter = new ArrayList();
                     messagePerameter.add(peUsers.getAuthority());
                     messagePerameter.add(currentUser.getUsername());
                     String auditMessage = getText("A_SE01", messagePerameter);
                     addActionMessage(auditMessage);
                     auditLog.setMessage(auditMessage);
                     auditLog.setAdvAgencyId(new BigDecimal(ADV_AGENCY_ID));
                     saveAuditLog(auditLog);
                     peUsers.resetFields();*/
                    return FORWARD;

                } else {
                    addActionError("There is technical issue,operation not completed.");

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public void validateEditInput() {

        if (StringHelper.isNullOrEmpty(sysAuthoritiesDto.getSysAuthoritiesVo().getParentAuthority())) {
            addFieldError("title", getText("e.title.req"));
        }
        if (StringHelper.isNullOrEmpty(sysAuthoritiesDto.getSysAuthoritiesVo().getDescription())) {
            addFieldError("description", getText("e.desc.req"));
        }

    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                sysAuthoritiesDto.getSysAuthoritiesVo().setCreatedBy(currentUser.getUsername());
                if (roleService.update(sysAuthoritiesDto.getSysAuthoritiesVo()) != null) {

                    /* addActionMessage(getText("I_VE01"));
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
                     auditLog.setAdvAgencyId(new BigDecimal(ADV_AGENCY_ID));
                     saveAuditLog(auditLog);*/
                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public SysAuthoritiesDto getModel() {
        return this.sysAuthoritiesDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("authority"))) {
                String authority = (request.getParameter("authority"));
                sysAuthoritiesDto.setSysAuthoritiesVo(roleService.findAuthority(authority));

                //  new SysAuthorityFacade().getSelectedAuthority(peUsers);
                //  peUsers.setAuthority_id(id);
            }
        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the sysAuthoritiesDto
     */
    public SysAuthoritiesDto getSysAuthoritiesDto() {
        return sysAuthoritiesDto;
    }

    /**
     * @param sysAuthoritiesDto the sysAuthoritiesDto to set
     */
    public void setSysAuthoritiesDto(SysAuthoritiesDto sysAuthoritiesDto) {
        this.sysAuthoritiesDto = sysAuthoritiesDto;
    }
}
