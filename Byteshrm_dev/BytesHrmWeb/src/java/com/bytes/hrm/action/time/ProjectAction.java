package com.bytes.hrm.action.time;



import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;


import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.time.ProjectDto;
import com.bytes.hrm.service.time.ProjectService;
import com.bytes.hrm.service.time.ProjectServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class ProjectAction extends MyActionSupport implements MyOperation,
         ModelDriven<ProjectDto> {

    private ProjectDto projectDto = new ProjectDto();
   ProjectService projectService = new ProjectServiceImpl();

    public ProjectAction() {

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
            projectDto.setProjectList(projectService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
//        if (StringHelper.isNullOrEmpty(projectDto.getProject().getName())) {
//            addFieldError("project", "Leave Type Required.");
//        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (projectService.create(projectDto.getProject()) != null) {
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
          new RefDto().resetReferenceData(projectDto.getProject().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
//        if (StringHelper.isNullOrEmpty(projectDto.getProject().getName())) {
//            addFieldError("project", "Leave Type Required.");
//        }
      
// THIS ONE
//        if (projectDto.getProject().getId() == 0) {
//            addActionError("Job Title Not Found.");
//        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (projectService.update(projectDto.getProject()) != null) {

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
          new RefDto().resetReferenceData(projectDto.getProject().getClass());
        }
        return SUCCESS;
    }

    @Override
    public ProjectDto getModel() {
        return this.projectDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                projectDto.setProject(projectService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the projectDto
     */
    public ProjectDto getProjectDto() {
        return projectDto;
    }

    /**
     * @param projectDto the projectDto to set
     */
    public void setProjectDto(ProjectDto projectDto) {
        this.projectDto = projectDto;
    }
}
