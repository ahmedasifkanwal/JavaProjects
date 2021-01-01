package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpTerminationReason;
import com.bytes.hrm.dto.pim.EmpTerminationReasonDto;
import com.bytes.hrm.service.pim.EmpTerminationReasonService;
import com.bytes.hrm.service.pim.EmpTerminationReasonServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpTerminationReasonAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpTerminationReasonDto> {

    /**
     * @return the empTerminationReasonDto
     */
    public EmpTerminationReasonDto getEmpTerminationReasonDto() {
        return empTerminationReasonDto;
    }

    /**
     * @param empTerminationReasonDto the empTerminationReasonDto to set
     */
    public void setEmpTerminationReasonDto(EmpTerminationReasonDto empTerminationReasonDto) {
        this.empTerminationReasonDto = empTerminationReasonDto;
    }

    private EmpTerminationReasonDto empTerminationReasonDto = new EmpTerminationReasonDto();
    EmpTerminationReasonService empTerminationReasonService = new EmpTerminationReasonServiceImpl();

    public EmpTerminationReasonAction() {

        initialize();
    }

    @Override
    public EmpTerminationReasonDto getModel() {
        return this.empTerminationReasonDto;
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
            empTerminationReasonDto.setEmpTerminationReasonList(empTerminationReasonService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
    
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empTerminationReasonService.create(empTerminationReasonDto.getEmpTerminationReason()) != null) {
                    addActionMessage(getText("Reporting Method Saved!!"));
                    
                    return FORWARD;
                } else {

                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
//            getAllEmpTerminationReason();
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
    
    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {
                if (empTerminationReasonService.update(empTerminationReasonDto.getEmpTerminationReason()) != null) {
                    addActionMessage(getText("Reporting Method Saved!!"));
                    return FORWARD;
                }
            } else {

                addActionError(getText("E_00"));
            }
        }
        catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } 
        finally {
//            getAllEmpTerminationReason();
        }
        return SUCCESS;
    }

    @Override
    public String getSelected() {
    try {
            if (empTerminationReasonDto.getEmpTerminationReason().getId()> 0) {
                empTerminationReasonDto.setEmpTerminationReason(empTerminationReasonService.read((empTerminationReasonDto.getEmpTerminationReason().getId())));
            } else {
                addActionError(getText("e.entity.not.found", "EmpRepportingMethod"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
    
    public String getAllEmpTerminationReason() {
     
        return SUCCESS;
    }

}
