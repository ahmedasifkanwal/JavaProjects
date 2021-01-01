package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.pim.EmpEducationDto;


import com.bytes.hrm.service.pim.EmpEducationService;
import com.bytes.hrm.service.pim.EmpEducationServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpEducationAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpEducationDto> {

    /**
     * @return the empEducationDto
     */
    public EmpEducationDto getEmpEducationDto() {
        return empEducationDto;
    }

    /**
     * @param empEducationDto the empEducationDto to set
     */
    public void setEmpEducationDto(EmpEducationDto empEducationDto) {
        this.empEducationDto = empEducationDto;
    }

    EmpEducationDto empEducationDto = new EmpEducationDto();
    EmpEducationService empEducationService = new EmpEducationServiceImpl();

    public EmpEducationAction() {

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
        // if (StringHelper.isNullOrEmpty(empEducationDto.getEmpBasicsalary().getSalaryComponent())) {
        //  addFieldError("salaryComponent", "Salary Component Required.");
        //  }

        //  if (StringHelper.isNullOrEmpty(empEducationDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        // addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        // }
        // if (StringHelper.isNullOrEmpty(empEducationDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        // addFieldError("ebsalBasicSalary", "Currency Required.");
        //   }
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empEducationService.create(empEducationDto.getEmpEducation()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Education Information Saved!!"));
                    //  empEducationDto.setEmpBasicsalary(new EmpBasicsalary());

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getAllEmpEducation();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        //  if (StringHelper.isNullOrEmpty(empEducationDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        // }

        // if (StringHelper.isNullOrEmpty(empEducationDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        //  addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //   }
        // if (StringHelper.isNullOrEmpty(empEducationDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        //     //addFieldError("ebsalBasicSalary", "Currency Required.");
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

                if (empEducationService.update(empEducationDto.getEmpEducation()) != null) {
                    addActionMessage(getText("Education Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getAllEmpEducation();
        }
        return SUCCESS;
    }

    @Override
    public EmpEducationDto getModel() {
        return this.empEducationDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {

            if (empEducationDto.getEmpEducation().getId() > 0) {
                empEducationDto.setEmpEducation(empEducationService.read(empEducationDto.getEmpEducation().getId()));
            } else if (!StringHelper.isNullOrEmpty(request.getParameter("epSeqno"))) {
                String id = (request.getParameter("epSeqno"));
                empEducationDto.setEmpEducation(empEducationService.read(new Integer(id)));
            } else {
                addActionError(getText("e.entity.not.found", "EmpEducation"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getAllEmpEducation() {
        try {

            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                Employee employee = new Employee(new Integer(request.getParameter("empNumber")));
                empEducationDto.getEmpEducation().setEmpNumber(employee);
            }
            if (empEducationDto.getEmpEducation().getEmpNumber().getEmpNumber() > 0) {
                empEducationDto.setEmpEducationList(empEducationService.readByEmpNumber(empEducationDto.getEmpEducation().getEmpNumber().getEmpNumber()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpEducation"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
}
