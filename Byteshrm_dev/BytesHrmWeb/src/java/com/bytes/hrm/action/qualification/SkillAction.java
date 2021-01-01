package com.bytes.hrm.action.qualification;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.qualification.SkillDto;
import com.bytes.hrm.service.qualification.SkillService;
import com.bytes.hrm.service.qualification.SkillServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class SkillAction extends MyActionSupport
        implements ModelDriven<SkillDto> {

    private SkillDto skillDto = new SkillDto();
    SkillService skillDtoService = new SkillServiceImpl();

    public SkillAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            skillDto.setSkillList(skillDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(skillDto.getSkill().getName())) {
            addFieldError("name", "Skill Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (skillDtoService.create(skillDto.getSkill()) != null) {
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
        if (StringHelper.isNullOrEmpty(skillDto.getSkill().getName())) {
              addFieldError("name", "Skill Required.");
        }
        if (skillDto.getSkill().getId()==0) {
            addActionError("Skill Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (skillDtoService.update(skillDto.getSkill()) != null) {

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
    public SkillDto getModel() {
        return this.skillDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                skillDto.setSkill(skillDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
             saveException(this.getClass().getSimpleName() + ":" + new Object() {
             }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the skillDto
     */
    public SkillDto getSkillDto() {
        return skillDto;
    }

    /**
     * @param skillDto the skillDto to set
     */
    public void setSkillDto(SkillDto skillDto) {
        this.skillDto = skillDto;
    }
}
