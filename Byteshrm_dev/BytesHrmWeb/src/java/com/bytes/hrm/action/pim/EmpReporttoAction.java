package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpBasicsalary;
import com.bytes.hrm.dao.entity.EmpReportto;
import com.bytes.hrm.dto.pim.EmployeeDto;

import com.bytes.hrm.service.pim.EmpReporttoService;
import com.bytes.hrm.service.pim.EmpReporttoServiceImpl;
import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpReporttoAction extends MyActionSupport implements MyOperation,
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

    EmpReporttoService empReporttoService = new EmpReporttoServiceImpl();

    public EmpReporttoAction() {

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

        if (StringHelper.isNullOrEmpty(employeeDto.getEmpReportto().getEmployee().getEmpFirstname())) {
            addFieldError("empFirstname", "Manager First Name Required.");
        }

        if (employeeDto.getEmpReportto().getEmpReporttoPK() == null
                || employeeDto.getEmpReportto().getEmpReporttoPK().getErepSupEmpNumber() == 0) {
            
            employeeDto.getEmpReportto().getEmployee().setEmpNumber(employeeDto.getEmpReportto().getEmpReporttoPK().getErepSupEmpNumber());
            addFieldError("empNumber", "Manager Required.");
        }
        if (employeeDto.getEmpReportto().getEmpReporttoPK()== null
                || employeeDto.getEmpReportto().getEmpReporttoPK().getErepReportingMode() == 0) {
            addFieldError("reportingMethodId", "Reporting Method Required.");
        }

//1
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpReportto().getEmployee1().getEmpFirstname())) {
            addFieldError("empFirstname1", "Subordinate First Name Required.");
        }

        if (employeeDto.getEmpReportto().getEmpReporttoPK() == null
                || employeeDto.getEmpReportto().getEmpReporttoPK().getErepSubEmpNumber() == 0) {
            addFieldError("empNumber1", "Subordinate Required.");
        }
        

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                 
            employeeDto.getEmpReportto().getEmployee().setEmpNumber(employeeDto.getEmpReportto().getEmpReporttoPK().getErepSupEmpNumber());
            
            employeeDto.getEmpReportto().getEmployee1().setEmpNumber(employeeDto.getEmpReportto().getEmpReporttoPK().getErepSubEmpNumber());
           
                
                
                if (empReporttoService.create(employeeDto.getEmpReportto()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Subordinate Information Saved!!"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getReporting();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {

    }

    /*
    Editing empPassport core information
     */
    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (empReporttoService.update(employeeDto.getEmpReportto()) != null) {
                    addActionMessage(getText("Salary Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getReporting();
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
//empReportto.empReporttoPK.erepSupEmpNumber
            if (employeeDto.getEmpReportto().getEmpReporttoPK().getErepSubEmpNumber() > 0) {
                employeeDto.setEmpReportto(empReporttoService.read(employeeDto.getEmpReportto().getEmpReporttoPK()
                        .getErepSubEmpNumber()));

            } else if (!StringHelper.isNullOrEmpty(request.getParameter("epSeqno"))) {
                String id = (request.getParameter("epSeqno"));
                employeeDto.setEmpReportto(empReporttoService.read(new Integer(id)));
            } else {
                addActionError(getText("e.entity.not.found", "EmpPassport"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getReporting() {
        try {

            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                employeeDto.getEmployee().setEmpNumber(new Integer(request.getParameter("empNumber")));
            }

            if (employeeDto.getEmployee().getEmpNumber() > 0) {
                employeeDto.setEmployee(employeeService.read(employeeDto.getEmployee().getEmpNumber()));
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
