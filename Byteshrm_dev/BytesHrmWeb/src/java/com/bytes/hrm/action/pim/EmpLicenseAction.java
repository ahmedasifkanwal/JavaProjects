
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.Employee;
import com.bytes.hrm.dto.pim.EmpLicenseDto;
import com.bytes.hrm.service.pim.EmpLicenseService;
import com.bytes.hrm.service.pim.EmpLicenseServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpLicenseAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpLicenseDto> {

    /**
     * @return the empLicenseDto
     */
    public EmpLicenseDto getEmpLicenseDto() {
        return empLicenseDto;
    }

    /**
     * @param empLicenseDto the empLicenseDto to set
     */
    public void setEmpLicenseDto(EmpLicenseDto empLicenseDto) {
        this.empLicenseDto = empLicenseDto;
    }
    
    private EmpLicenseDto empLicenseDto = new EmpLicenseDto();
    EmpLicenseService empLicenseService = new EmpLicenseServiceImpl();
    
    public EmpLicenseAction() {
        
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
        //  if (StringHelper.isNullOrEmpty(empLicenseDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        //  }

        //  if (StringHelper.isNullOrEmpty(empLicenseDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        // addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //  }
        // if (StringHelper.isNullOrEmpty(empLicenseDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        //     addFieldError("ebsalBasicSalary", "Currency Required.");
        //}
    }
    
    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                //Value needs to map as screen only map license.id
                empLicenseDto.getEmpLicense().getEmpLicensePK().setLicenseId(empLicenseDto.getEmpLicense().getLicense().getId());
                if (empLicenseService.create(empLicenseDto.getEmpLicense()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("License Information Saved!!"));
                    
                }
            }
            
        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
            
        } finally {
            getAllEmpLicense();
        }
        
        return SUCCESS;
    }
    
    @Override
    public void validateEditInput() {
        //if (StringHelper.isNullOrEmpty(empLicenseDto.getEmpBasicsalary().getSalaryComponent())) {
        // addFieldError("salaryComponent", "Salary Component Required.");
        ///   }

        //  if (StringHelper.isNullOrEmpty(empLicenseDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        //      addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        //  }
        /// if (StringHelper.isNullOrEmpty(empLicenseDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        ///     addFieldError("ebsalBasicSalary", "Currency Required.");
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
                
                if (empLicenseService.update(empLicenseDto.getEmpLicense()) != null) {
                    addActionMessage(getText("License Information Saved!!"));
                    
                } else {
                    
                    addActionError(getText("E_00"));
                }
                
            }
            
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getAllEmpLicense();
        }
        return SUCCESS;
    }
    
    @Override
    public EmpLicenseDto getModel() {
        return this.empLicenseDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {
            
            if (empLicenseDto.getEmpLicense().getEmpLicensePK().getLicenseId() > 0) {
                empLicenseDto.setEmpLicense(empLicenseService.read(empLicenseDto.getEmpLicense().getEmpLicensePK().getLicenseId()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpLicense"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
            
        }
        return SUCCESS;
    }
    
    public String getAllEmpLicense() {
        try {
            
            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                Employee employee = new Employee(new Integer(request.getParameter("empNumber")));
                empLicenseDto.getEmpLicense().setEmployee(employee);
            }
            
            if (empLicenseDto.getEmpLicense().getEmployee().getEmpNumber() > 0) {
                empLicenseDto.setEmpLicenseList(empLicenseService.readByEmpNumber(empLicenseDto.getEmpLicense().getEmployee().getEmpNumber()));
            } else {
                addActionError(getText("e.entity.not.found", "EmpLicense"));
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
            
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
            
        }
        return SUCCESS;
    }
}
