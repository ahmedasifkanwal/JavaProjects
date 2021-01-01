package com.bytes.hrm.action.orgnaization;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.orgnaization.OrganizationGenInfoDto;
import com.bytes.hrm.service.orgnaization.OrganizationGenInfoService;
import com.bytes.hrm.service.orgnaization.OrganizationGenInfoServiceImpl;


import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class OrganizationGenInfoAction extends MyActionSupport
        implements ModelDriven<OrganizationGenInfoDto> {

    private OrganizationGenInfoDto organizationGenInfoDto = new OrganizationGenInfoDto();
    OrganizationGenInfoService organizationGenInfoDtoService = new OrganizationGenInfoServiceImpl();

    public OrganizationGenInfoAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            organizationGenInfoDto.setOrganizationGenInfoList(organizationGenInfoDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(organizationGenInfoDto.getOrganizationGenInfo().getName())) {
            addFieldError("name", "OrganizationGenInfo Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (organizationGenInfoDtoService.create(organizationGenInfoDto.getOrganizationGenInfo()) != null) {
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
        if (StringHelper.isNullOrEmpty(organizationGenInfoDto.getOrganizationGenInfo().getName())) {
              addFieldError("name", "OrganizationGenInfo Required.");
        }
        if (organizationGenInfoDto.getOrganizationGenInfo().getId()==0) {
            addActionError("OrganizationGenInfo Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (organizationGenInfoDtoService.update(organizationGenInfoDto.getOrganizationGenInfo()) != null) {

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
    public OrganizationGenInfoDto getModel() {
        return this.organizationGenInfoDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                organizationGenInfoDto.setOrganizationGenInfo(organizationGenInfoDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
             saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the organizationGenInfoDto
     */
    public OrganizationGenInfoDto getOrganizationGenInfoDto() {
        return organizationGenInfoDto;
    }

    /**
     * @param organizationGenInfoDto the organizationGenInfoDto to set
     */
    public void setOrganizationGenInfoDto(OrganizationGenInfoDto organizationGenInfoDto) {
        this.organizationGenInfoDto = organizationGenInfoDto;
    }
}
