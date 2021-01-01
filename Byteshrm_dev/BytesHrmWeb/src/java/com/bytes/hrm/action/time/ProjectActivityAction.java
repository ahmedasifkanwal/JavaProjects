package com.bytes.hrm.action.time;



import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;


import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.time.ProjectActivityDto;
import com.bytes.hrm.service.time.ProjectActivityServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import com.bytes.hrm.service.time.ProjectActivityService;

public final class ProjectActivityAction extends MyActionSupport implements MyOperation,
         ModelDriven<ProjectActivityDto> {

    private ProjectActivityDto activityDto = new ProjectActivityDto();
   ProjectActivityService activityService = new ProjectActivityServiceImpl();

    public ProjectActivityAction() {

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
            activityDto.setProjectActivityList(activityService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
//        if (StringHelper.isNullOrEmpty(activityDto.getActivity().getName())) {
//            addFieldError("activity", "Leave Type Required.");
//        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (activityService.create(activityDto.getProjectActivity()) != null) {
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
          new RefDto().resetReferenceData(activityDto.getProjectActivity().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
//        if (StringHelper.isNullOrEmpty(activityDto.getActivity().getName())) {
//            addFieldError("activity", "Leave Type Required.");
//        }
      
// THIS ONE
//        if (activityDto.getActivity().getId() == 0) {
//            addActionError("Job Title Not Found.");
//        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (activityService.update(activityDto.getProjectActivity()) != null) {

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
          new RefDto().resetReferenceData(activityDto.getProjectActivity().getClass());
        }
        return SUCCESS;
    }

    @Override
    public ProjectActivityDto getModel() {
        return this.activityDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                activityDto.setProjectActivity(activityService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the activityDto
     */
    public ProjectActivityDto getActivityDto() {
        return activityDto;
    }

    /**
     * @param activityDto the activityDto to set
     */
    public void setActivityDto(ProjectActivityDto activityDto) {
        this.activityDto = activityDto;
    }
}
