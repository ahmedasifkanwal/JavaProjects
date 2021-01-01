package com.bytes.hrm.action.orgnaization;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.orgnaization.SubunitDto;
import com.bytes.hrm.service.orgnaization.SubunitService;
import com.bytes.hrm.service.orgnaization.SubunitServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class UnitAction extends MyActionSupport
        implements ModelDriven<SubunitDto> {

    /**
     * @return the subunitDto
     */
    public SubunitDto getSubunitDto() {
        return subunitDto;
    }

    /**
     * @param subunitDto the subunitDto to set
     */
    public void setSubunitDto(SubunitDto subunitDto) {
        this.subunitDto = subunitDto;
    }

    private SubunitDto subunitDto = new SubunitDto();
    SubunitService subunitService = new SubunitServiceImpl();

    public UnitAction() {

        initialize();
    }

    public void initialize() {

    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            getSubunitDto().setSubunitList(subunitService.findAll());

            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(subunitDto.getSubunit().getName())) {
            addFieldError("name", "Unit Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (subunitService.create(subunitDto.getSubunit()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {

            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }

        return SUCCESS;
    }

    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(subunitDto.getSubunit().getName())) {
            addFieldError("name", "Unit Required.");
        }
        if (subunitDto.getSubunit().getId() == 0) {
            addActionError("Unit Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (subunitService.update(subunitDto.getSubunit()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public SubunitDto getModel() {
        return this.getSubunitDto();
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                subunitDto.setSubunit(subunitService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getParentLevel() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("level"))) {
                String id = (request.getParameter("level"));
                subunitDto.setSubunitParent(subunitService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
      public String delete() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("level"))) {
                String id = (request.getParameter("level"));
                subunitService.deleteChild(new Integer(id));

            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return FORWARD;
    }
}
