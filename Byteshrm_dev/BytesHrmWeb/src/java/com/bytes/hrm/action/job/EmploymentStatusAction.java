package com.bytes.hrm.action.job;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.job.EmploymentStatusDto;
import com.bytes.hrm.service.job.EmploymentStatusService;
import com.bytes.hrm.service.job.EmploymentStatusServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmploymentStatusAction extends MyActionSupport implements MyOperation,
         ModelDriven<EmploymentStatusDto> {

    private EmploymentStatusDto employmentStatusDto = new EmploymentStatusDto();
    EmploymentStatusService employmentStatusService = new EmploymentStatusServiceImpl();

    public EmploymentStatusAction() {

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
            employmentStatusDto.setEmploymentStatusList(employmentStatusService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(employmentStatusDto.getEmploymentStatus().getName())) {
            addFieldError("name", "Employee Status Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (employmentStatusService.create(employmentStatusDto.getEmploymentStatus()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
         if (StringHelper.isNullOrEmpty(employmentStatusDto.getEmploymentStatus().getName())) {
            addFieldError("name", "Employee Status Required.");
        }

        if (employmentStatusDto.getEmploymentStatus().getId() == 0) {
            addActionError("Employee Status Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (employmentStatusService.update(employmentStatusDto.getEmploymentStatus()) != null) {

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
    public EmploymentStatusDto getModel() {
        return this.employmentStatusDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                employmentStatusDto.setEmploymentStatus(employmentStatusService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the employmentStatusDto
     */
    public EmploymentStatusDto getEmploymentStatusDto() {
        return employmentStatusDto;
    }

    /**
     * @param employmentStatusDto the employmentStatusDto to set
     */
    public void setEmploymentStatusDto(EmploymentStatusDto employmentStatusDto) {
        this.employmentStatusDto = employmentStatusDto;
    }
}
