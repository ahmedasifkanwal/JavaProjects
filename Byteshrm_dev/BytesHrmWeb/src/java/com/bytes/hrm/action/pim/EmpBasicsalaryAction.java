package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpBasicsalary;
import com.bytes.hrm.dto.pim.EmployeeDto;

import com.bytes.hrm.service.pim.EmpBasicsalaryService;
import com.bytes.hrm.service.pim.EmpBasicsalaryServiceImpl;
import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpBasicsalaryAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmployeeDto> {

    /**
     * @return the employeeDto
     */
    public EmployeeDto getEmployeeDto() {
        return employeeDto;
    }

    /**
     * @param employeeDto the employeeDto to set
     */
    public void setEmployeeDto(EmployeeDto employeeDto) {
        this.employeeDto = employeeDto;
    }

    private EmployeeDto employeeDto = new EmployeeDto();
    EmployeeService employeeService = new EmployeeServiceImpl();

    EmpBasicsalaryService empBasicsalaryService = new EmpBasicsalaryServiceImpl();

    public EmpBasicsalaryAction() {

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
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpBasicsalary().getSalaryComponent())) {
            addFieldError("salaryComponent", "Salary Component Required.");
        }

        if (StringHelper.isNullOrEmpty(employeeDto.getEmpBasicsalary().getEbsalBasicSalary())) {
            addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        }
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
            addFieldError("ebsalBasicSalary", "Currency Required.");
        }
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empBasicsalaryService.create(employeeDto.getEmpBasicsalary()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Salary Information Saved!!"));
                    employeeDto.setEmpBasicsalary(new EmpBasicsalary());

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getSalaries();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpBasicsalary().getSalaryComponent())) {
            addFieldError("salaryComponent", "Salary Component Required.");
        }

        if (StringHelper.isNullOrEmpty(employeeDto.getEmpBasicsalary().getEbsalBasicSalary())) {
            addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        }
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
            addFieldError("ebsalBasicSalary", "Currency Required.");
        }
    }

    /*
    Editing empPassport core information
     */
    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (empBasicsalaryService.update(employeeDto.getEmpBasicsalary()) != null) {
                    addActionMessage(getText("Salary Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getSalaries();
        }
        return SUCCESS;
    }

    @Override
    public EmployeeDto getModel() {
        return this.employeeDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {

            if (employeeDto.getEmpBasicsalary().getId() > 0) {
                employeeDto.setEmpBasicsalary(empBasicsalaryService.read(employeeDto.getEmpBasicsalary().getId()));
            } else if (!StringHelper.isNullOrEmpty(request.getParameter("epSeqno"))) {
                String id = (request.getParameter("epSeqno"));
                employeeDto.setEmpBasicsalary(empBasicsalaryService.read(new Integer(id)));
            } else {
                addActionError(getText("e.entity.not.found", "EmpPassport"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getSalaries() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                employeeDto.getEmployee().setEmpNumber(new Integer(request.getParameter("empNumber")));
            }
            if (employeeDto.getEmployee().getEmpNumber() > 0) {
               employeeService.populateEmployee(employeeDto);
            } else {
                addActionError(getText("e.entity.not.found", "Employee"));
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
}
