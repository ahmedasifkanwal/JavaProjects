package com.bytes.hrm.action.system;

import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.common.helper.DateHelper;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.system.SysUserDto;
import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;
import com.bytes.hrm.service.system.SysUserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigDecimal;
import java.util.logging.Logger;
import com.bytes.hrm.service.system.SysUserService;

public final class SysUsersAction extends MyActionSupport
        implements ModelDriven<SysUserDto> {

    static final Logger LOG = Logger.getLogger(ActionSupport.class.getName());
    private SysUserDto sysUserDto = new SysUserDto();
    SysUserService sysUserService = new SysUserServiceImpl();

    public SysUsersAction() {

        initialize();
    }

    public void initialize() {

        getSelected();

    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            sysUserDto.setSysUserList(sysUserService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {

        if (StringHelper.isNullOrEmpty(sysUserDto.getSysUser().getUsername())) {

            addFieldError("username", getText("e.username.req"));
        }
        if (StringHelper.isNullOrEmpty(sysUserDto.getSysUser().getPassword())) {
            addFieldError("password", getText("e.userpassword.req"));
        }
        if (StringHelper.isNullOrEmpty(sysUserDto.getSysUser().getUserAuthority())) {
            addFieldError("authority", getText("e.user.role.req"));
        }

        if (StringHelper.isNullOrEmpty(sysUserDto.getEmployeeId())) {
            addFieldError("employeeId", "Employee ID is required.");

        } else {
            Employee emplo = new EmployeeServiceImpl().getEmployee(sysUserDto.getEmployeeId());

            if (emplo == null) {
                addFieldError("employeeId", "Employee not found, please try other employee id.");
            } else {
                sysUserDto.getSysUser().setEmpNumber(emplo.getEmpNumber());
            }

        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                LOG.info("validateSaveInputssssssssssssssssssssssssssssssssss" + sysUserDto.getEmployeeId());
                sysUserDto.getSysUser().setCreatedBy(currentUser.getUsername());
                sysUserDto.getSysUser().setCreatedBy(currentUser.getUsername());
                sysUserDto.getSysUser().setDateCreated(DateHelper.getCurrentDate());
                sysUserDto.getSysUser().setStatus("A");
                sysUserDto.getSysUser().setLastLoginDate(DateHelper.getCurrentDate());
                sysUserDto.getSysUser().setDateModified(DateHelper.getCurrentDate());
                sysUserDto.getSysUser().setExpiryDate(DateHelper.getDateAfterMonth(6));
                sysUserDto.getSysUser().setIsEncripted("N");

                LOG.info(sysUserDto.getSysUser().getEmpNumber() + "ddddddddddddddddddd");
                LOG.info(sysUserDto.getEmployeeId() + "ddddddddddddddddddd");

                if (sysUserService.create(sysUserDto.getSysUser()) != null) {
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
            addActionError("save not completed." + ex);
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public void validateEditInput() {

    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                sysUserDto.getSysUser().setCreatedBy(currentUser.getUsername());
                sysUserDto.getSysUser().setDateCreated(DateHelper.getCurrentDate());
                //  sysUserDto.getSysUser().setStatus("A");
                sysUserDto.getSysUser().setLastLoginDate(DateHelper.getCurrentDate());
                sysUserDto.getSysUser().setDateModified(DateHelper.getCurrentDate());
                sysUserDto.getSysUser().setExpiryDate(DateHelper.getDateAfterMonth(6));
                sysUserDto.getSysUser().setIsEncripted("N");

                if (sysUserService.update(sysUserDto.getSysUser()) != null) {

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
    public SysUserDto getModel() {
        return this.sysUserDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                sysUserDto.setSysUser(sysUserService.find(new BigDecimal(id)));

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
     * @return the sysUserDto
     */
    public SysUserDto getSysUserDto() {
        return sysUserDto;
    }

    /**
     * @param sysUserDto the sysUserDto to set
     */
    public void setSysUserDto(SysUserDto sysUserDto) {
        this.sysUserDto = sysUserDto;
    }

    public String setApplication() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("mode"))) {

                if (request.getParameter("mode").equals("Harmony")) {
                    session.put("Application", "Harmony");
                    session.put("MenuItem", null);
                    return "Harmony";
                } else if (request.getParameter("mode").equals("Amanat")) {
                    session.put("Application", "Amanat");
                    session.put("MenuItem", null);
                    return "Amanat";
                } else if (request.getParameter("mode").equals("Payroll")) {
                    session.put("Application", "Payroll");
                    session.put("MenuItem", null);
                    return "Payroll";
                } else {
                    session.put("Application", "Harmony");
                    session.put("MenuItem", null);
                    return "Harmony";
                }

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return request.getParameter("mode");
    }
}
