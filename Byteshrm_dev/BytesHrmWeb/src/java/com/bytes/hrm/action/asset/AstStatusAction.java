package com.bytes.hrm.action.asset;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.asset.AstStatusDto;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.service.asset.AstStatusService;
import com.bytes.hrm.service.asset.AstStatusServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class AstStatusAction extends MyActionSupport implements MyOperation,
         ModelDriven<AstStatusDto> {

    private AstStatusDto astStatusDto = new AstStatusDto();
    AstStatusService astStatusService = new AstStatusServiceImpl();

    public AstStatusAction() {

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
            astStatusDto.setAstStatusList(astStatusService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(astStatusDto.getAstStatus().getName())) {
            addFieldError("astStatus", "Job Title Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (astStatusService.create(astStatusDto.getAstStatus()) != null) {
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
          new RefDto().resetReferenceData(astStatusDto.getAstStatus().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(astStatusDto.getAstStatus().getName())) {
            addFieldError("astStatus", "Job Title Required.");
        }

      

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (astStatusService.update(astStatusDto.getAstStatus()) != null) {

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
          new RefDto().resetReferenceData(astStatusDto.getAstStatus().getClass());
        }
        return SUCCESS;
    }

    @Override
    public AstStatusDto getModel() {
        return this.astStatusDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                astStatusDto.setAstStatus(astStatusService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the astStatusDto
     */
    public AstStatusDto getAstStatusDto() {
        return astStatusDto;
    }

    /**
     * @param astStatusDto the astStatusDto to set
     */
    public void setAstStatusDto(AstStatusDto astStatusDto) {
        this.astStatusDto = astStatusDto;
    }
}
