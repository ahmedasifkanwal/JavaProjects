package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpEmergencyContacts;

import com.bytes.hrm.dto.pim.EmployeeDto;

import com.bytes.hrm.service.pim.EmpEmergencyContactsService;
import com.bytes.hrm.service.pim.EmpEmergencyContactsServiceImpl;
import com.bytes.hrm.service.pim.EmployeeService;
import com.bytes.hrm.service.pim.EmployeeServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.util.HashMap;
import java.util.Map;

public final class EmpEmergencyContactsAction extends MyActionSupport implements MyOperation,
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
    EmpEmergencyContactsService empEmergencyContactsService = new EmpEmergencyContactsServiceImpl();
    EmployeeService employeeService = new EmployeeServiceImpl();

    public EmpEmergencyContactsAction() {

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
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpEmergencyContacts().getEecName())) {
            addFieldError("eecName", "Name Required.");
        }
        if (StringHelper.isNullOrEmpty(employeeDto.getEmpEmergencyContacts().getEecRelationship())) {
            addFieldError("eecRelationship", "Relationship Required.");
        }

        if (null == employeeDto.getEmployee().getEmpNumber()) {
            addActionError(getText("e.entity.not.found", "Employee"));
        }

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empEmergencyContactsService.create(employeeDto.getEmpEmergencyContacts()) != null) {
                    addActionMessage(getText("Emergency Contact Information Saved!!"));
                    employeeDto.setEmpEmergencyContacts(new EmpEmergencyContacts());

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getEmergencyContacts();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {

    }

    /*
    Editing empEmergencyContacts core information
     */
    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (empEmergencyContactsService.update(employeeDto.getEmpEmergencyContacts()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getEmergencyContacts();
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

            if (  employeeDto.getEmpEmergencyContacts()!=null && employeeDto.getEmpEmergencyContacts().getEmpEmergencyContactsPK()!=null && employeeDto.getEmpEmergencyContacts().getEmpEmergencyContactsPK().getEecSeqno() > 0) {
                employeeDto.setEmpEmergencyContacts(empEmergencyContactsService.read(employeeDto.getEmpEmergencyContacts().getEmpEmergencyContactsPK().getEecSeqno()));
            } else if (!StringHelper.isNullOrEmpty(request.getParameter("eecSeqno"))) {
                String id = (request.getParameter("eecSeqno"));
                employeeDto.setEmpEmergencyContacts(empEmergencyContactsService.read(new Integer(id)));
            } else {
                addActionError(getText("e.entity.not.found", "EmpEmergencyContacts"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getEmergencyContacts() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                employeeDto.getEmployee().setEmpNumber(new Integer(request.getParameter("empNumber")));
            }

            if (employeeDto.getEmployee().getEmpNumber() > 0) {
                // employeeDto.setEmployee(employeeService.read(employeeDto.getEmployee().getEmpNumber()));
               //Fetch valuse back
                EmpEmergencyContactsService service = new EmpEmergencyContactsServiceImpl();
                Map<String, Object> m = new HashMap<String, Object>();
                m.put("o.empEmergencyContactsPK.empNumber", employeeDto.getEmployee().getEmpNumber());
                employeeDto.getEmployee().setEmpEmergencyContactsCollection(service.search(m));

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
