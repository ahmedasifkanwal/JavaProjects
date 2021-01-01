package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpPassport;

import com.bytes.hrm.dto.pim.EmployeeDto;

import com.bytes.hrm.service.pim.EmpPassportService;
import com.bytes.hrm.service.pim.EmpPassportServiceImpl;
import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.util.HashMap;
import java.util.Map;

public final class EmpPassportAction extends MyActionSupport implements MyOperation,
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
    EmpPassportService empPassportService = new EmpPassportServiceImpl();
    EmployeeService employeeService = new EmployeeServiceImpl();

    public EmpPassportAction() {

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
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpPassport().getEpPassportNum())) {
            addFieldError("epPassportNum", "Passport Number Required.");
        }

        // if (StringHelper.isNullOrEmptyObject(employeeDto.getEmpPassport().getEpPassportissueddate())) {
        //  addFieldError("epPassportissueddate", "Passport Issued Date Required.");
        //  }
        // if (StringHelper.isNullOrEmptyObject(employeeDto.getEmpPassport().getEpPassportexpiredate())) {
        /// addFieldError("epPassportexpiredate", "Passport Expire Date Required.");
        ///}
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empPassportService.create(employeeDto.getEmpPassport()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Imigration Information Saved!!"));
                    employeeDto.setEmpPassport(new EmpPassport());

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getEmpImmigrations();
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

                if (empPassportService.update(employeeDto.getEmpPassport()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getEmpImmigrations();
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

            if (employeeDto.getEmpPassport().getEmpPassportPK().getEpSeqno() > 0) {
                employeeDto.setEmpPassport(empPassportService.read(employeeDto.getEmpPassport().getEmpPassportPK().getEpSeqno()));
            } else if (!StringHelper.isNullOrEmpty(request.getParameter("epSeqno"))) {
                String id = (request.getParameter("epSeqno"));
                employeeDto.setEmpPassport(empPassportService.read(new Integer(id)));
            } else {
                addActionError(getText("e.entity.not.found", "EmpPassport"));
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getEmpImmigrations() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                employeeDto.getEmployee().setEmpNumber(new Integer(request.getParameter("empNumber")));
            }
            if (employeeDto.getEmployee().getEmpNumber() > 0) {
               // employeeDto.setEmployee(employeeService.read(employeeDto.getEmployee().getEmpNumber()));
               
               EmpPassportService service = new  EmpPassportServiceImpl();
                Map<String, Object> m = new HashMap<>();
                m.put("o.empPassportPK.empNumber", employeeDto.getEmployee().getEmpNumber());
                employeeDto.getEmployee().setEmpPassportCollection(service.search(m));
               
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
