package com.bytes.hrm.action.qualification;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.qualification.EducationDto;
import com.bytes.hrm.service.qualification.EducationService;
import com.bytes.hrm.service.qualification.EducationServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EducationAction extends MyActionSupport
        implements ModelDriven<EducationDto> {

    private EducationDto educationDto = new EducationDto();
    EducationService educationDtoService = new EducationServiceImpl();

    public EducationAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            educationDto.setEducationList(educationDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(educationDto.getEducation().getName())) {
            addFieldError("name", "Education Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (educationDtoService.create(educationDto.getEducation()) != null) {
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
        if (StringHelper.isNullOrEmpty(educationDto.getEducation().getName())) {
              addFieldError("name", "Education Required.");
        }
        if (educationDto.getEducation().getId()==0) {
            addActionError("Education Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (educationDtoService.update(educationDto.getEducation()) != null) {

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
    public EducationDto getModel() {
        return this.educationDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                educationDto.setEducation(educationDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
             saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the educationDto
     */
    public EducationDto getEducationDto() {
        return educationDto;
    }

    /**
     * @param educationDto the educationDto to set
     */
    public void setEducationDto(EducationDto educationDto) {
        this.educationDto = educationDto;
    }
}
