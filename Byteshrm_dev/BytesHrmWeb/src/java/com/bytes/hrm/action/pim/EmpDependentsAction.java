package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpDependents;

import com.bytes.hrm.dto.pim.EmployeeDto;

import com.bytes.hrm.service.pim.EmpDependentsService;
import com.bytes.hrm.service.pim.EmpDependentsServiceImpl;
import com.bytes.hrm.service.pim.EmpEmergencyContactsServiceImpl;
import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.util.HashMap;
import java.util.Map;

public final class EmpDependentsAction extends MyActionSupport implements MyOperation,
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
    EmpDependentsService empDependentsService = new EmpDependentsServiceImpl();
    EmployeeService employeeService = new EmployeeServiceImpl();

    public EmpDependentsAction() {

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
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpDependents().getEdName())) {
            addFieldError("edName", "Name Required.");
        }

        if (StringHelper.isNullOrEmpty(employeeDto.getEmpDependents().getEdRelationshipType())) {
            addFieldError("edRelationshipType", "Relation Type Required.");
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (empDependentsService.create(employeeDto.getEmpDependents()) != null) {
                    addActionMessage(getText("Emergency Contact Information Saved!!"));

                    employeeDto.setEmpDependents(new EmpDependents());
                } else {

                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getDependents();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpDependents().getEdName())) {
            addFieldError("edName", "Name Required.");
        }

        if (StringHelper.isNullOrEmpty(employeeDto.getEmpDependents().getEdRelationshipType())) {
            addFieldError("edRelationshipType", "Relation Type Required.");
        }

    }

    /*
    Editing empDependents core information
     */
    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (empDependentsService.update(employeeDto.getEmpDependents()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getDependents();
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

            if (employeeDto.getEmpDependents().getEmpDependentsPK().getEdSeqno() > 0) {
                employeeDto.setEmpDependents(empDependentsService.read(employeeDto.getEmpDependents().getEmpDependentsPK().getEdSeqno()));
            } else if (!StringHelper.isNullOrEmpty(request.getParameter("edSeqno"))) {
                String id = (request.getParameter("edSeqno"));
                employeeDto.setEmpDependents(empDependentsService.read(new Integer(id)));
            } else {
                addActionError(getText("e.entity.not.found", "EmpDependents"));
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getDependents() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                employeeDto.getEmployee().setEmpNumber(new Integer(request.getParameter("empNumber")));
            }
            if (employeeDto.getEmployee().getEmpNumber() > 0) {
               // employeeDto.setEmployee(employeeService.read(employeeDto.getEmployee().getEmpNumber()));
               
                EmpDependentsService service = new EmpDependentsServiceImpl();
                Map<String, Object> m = new HashMap<>();
                m.put("o.empDependentsPK.empNumber", employeeDto.getEmployee().getEmpNumber());
                employeeDto.getEmployee().setEmpDependentsCollection(service.search(m));
               
               
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
