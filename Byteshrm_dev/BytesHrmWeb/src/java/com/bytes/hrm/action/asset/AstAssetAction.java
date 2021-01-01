package com.bytes.hrm.action.asset;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.asset.AstAssetDto;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.service.asset.AstAssetService;
import com.bytes.hrm.service.asset.AstAssetServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class AstAssetAction extends MyActionSupport implements MyOperation,
         ModelDriven<AstAssetDto> {

    private AstAssetDto astAssetDto = new AstAssetDto();
    AstAssetService astAssetService = new AstAssetServiceImpl();

    public AstAssetAction() {

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
            astAssetDto.setAstAssetList(astAssetService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(astAssetDto.getAstAsset().getSerialNumber())) {
            addFieldError("astAsset", "Job Title Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (astAssetService.create(astAssetDto.getAstAsset()) != null) {
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
          new RefDto().resetReferenceData(astAssetDto.getAstAsset().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
         if (StringHelper.isNullOrEmpty(astAssetDto.getAstAsset().getSerialNumber())) {
            addFieldError("astAsset", "Job Title Required.");
        }

        if (astAssetDto.getAstAsset().getId() == 0) {
            addActionError("Job Title Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (astAssetService.update(astAssetDto.getAstAsset()) != null) {

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
          new RefDto().resetReferenceData(astAssetDto.getAstAsset().getClass());
        }
        return SUCCESS;
    }

    @Override
    public AstAssetDto getModel() {
        return this.astAssetDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                astAssetDto.setAstAsset(astAssetService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the astAssetDto
     */
    public AstAssetDto getAstAssetDto() {
        return astAssetDto;
    }

    /**
     * @param astAssetDto the astAssetDto to set
     */
    public void setAstAssetDto(AstAssetDto astAssetDto) {
        this.astAssetDto = astAssetDto;
    }
}
