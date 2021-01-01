package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpContractExtend;
import com.bytes.hrm.dto.pim.EmployeeDto;
import com.bytes.hrm.service.pim.EmpReporttoService;
import com.bytes.hrm.service.pim.EmpReporttoServiceImpl;

import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.Collection;

public final class EmployeeAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmployeeDto> {

    private EmployeeDto employeeDto = new EmployeeDto();
    EmployeeService employeeService = new EmployeeServiceImpl();
    EmpReporttoService empReporttoService = new EmpReporttoServiceImpl();

    public EmployeeAction() {

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
            employeeDto.setEmployeeList(employeeService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(employeeDto.getEmployee().getEmpFirstname())) {
            addFieldError("empFirstname", "First Name Required.");
        }
        if (StringHelper.isNullOrEmpty(employeeDto.getEmployee().getEmployeeId())) {
            addFieldError("employeeId", "Employee Number Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (employeeService.create(employeeDto.getEmployee()) != null) {
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

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(employeeDto.getEmployee().getEmpFirstname())) {
            addFieldError("name", "First Name Required.");
        }
        if (StringHelper.isNullOrEmpty(employeeDto.getEmployee().getEmployeeId())) {
            addFieldError("employeeId", "Employee Id Required.");
        }
        if (null == employeeDto.getEmployee().getEmpNumber()) {
            addActionError(getText("e.entity.not.found", "Employee"));
        }

    }

    /*
    Editing employee core information
     */
    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (employeeService.update(employeeDto.getEmployee()) != null) {

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

            if (employeeDto.getEmployee().getEmpNumber() != null
                    && employeeDto.getEmployee().getEmpNumber() > 0) {
                ;
            } else if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {

                employeeDto.getEmployee().setEmpNumber(new Integer(request.getParameter("empNumber")));

            } else {
                addActionError(getText("e.entity.not.found", "Employee"));
                return SUCCESS;
            }
//Set Th returned data
            employeeService.populateEmployee(employeeDto);

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateEmpPersonalDetailInput() {
        if (StringHelper.isNullOrEmpty(employeeDto.getEmployee().getEmpFirstname())) {
            addFieldError("name", "First Name Required.");
        }
        if (StringHelper.isNullOrEmpty(employeeDto.getEmployee().getEmployeeId())) {
            addFieldError("employeeId", "Employee Id Required.");
        }
        if (null == employeeDto.getEmployee().getEmpNumber()) {
            addActionError(getText("e.entity.not.found", "Employee"));
        }
    }

    /*
    This method is used to save the employee personal details only.
    Do not mix with other employee information.
     */
    public String saveEmpPersonalDetail() {

        try {
            validateEmpPersonalDetailInput();
            if (isValidInput()) {
                if (employeeService.update(employeeDto.getEmployee()) != null) {
                    addActionMessage(getText("Personal Information Saved!!"));

                } else {
                    addActionError(getText("E_00"));
                }
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getSelected();
        }
        return SUCCESS;

    }


    /*
    This method is used to save the Employee Job details only.
    Do not mix with other employee information.
     */
    public String saveEmpJob() {
        try {
            if (isValidInput()) {
                //
                if (employeeDto.getEmpContractExtend().getEconExtendEndDate() != null) {
                    Collection<EmpContractExtend> c = new ArrayList<>();
                    c.add(employeeDto.getEmpContractExtend());
                    employeeDto.getEmployee().setEmpContractExtendCollection(c);
                }

                if (employeeService.updateJobDetails(employeeDto.getEmployee()) != null) {
                    addActionMessage(getText("Job Details Saved!!"));

                } else {
                    addActionError(getText("E_00"));
                }
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getSelected();
        }
        return SUCCESS;
    }

    public void validateEmpContactDetailInput() {

        if (null == employeeDto.getEmployee().getEmpNumber()) {
            addActionError(getText("e.entity.not.found", "Employee"));
        }
    }

    /*
    This method is used to save the employee contact details only.
    Do not mix with other employee information.
     */
    public String saveEmpContactDetail() {
        try {
            validateEmpContactDetailInput();
            if (isValidInput()) {

                if (employeeService.updateContactDetails(employeeDto.getEmployee()) != null) {
                    addActionMessage(getText("Contact Details Saved!!"));

                } else {
                    addActionError(getText("E_00"));
                }
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getSelected();
        }
        return SUCCESS;
    }

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
}
