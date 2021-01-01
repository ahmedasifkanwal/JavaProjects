package com.bytes.hrm.action.asset;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.asset.AstBrandDto;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.service.asset.AstBrandService;
import com.bytes.hrm.service.asset.AstBrandServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class AstBrandAction extends MyActionSupport implements MyOperation,
         ModelDriven<AstBrandDto> {

    private AstBrandDto astBrandDto = new AstBrandDto();
    AstBrandService astBrandService = new AstBrandServiceImpl();

    public AstBrandAction() {

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
            astBrandDto.setAstBrandList(astBrandService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(astBrandDto.getAstBrand().getName())) {
            addFieldError("astBrand", "Brand Name Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (astBrandService.create(astBrandDto.getAstBrand()) != null) {
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
          new RefDto().resetReferenceData(astBrandDto.getAstBrand().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(astBrandDto.getAstBrand().getName())) {
            addFieldError("astBrand", "Brand Name Required.");
        }

        if (astBrandDto.getAstBrand().getId() == 0) {
            addActionError("Brand Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (astBrandService.update(astBrandDto.getAstBrand()) != null) {

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
          new RefDto().resetReferenceData(astBrandDto.getAstBrand().getClass());
        }
        return SUCCESS;
    }

    @Override
    public AstBrandDto getModel() {
        return this.astBrandDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                astBrandDto.setAstBrand(astBrandService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the astBrandDto
     */
    public AstBrandDto getAstBrandDto() {
        return astBrandDto;
    }

    /**
     * @param astBrandDto the astBrandDto to set
     */
    public void setAstBrandDto(AstBrandDto astBrandDto) {
        this.astBrandDto = astBrandDto;
    }
}
