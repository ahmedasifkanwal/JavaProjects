package com.bytes.hrm.action.job;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.job.JobTitleDto;
import com.bytes.hrm.service.job.JobTitleService;
import com.bytes.hrm.service.job.JobTitleServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class JobTitleAction extends MyActionSupport implements MyOperation,
         ModelDriven<JobTitleDto> {

    private JobTitleDto jobTitleDto = new JobTitleDto();
    JobTitleService jobTitleService = new JobTitleServiceImpl();

    public JobTitleAction() {

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
            jobTitleDto.setJobTitleList(jobTitleService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(jobTitleDto.getJobTitle().getJobTitle())) {
            addFieldError("jobTitle", "Job Title Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (jobTitleService.create(jobTitleDto.getJobTitle()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError(ex.getMessage());
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }finally
        {
          new RefDto().resetReferenceData(jobTitleDto.getJobTitle().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(jobTitleDto.getJobTitle().getJobTitle())) {
            addFieldError("jobTitle", "Job Title Required.");
        }

        if (jobTitleDto.getJobTitle().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (jobTitleService.update(jobTitleDto.getJobTitle()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
           addActionError(ex.getMessage());
        }finally
        {
          new RefDto().resetReferenceData(jobTitleDto.getJobTitle().getClass());
        }
        return SUCCESS;
    }

    @Override
    public JobTitleDto getModel() {
        return this.jobTitleDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                jobTitleDto.setJobTitle(jobTitleService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the jobTitleDto
     */
    public JobTitleDto getJobTitleDto() {
        return jobTitleDto;
    }

    /**
     * @param jobTitleDto the jobTitleDto to set
     */
    public void setJobTitleDto(JobTitleDto jobTitleDto) {
        this.jobTitleDto = jobTitleDto;
    }
}
