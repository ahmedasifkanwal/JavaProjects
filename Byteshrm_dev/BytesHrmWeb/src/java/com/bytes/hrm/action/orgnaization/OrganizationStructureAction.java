package com.bytes.hrm.action.orgnaization;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.Subunit;
import com.bytes.hrm.dto.orgnaization.SubunitDto;
import com.bytes.hrm.service.orgnaization.SubunitService;
import com.bytes.hrm.service.orgnaization.SubunitServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.util.List;

public final class OrganizationStructureAction extends MyActionSupport
        implements ModelDriven<SubunitDto> {

    private SubunitDto subunitDto = new SubunitDto();
    SubunitService subunitDtoService = new SubunitServiceImpl();

    public OrganizationStructureAction() {

        initialize();
    }

    public void initialize() {

    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            subunitDto.setSubunitList(subunitDtoService.findAll());

            List<Subunit> list = subunitDtoService.getSubunitByLevel(0);

            for (int outer = 0; outer < list.size(); outer++) {
                System.out.println(list.get(outer).getName());
                List<Subunit> list1 = subunitDtoService.getSubunitByLevel(list.get(outer).getId());

                for (int j = 0; j < list1.size(); j++) {
                    System.out.println(list1.get(j).getName());
                }
            }

            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(subunitDto.getSubunit().getName())) {
            addFieldError("name", "Subunit Required.");
        }
        if (StringHelper.isNullOrEmpty(subunitDto.getSubunit().getName())) {
            addFieldError("couCode", "Country Required.");
        }
    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (subunitDtoService.create(subunitDto.getSubunit()) != null) {
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
            addFieldError("name", "Subunit Required.");
        }
        if (subunitDto.getSubunit().getId() == 0) {
            addActionError("Subunit Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (subunitDtoService.update(subunitDto.getSubunit()) != null) {

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
        return this.subunitDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                subunitDto.setSubunit(subunitDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

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

    public static void main(String arn[]) {

        OrganizationStructureAction obj = new OrganizationStructureAction();
        List<Subunit> list = obj.subunitDtoService.getSubunitByLevel(0);

        for (int outer = 0; outer < list.size(); outer++) {
            System.out.println("--"+outer+"--" +list.get(outer).getName());
            obj.getData(list.get(outer).getId());
        }
    }

    public void getData(int id) {
        OrganizationStructureAction obj = new OrganizationStructureAction();
        List<Subunit> list1 = obj.subunitDtoService.getSubunitByLevel(id);
         
        for (int j = 0; j < list1.size(); j++) {
            System.out.println("+"+j+"+"+list1.get(j).getName());
            getData(list1.get(j).getId());
        }

    }

}
