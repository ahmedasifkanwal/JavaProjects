
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpBasicsalary;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.pim.EmpSkillDto;
import com.bytes.hrm.service.pim.EmpSkillService;
import com.bytes.hrm.service.pim.EmpSkillServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpSkillAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpSkillDto> {

    /**
     * @return the empSkillDto
     */
    public EmpSkillDto getEmpSkillDto() {
        return empSkillDto;
    }

    /**
     * @param empSkillDto the empSkillDto to set
     */
    public void setEmpSkillDto(EmpSkillDto empSkillDto) {
        this.empSkillDto = empSkillDto;
    }

    private EmpSkillDto empSkillDto = new EmpSkillDto();
    EmpSkillService empSkillService = new EmpSkillServiceImpl();

    public EmpSkillAction() {

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

            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        //  if (StringHelper.isNullOrEmpty(empSkillDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        //  }

        //  if (StringHelper.isNullOrEmpty(empSkillDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        // addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //  }
        // if (StringHelper.isNullOrEmpty(empSkillDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        //     addFieldError("ebsalBasicSalary", "Currency Required.");
        //}
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empSkillService.create(empSkillDto.getEmpSkill()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Skills Information Saved!!"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getAllEmpSkill();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        //if (StringHelper.isNullOrEmpty(empSkillDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        ///   }

        //  if (StringHelper.isNullOrEmpty(empSkillDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        //      addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //  }
        /// if (StringHelper.isNullOrEmpty(empSkillDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        ///     addFieldError("ebsalBasicSalary", "Currency Required.");
        // }
    }

    /*
    Editing empPassport core information
     */
    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (empSkillService.update(empSkillDto.getEmpSkill()) != null) {
                    addActionMessage(getText("Skills Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getAllEmpSkill();
        }
        return SUCCESS;
    }

    @Override
    public EmpSkillDto getModel() {
        return this.empSkillDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {

            if (empSkillDto.getEmpSkill().getEskillSeqno() > 0) {
                empSkillDto.setEmpSkill(empSkillService.read(empSkillDto.getEmpSkill().getEskillSeqno()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpSkill"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getAllEmpSkill() {
        try {

            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                Employee employee = new Employee(new Integer(request.getParameter("empNumber")));
                empSkillDto.getEmpSkill().setEmpNumber(employee);
            }

            if (empSkillDto.getEmpSkill().getEmpNumber().getEmpNumber() > 0) {
                empSkillDto.setEmpSkillList(empSkillService.readByEmpNumber(empSkillDto.getEmpSkill().getEmpNumber().getEmpNumber()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpSkill"));
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
}
