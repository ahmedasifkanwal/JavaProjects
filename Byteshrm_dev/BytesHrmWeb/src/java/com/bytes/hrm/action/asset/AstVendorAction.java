package com.bytes.hrm.action.asset;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.asset.AstVendorDto;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.service.asset.AstVendorService;
import com.bytes.hrm.service.asset.AstVendorServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class AstVendorAction extends MyActionSupport implements MyOperation,
         ModelDriven<AstVendorDto> {

    private AstVendorDto astVendorDto = new AstVendorDto();
    AstVendorService astVendorService = new AstVendorServiceImpl();

    public AstVendorAction() {

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
            astVendorDto.setAstVendorList(astVendorService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(astVendorDto.getAstVendor().getName())) {
            addFieldError("astVendor", "Vendor Name Required.");
        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (astVendorService.create(astVendorDto.getAstVendor()) != null) {
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
          new RefDto().resetReferenceData(astVendorDto.getAstVendor().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(astVendorDto.getAstVendor().getName())) {
            addFieldError("astVendor", "Vendor Required.");
        }

        if (astVendorDto.getAstVendor().getId() == 0) {
            addActionError("Vendor Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (astVendorService.update(astVendorDto.getAstVendor()) != null) {

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
          new RefDto().resetReferenceData(astVendorDto.getAstVendor().getClass());
        }
        return SUCCESS;
    }

    @Override
    public AstVendorDto getModel() {
        return this.astVendorDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                astVendorDto.setAstVendor(astVendorService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the astVendorDto
     */
    public AstVendorDto getAstVendorDto() {
        return astVendorDto;
    }

    /**
     * @param astVendorDto the astVendorDto to set
     */
    public void setAstVendorDto(AstVendorDto astVendorDto) {
        this.astVendorDto = astVendorDto;
    }
}
