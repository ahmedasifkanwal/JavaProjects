package com.bytes.hrm.action.leave;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.common.helper.DateHelper;
import static com.bytes.hrm.common.helper.DateHelper.getCurrentDate;
import com.bytes.hrm.dao.entity.Employee;


import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.leave.LeaveEntitlementDto;
import com.bytes.hrm.service.leave.LeaveEntitlementService;
import com.bytes.hrm.service.leave.LeaveEntitlementServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class LeaveEntitlementAction extends MyActionSupport implements MyOperation,
        ModelDriven<LeaveEntitlementDto> {

    private LeaveEntitlementDto leaveEntitlementDto = new LeaveEntitlementDto();
    LeaveEntitlementService leaveEntitlementService = new LeaveEntitlementServiceImpl();

    public LeaveEntitlementAction() {

        initialize();
    }

    @Override
    public void initialize() {
        
        String startDate ="01-01-"+ DateHelper.getCurrentYear();
        String endDate ="31-12-"+ DateHelper.getCurrentYear();

        leaveEntitlementDto.getLeaveEntitlement().setFromDate(DateHelper.getFormatString(startDate));
        leaveEntitlementDto.getLeaveEntitlement().setToDate(DateHelper.getFormatString(endDate));
    }

    @Override
    public void validateSearchInput() {
    }

    @Override
    public String search() {
        try {
            leaveEntitlementDto.setLeaveEntitlementList(leaveEntitlementService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {

        if (leaveEntitlementDto.getLeaveEntitlement().getEmpNumber() == null
                || leaveEntitlementDto.getLeaveEntitlement().getEmpNumber().getEmpNumber() == null
                || leaveEntitlementDto.getLeaveEntitlement().getEmpNumber().getEmpNumber() == 0) {
            addFieldError("empNumber", "Employee# Required.");
        }
        if (leaveEntitlementDto.getLeaveEntitlement().getEntitlementType() == null
                || leaveEntitlementDto.getLeaveEntitlement().getEntitlementType().getId() == null
                || leaveEntitlementDto.getLeaveEntitlement().getEntitlementType().getId() == 0) {
            addFieldError("leaveTypeId", "Leave Type Required.");
        }

        if (leaveEntitlementDto.getLeaveEntitlement().getLeaveTypeId() == null
                || leaveEntitlementDto.getLeaveEntitlement().getLeaveTypeId().getId() == null
                || leaveEntitlementDto.getLeaveEntitlement().getLeaveTypeId().getId() == 0) {
            addFieldError("entitlement", "Entitlement Required.");
        }

        if (null == leaveEntitlementDto.getLeaveEntitlement().getFromDate()) {
            addFieldError("fromDate", "From Date  Required.");
        }
        if (null == leaveEntitlementDto.getLeaveEntitlement().getToDate()) {
            addFieldError("toDate", "To Date Required.");
        }
        
        if(leaveEntitlementDto.getLeaveEntitlement().getFromDate().after(leaveEntitlementDto.getLeaveEntitlement().getToDate())){
                addFieldError("fromDate", "Enter a valid date range.");
        }
        
        if (null == leaveEntitlementDto.getLeaveEntitlement().getToDate()) {
            addFieldError("toDate", "From Date Required.");
        }
                
        if (null == leaveEntitlementDto.getLeaveEntitlement().getNoOfDays()) {
            addFieldError("toDate", "No. of days Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                String empName = currentUser.getUserFullName();
//                Employee employee = new Employee();
//                employee.setEmpNumber(currentUser.getEmpNumber());
//                    leaveEntitlementDto.getLeaveEntitlement().getCreatedById().setEmpNumber(employee);
                leaveEntitlementDto.getLeaveEntitlement().setCreatedByName(empName);
                if (leaveEntitlementService.create(leaveEntitlementDto.getLeaveEntitlement()) != null) {
                        return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            new RefDto().resetReferenceData(leaveEntitlementDto.getLeaveEntitlement().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(leaveEntitlementDto.getLeaveEntitlement().getCreatedByName())) {
            addFieldError("leaveEntitlement", "Leave Entitlement Required.");
        }

        if (leaveEntitlementDto.getLeaveEntitlement().getId() == 0) {
            addActionError("Leave Entitlement Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (leaveEntitlementService.update(leaveEntitlementDto.getLeaveEntitlement()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            new RefDto().resetReferenceData(leaveEntitlementDto.getLeaveEntitlement().getClass());
        }
        return SUCCESS;
    }

    @Override
    public LeaveEntitlementDto getModel() {
        return this.leaveEntitlementDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("leaveEntitlement.id"))) {
                String id = (request.getParameter("leaveEntitlement.id"));
                leaveEntitlementDto.setLeaveEntitlement(leaveEntitlementService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the leaveEntitlementDto
     */
    public LeaveEntitlementDto getLeaveEntitlementDto() {
        return leaveEntitlementDto;
    }

    /**
     * @param leaveEntitlementDto the leaveEntitlementDto to set
     */
    public void setLeaveEntitlementDto(LeaveEntitlementDto leaveEntitlementDto) {
        this.leaveEntitlementDto = leaveEntitlementDto;
    }
}
