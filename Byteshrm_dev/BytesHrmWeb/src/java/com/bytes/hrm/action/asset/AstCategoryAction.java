package com.bytes.hrm.action.asset;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.asset.AstCategoryDto;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.service.asset.AstCategoryService;
import com.bytes.hrm.service.asset.AstCategoryServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class AstCategoryAction extends MyActionSupport implements MyOperation,
         ModelDriven<AstCategoryDto> {

    private AstCategoryDto astCategoryDto = new AstCategoryDto();
    AstCategoryService astCategoryService = new AstCategoryServiceImpl();

    public AstCategoryAction() {

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
            astCategoryDto.setAstCategoryList(astCategoryService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(astCategoryDto.getAstCategory().getName())) {
            addFieldError("astCategory", "Category Name Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (astCategoryService.create(astCategoryDto.getAstCategory()) != null) {
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
          new RefDto().resetReferenceData(astCategoryDto.getAstCategory().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(astCategoryDto.getAstCategory().getName())) {
            addFieldError("astCategory", "Category Name Required.");
        }

        if (astCategoryDto.getAstCategory().getId() == 0) {
            addActionError("Category Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (astCategoryService.update(astCategoryDto.getAstCategory()) != null) {

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
          new RefDto().resetReferenceData(astCategoryDto.getAstCategory().getClass());
        }
        return SUCCESS;
    }

    @Override
    public AstCategoryDto getModel() {
        return this.astCategoryDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                astCategoryDto.setAstCategory(astCategoryService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the astCategoryDto
     */
    public AstCategoryDto getAstCategoryDto() {
        return astCategoryDto;
    }

    /**
     * @param astCategoryDto the astCategoryDto to set
     */
    public void setAstCategoryDto(AstCategoryDto astCategoryDto) {
        this.astCategoryDto = astCategoryDto;
    }
}
