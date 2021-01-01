package com.bytes.hrm.action.qualification;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.qualification.LanguageDto;
import com.bytes.hrm.service.qualification.LanguageService;
import com.bytes.hrm.service.qualification.LanguageServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class LanguageAction extends MyActionSupport
        implements ModelDriven<LanguageDto> {

    private LanguageDto languageDto = new LanguageDto();
    LanguageService languageDtoService = new LanguageServiceImpl();

    public LanguageAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            languageDto.setLanguageList(languageDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(languageDto.getLanguage().getName())) {
            addFieldError("name", "Language Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (languageDtoService.create(languageDto.getLanguage()) != null) {
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
        if (StringHelper.isNullOrEmpty(languageDto.getLanguage().getName())) {
              addFieldError("name", "Language Required.");
        }
        if (languageDto.getLanguage().getId()==0) {
            addActionError("Language Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (languageDtoService.update(languageDto.getLanguage()) != null) {

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
    public LanguageDto getModel() {
        return this.languageDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                languageDto.setLanguage(languageDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
             saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the languageDto
     */
    public LanguageDto getLanguageDto() {
        return languageDto;
    }

    /**
     * @param languageDto the languageDto to set
     */
    public void setLanguageDto(LanguageDto languageDto) {
        this.languageDto = languageDto;
    }
}
