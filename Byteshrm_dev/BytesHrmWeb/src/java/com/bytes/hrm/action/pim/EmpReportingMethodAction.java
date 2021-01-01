package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpReportingMethod;
import com.bytes.hrm.dto.pim.EmpReportingMethodDto;
import com.bytes.hrm.service.pim.EmpReportingMethodService;
import com.bytes.hrm.service.pim.EmpReportingMethodServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpReportingMethodAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpReportingMethodDto> {

    /**
     * @return the empReportingMethodDto
     */
    public EmpReportingMethodDto getEmpReportingMethodDto() {
        return empReportingMethodDto;
    }

    /**
     * @param empReportingMethodDto the empReportingMethodDto to set
     */
    public void setEmpReportingMethodDto(EmpReportingMethodDto empReportingMethodDto) {
        this.empReportingMethodDto = empReportingMethodDto;
    }

    private EmpReportingMethodDto empReportingMethodDto = new EmpReportingMethodDto();
    EmpReportingMethodService empReportingMethodService = new EmpReportingMethodServiceImpl();

    public EmpReportingMethodAction() {

        initialize();
    }

    @Override
    public EmpReportingMethodDto getModel() {
        return this.empReportingMethodDto;
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
            empReportingMethodDto.setEmpReportingMethodList(empReportingMethodService.findAll());
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
                if (empReportingMethodService.create(empReportingMethodDto.getEmpReportingMethod()) != null) {
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
//            getAllEmpReportingMethod();
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
                if (empReportingMethodService.update(empReportingMethodDto.getEmpReportingMethod()) != null) {
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
//            getAllEmpReportingMethod();
        }
        return SUCCESS;
    }

    @Override
    public String getSelected() {
    try {
            if (empReportingMethodDto.getEmpReportingMethod().getReportingMethodId() > 0) {
                empReportingMethodDto.setEmpReportingMethod(empReportingMethodService.read((empReportingMethodDto.getEmpReportingMethod().getReportingMethodId())));
            } else {
                addActionError(getText("e.entity.not.found", "EmpRepportingMethod"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
    
    public String getAllEmpReportingMethod() {
     
        return SUCCESS;
    }

}
