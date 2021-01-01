package com.bytes.hrm.action.job;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.job.JobCategoryDto;
import com.bytes.hrm.service.job.JobCategoryService;
import com.bytes.hrm.service.job.JobCategoryServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class JobCategoryAction extends MyActionSupport implements MyOperation,
         ModelDriven<JobCategoryDto> {

    private JobCategoryDto jobCategoryDto = new JobCategoryDto();
    JobCategoryService jobCategoryService = new JobCategoryServiceImpl();

    public JobCategoryAction() {

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
            jobCategoryDto.setJobCategoryList(jobCategoryService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(jobCategoryDto.getJobCategory().getName())) {
            addFieldError("name", "Job Category Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (jobCategoryService.create(jobCategoryDto.getJobCategory()) != null) {
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
        if (StringHelper.isNullOrEmpty(jobCategoryDto.getJobCategory().getName())) {
            addFieldError("name", "Job Category Required.");
        }

        if (jobCategoryDto.getJobCategory().getId() == 0) {
            addActionError("Job Category Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (jobCategoryService.update(jobCategoryDto.getJobCategory()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public JobCategoryDto getModel() {
        return this.jobCategoryDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                jobCategoryDto.setJobCategory(jobCategoryService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
           saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the jobCategoryDto
     */
    public JobCategoryDto getJobCategoryDto() {
        return jobCategoryDto;
    }

    /**
     * @param jobCategoryDto the jobCategoryDto to set
     */
    public void setJobCategoryDto(JobCategoryDto jobCategoryDto) {
        this.jobCategoryDto = jobCategoryDto;
    }
}
