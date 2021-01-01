package com.bytes.hrm.action.leave;



import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;


import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.leave.LeavesDto;
import com.bytes.hrm.service.leave.LeavesService;
import com.bytes.hrm.service.leave.LeavesServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class LeavesAction extends MyActionSupport implements MyOperation,
         ModelDriven<LeavesDto> {

    private LeavesDto leavesDto = new LeavesDto();
   LeavesService leavesService = new LeavesServiceImpl();

    public LeavesAction() {

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
            leavesDto.setLeavesList(leavesService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
//        if (StringHelper.isNullOrEmpty(leavesDto.getLeaves().getName())) {
//            addFieldError("leaves", "Leave Type Required.");
//        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (leavesService.create(leavesDto.getLeaves()) != null) {
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
          new RefDto().resetReferenceData(leavesDto.getLeaves().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
//        if (StringHelper.isNullOrEmpty(leavesDto.getLeaves().getName())) {
//            addFieldError("leaves", "Leave Type Required.");
//        }
      

        if (leavesDto.getLeaves().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (leavesService.update(leavesDto.getLeaves()) != null) {

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
          new RefDto().resetReferenceData(leavesDto.getLeaves().getClass());
        }
        return SUCCESS;
    }

    @Override
    public LeavesDto getModel() {
        return this.leavesDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                leavesDto.setLeaves(leavesService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the leavesDto
     */
    public LeavesDto getLeavesDto() {
        return leavesDto;
    }

    /**
     * @param leavesDto the leavesDto to set
     */
    public void setLeavesDto(LeavesDto leavesDto) {
        this.leavesDto = leavesDto;
    }
}
