package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.pim.EmpLanguageDto;
import com.bytes.hrm.service.pim.EmpLanguageService;
import com.bytes.hrm.service.pim.EmpLanguageServiceImpl;


import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpLanguageAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpLanguageDto> {

    /**
     * @return the empLanguageDto
     */
    public EmpLanguageDto getEmpLanguageDto() {
        return empLanguageDto;
    }

    /**
     * @param empLanguageDto the empLanguageDto to set
     */
    public void setEmpLanguageDto(EmpLanguageDto empLanguageDto) {
        this.empLanguageDto = empLanguageDto;
    }

    EmpLanguageDto empLanguageDto = new EmpLanguageDto();
    EmpLanguageService empLanguageService = new EmpLanguageServiceImpl();

    public EmpLanguageAction() {

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
        // if (StringHelper.isNullOrEmpty(empLanguageDto.getEmpBasicsalary().getSalaryComponent())) {
        //  addFieldError("salaryComponent", "Salary Component Required.");
        //  }

        //  if (StringHelper.isNullOrEmpty(empLanguageDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        // addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        // }
        // if (StringHelper.isNullOrEmpty(empLanguageDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        // addFieldError("ebsalBasicSalary", "Currency Required.");
        //   }
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empLanguageService.create(empLanguageDto.getEmpLanguage()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("language Information Saved!!"));
                    //  empLanguageDto.setEmpBasicsalary(new EmpBasicsalary());

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getAllEmpLanguage();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        //  if (StringHelper.isNullOrEmpty(empLanguageDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        // }

        // if (StringHelper.isNullOrEmpty(empLanguageDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        //  addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //   }
        // if (StringHelper.isNullOrEmpty(empLanguageDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
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

                if (empLanguageService.update(empLanguageDto.getEmpLanguage()) != null) {
                    addActionMessage(getText("language Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getAllEmpLanguage();
        }
        return SUCCESS;
    }

    @Override
    public EmpLanguageDto getModel() {
        return this.empLanguageDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {

            if (empLanguageDto.getEmpLanguage().getEmpLanguagePK().getLangId()> 0) {
                empLanguageDto.setEmpLanguage(empLanguageService.read(empLanguageDto.getEmpLanguage().getEmpLanguagePK()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpLanguage"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getAllEmpLanguage() {
        try {

            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                Employee employee = new Employee(new Integer(request.getParameter("empNumber")));
                empLanguageDto.getEmpLanguage().setEmployee(employee);
            }
            if (empLanguageDto.getEmpLanguage().getEmployee().getEmpNumber() > 0) {
                empLanguageDto.setEmpLanguageList(empLanguageService.readByEmpNumber(empLanguageDto.getEmpLanguage().getEmployee().getEmpNumber()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpLanguage"));
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
}
