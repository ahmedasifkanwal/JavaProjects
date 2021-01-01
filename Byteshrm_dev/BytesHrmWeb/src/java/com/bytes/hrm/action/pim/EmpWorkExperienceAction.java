
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
import com.bytes.hrm.dao.entity.EmpWorkExperiencePK;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.pim.EmpWorkExperienceDto;
import com.bytes.hrm.service.pim.EmpWorkExperienceService;
import com.bytes.hrm.service.pim.EmpWorkExperienceServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpWorkExperienceAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpWorkExperienceDto> {

    /**
     * @return the empWorkExperienceDto
     */
    public EmpWorkExperienceDto getEmpWorkExperienceDto() {
        return empWorkExperienceDto;
    }

    /**
     * @param empWorkExperienceDto the empWorkExperienceDto to set
     */
    public void setEmpWorkExperienceDto(EmpWorkExperienceDto empWorkExperienceDto) {
        this.empWorkExperienceDto = empWorkExperienceDto;
    }

    private EmpWorkExperienceDto empWorkExperienceDto = new EmpWorkExperienceDto();
    EmpWorkExperienceService empWorkExperienceService = new EmpWorkExperienceServiceImpl();

    public EmpWorkExperienceAction() {

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
        //  if (StringHelper.isNullOrEmpty(empWorkExperienceDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        //  }

        //  if (StringHelper.isNullOrEmpty(empWorkExperienceDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        // addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //  }
        // if (StringHelper.isNullOrEmpty(empWorkExperienceDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        //     addFieldError("ebsalBasicSalary", "Currency Required.");
        //}
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empWorkExperienceService.create(empWorkExperienceDto.getEmpWorkExperience()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Work Experience Information Saved!!"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getAllEmpWorkExperience();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        //if (StringHelper.isNullOrEmpty(empWorkExperienceDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        ///   }

        //  if (StringHelper.isNullOrEmpty(empWorkExperienceDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        //      addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //  }
        /// if (StringHelper.isNullOrEmpty(empWorkExperienceDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
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

                if (empWorkExperienceService.update(empWorkExperienceDto.getEmpWorkExperience()) != null) {
                    addActionMessage(getText("Work Experience Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getAllEmpWorkExperience();
        }
        return SUCCESS;
    }

    @Override
    public EmpWorkExperienceDto getModel() {
        return this.empWorkExperienceDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {

            if (empWorkExperienceDto.getEmpWorkExperience().getEmpWorkExperiencePK().getEexpSeqno() > 0) {
                empWorkExperienceDto.setEmpWorkExperience(empWorkExperienceService.read(empWorkExperienceDto.getEmpWorkExperience().getEmpWorkExperiencePK().getEexpSeqno()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpWorkExperience"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getAllEmpWorkExperience() {
        try {

            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                Employee employee = new Employee(new Integer(request.getParameter("empNumber")));
                empWorkExperienceDto.getEmpWorkExperience().setEmployee(employee);
            }

            if (empWorkExperienceDto.getEmpWorkExperience().getEmployee().getEmpNumber() > 0) {
                empWorkExperienceDto.setEmpWorkExperienceList(empWorkExperienceService
                        .readByEmpNumber(empWorkExperienceDto.getEmpWorkExperience().getEmployee().getEmpNumber()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpWorkExperience"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
}
