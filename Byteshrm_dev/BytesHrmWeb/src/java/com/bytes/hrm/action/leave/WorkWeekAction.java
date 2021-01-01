package com.bytes.hrm.action.leave;



import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;


import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.leave.WorkWeekDto;
import com.bytes.hrm.service.leave.WorkWeekService;
import com.bytes.hrm.service.leave.WorkWeekServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class WorkWeekAction extends MyActionSupport implements MyOperation,
         ModelDriven<WorkWeekDto> {

    private WorkWeekDto workWeekDto = new WorkWeekDto();
    WorkWeekService workWeekService = new WorkWeekServiceImpl();

    public WorkWeekAction() {
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
            workWeekDto.setWorkWeekList(workWeekService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (workWeekDto.getWorkWeek().getOperationalCountryId().getId() == 0) {
            addFieldError("workWeek", "Operational Country Required Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (workWeekService.create(workWeekDto.getWorkWeek()) != null) {
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
            System.out.println("HERE1");
          new RefDto().resetReferenceData(workWeekDto.getWorkWeek().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (workWeekDto.getWorkWeek().getOperationalCountryId().getId() == 0) {
            addFieldError("workWeek", "Operational Country Required Required.");
        }
      

        if (workWeekDto.getWorkWeek().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (workWeekService.update(workWeekDto.getWorkWeek()) != null) {

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
          new RefDto().resetReferenceData(workWeekDto.getWorkWeek().getClass());
        }
        return SUCCESS;
    }

    @Override
    public WorkWeekDto getModel() {
        return this.workWeekDto;
    }

    @Override
    public String getSelected() {
        System.out.println("GetSelected");
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                workWeekDto.setWorkWeek(workWeekService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the workWeekDto
     */
    public WorkWeekDto getWorkWeekDto() {
        return workWeekDto;
    }

    /**
     * @param workWeekDto the workWeekDto to set
     */
    public void setWorkWeekDto(WorkWeekDto workWeekDto) {
        this.workWeekDto = workWeekDto;
    }
}
