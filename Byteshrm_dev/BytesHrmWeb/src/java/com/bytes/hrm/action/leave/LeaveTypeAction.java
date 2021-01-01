package com.bytes.hrm.action.leave;



import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;


import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.leave.LeaveTypeDto;
import com.bytes.hrm.service.leave.LeaveTypeService;
import com.bytes.hrm.service.leave.LeaveStatusServiceImpl;
import com.bytes.hrm.service.leave.LeaveTypeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class LeaveTypeAction extends MyActionSupport implements MyOperation,
         ModelDriven<LeaveTypeDto> {

    private LeaveTypeDto leaveTypeDto = new LeaveTypeDto();
   LeaveTypeService leaveTypeService = new LeaveTypeServiceImpl();

    public LeaveTypeAction() {

        initialize();
    }

    @Override
    public void initialize() {
       
    }

    @Override
    public void validateSearchInput() {
    }

    @Override
    public String search() {
        try {
            leaveTypeDto.setLeaveTypeList(leaveTypeService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(leaveTypeDto.getLeaveType().getName())) {
            addFieldError("leaveType", "Leave Type Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (leaveTypeService.create(leaveTypeDto.getLeaveType()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }finally
        {
          new RefDto().resetReferenceData(leaveTypeDto.getLeaveType().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(leaveTypeDto.getLeaveType().getName())) {
            addFieldError("leaveType", "Leave Type Required.");
        }
      

        if (leaveTypeDto.getLeaveType().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (leaveTypeService.update(leaveTypeDto.getLeaveType()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }finally
        {
          new RefDto().resetReferenceData(leaveTypeDto.getLeaveType().getClass());
        }
        return SUCCESS;
    }

    @Override
    public LeaveTypeDto getModel() {
        return this.leaveTypeDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                leaveTypeDto.setLeaveType(leaveTypeService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the leaveTypeDto
     */
    public LeaveTypeDto getLeaveTypeDto() {
        return leaveTypeDto;
    }

    /**
     * @param leaveTypeDto the leaveTypeDto to set
     */
    public void setLeaveTypeDto(LeaveTypeDto leaveTypeDto) {
        this.leaveTypeDto = leaveTypeDto;
    }
}
