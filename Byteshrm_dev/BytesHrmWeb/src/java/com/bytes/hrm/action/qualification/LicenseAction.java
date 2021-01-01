package com.bytes.hrm.action.qualification;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.qualification.LicenseDto;
import com.bytes.hrm.service.qualification.LicenseService;
import com.bytes.hrm.service.qualification.LicenseServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class LicenseAction extends MyActionSupport
        implements ModelDriven<LicenseDto> {

    private LicenseDto licenseDto = new LicenseDto();
    LicenseService licenseDtoService = new LicenseServiceImpl();

    public LicenseAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            licenseDto.setLicenseList(licenseDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(licenseDto.getLicense().getName())) {
            addFieldError("name", "License Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (licenseDtoService.create(licenseDto.getLicense()) != null) {
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

    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(licenseDto.getLicense().getName())) {
              addFieldError("name", "License Required.");
        }
        if (licenseDto.getLicense().getId()==0) {
            addActionError("License Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (licenseDtoService.update(licenseDto.getLicense()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public LicenseDto getModel() {
        return this.licenseDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                licenseDto.setLicense(licenseDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
             saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the licenseDto
     */
    public LicenseDto getLicenseDto() {
        return licenseDto;
    }

    /**
     * @param licenseDto the licenseDto to set
     */
    public void setLicenseDto(LicenseDto licenseDto) {
        this.licenseDto = licenseDto;
    }
}
