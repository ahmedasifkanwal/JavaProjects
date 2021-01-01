package com.bytes.hrm.action.common;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.NationalityDto;
import com.bytes.hrm.service.common.NationalityService;
import com.bytes.hrm.service.common.NationalityServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class NationalityAction extends MyActionSupport implements MyOperation,
        ModelDriven<NationalityDto> {

    private static NationalityDto nationalityDto = new NationalityDto();
    NationalityService nationalityService = new NationalityServiceImpl();

    public NationalityAction() {

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

            nationalityDto.setNationalityList(nationalityService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(nationalityDto.getNationality().getName())) {
            addFieldError("name", "Nationality Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (nationalityService.create(nationalityDto.getNationality()) != null) {
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
        if (StringHelper.isNullOrEmpty(nationalityDto.getNationality().getName())) {
            addFieldError("nationality", "Nationality Required.");
        }

        if (nationalityDto.getNationality().getId() == 0) {
            addActionError("Nationality Not Found.");
        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (nationalityService.update(nationalityDto.getNationality()) != null) {

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
    public NationalityDto getModel() {
        return this.nationalityDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                nationalityDto.setNationality(nationalityService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
         }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the nationalityDto
     */
    public NationalityDto getNationalityDto() {
        return nationalityDto;
    }

    /**
     * @param nationalityDto the nationalityDto to set
     */
    public void setNationalityDto(NationalityDto nationalityDto) {
        this.nationalityDto = nationalityDto;
    }
}
