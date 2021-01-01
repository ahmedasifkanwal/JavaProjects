package com.bytes.hrm.action.recruitment;

import com.bytes.hrm.action.job.*;
import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.recruitment.JobVacancyDto;
import com.bytes.hrm.service.recruitment.JobVacancyService;
import com.bytes.hrm.service.recruitment.JobVacancyServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class JobVacancyAction extends MyActionSupport implements MyOperation,
         ModelDriven<JobVacancyDto> {

    private JobVacancyDto jobVacancyDto = new JobVacancyDto();
    JobVacancyService jobVacancyService = new JobVacancyServiceImpl();

    public JobVacancyAction() {

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
            jobVacancyDto.setJobVacancyList(jobVacancyService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(jobVacancyDto.getJobVacancy().getName())) {
            addFieldError("jobVacancy", "Job Vacancy Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (jobVacancyService.create(jobVacancyDto.getJobVacancy()) != null) {
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
          new RefDto().resetReferenceData(jobVacancyDto.getJobVacancy().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(jobVacancyDto.getJobVacancy().getName())) {
            addFieldError("jobVacancy", "Job Title Required.");
        }

        if (jobVacancyDto.getJobVacancy().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (jobVacancyService.update(jobVacancyDto.getJobVacancy()) != null) {

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
          new RefDto().resetReferenceData(jobVacancyDto.getJobVacancy().getClass());
        }
        return SUCCESS;
    }

    @Override
    public JobVacancyDto getModel() {
        return this.jobVacancyDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                jobVacancyDto.setJobVacancy(jobVacancyService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the jobVacancyDto
     */
    public JobVacancyDto getJobVacancyDto() {
        return jobVacancyDto;
    }

    /**
     * @param jobVacancyDto the jobVacancyDto to set
     */
    public void setJobVacancyDto(JobVacancyDto jobVacancyDto) {
        this.jobVacancyDto = jobVacancyDto;
    }
}
