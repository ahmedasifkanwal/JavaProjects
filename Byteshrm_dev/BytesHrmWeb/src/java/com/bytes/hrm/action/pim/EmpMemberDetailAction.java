package com.bytes.hrm.action.pim;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.EmpBasicsalary;
import com.bytes.hrm.dao.entity.EmpMemberDetailPK;
import com.bytes.hrm.dto.pim.EmpMemberDetailDto;
import com.bytes.hrm.service.pim.EmpMemberDetailService;
import com.bytes.hrm.service.pim.EmpMemberDetailServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class EmpMemberDetailAction extends MyActionSupport implements MyOperation,
        ModelDriven<EmpMemberDetailDto> {

    /**
     * @return the empMemberDetailDto
     */
    public EmpMemberDetailDto getEmpMemberDetailDto() {
        return empMemberDetailDto;
    }

    /**
     * @param empMemberDetailDto the empMemberDetailDto to set
     */
    public void setEmpMemberDetailDto(EmpMemberDetailDto empMemberDetailDto) {
        this.empMemberDetailDto = empMemberDetailDto;
    }

    private EmpMemberDetailDto empMemberDetailDto = new EmpMemberDetailDto();
    private EmpMemberDetailService empMemberDetailService = new EmpMemberDetailServiceImpl();

    public EmpMemberDetailAction() {

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

        // if (StringHelper.isNullOrEmpty(empMemberDetailDto.getEmpMemberDetail().getEmpMemberDetailPK())) {
        //  addFieldError("salaryComponent", "Salary Component Required.");
        //  }
        //  if (StringHelper.isNullOrEmpty(empMemberDetailDto.getEmpBasicsalary().getEbsalBasicSalary())) {
        //    //  addFieldError("ebsalBasicSalary", "Salary Amount Required.");
        // }
        // if (StringHelper.isNullOrEmpty(empMemberDetailDto.getEmpBasicsalary().getCurrencyId().getCurrencyId())) {
        //      //addFieldError("ebsalBasicSalary", "Currency Required.");
        // }
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {
                if (empMemberDetailService.create(empMemberDetailDto.getEmpMemberDetail()) == null) {
                    addActionError(getText("E_00"));
                } else {
                    addActionMessage(getText("Member Details Information Saved!!"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        } finally {
            getAllEmpMemberDetail();
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

                if (empMemberDetailService.update(empMemberDetailDto.getEmpMemberDetail()) != null) {
                    addActionMessage(getText("Member Detail Information Saved!!"));

                } else {

                    addActionError(getText("E_00"));
                }

            }

        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);
        } finally {
            getAllEmpMemberDetail();
        }
        return SUCCESS;
    }

    @Override
    public EmpMemberDetailDto getModel() {
        return this.empMemberDetailDto;
    }

    /*
    This method fills the entity based on its ID 
    set on presentation or query string parameters.
    The page ID and querystring should have same data value.
     */
    @Override
    public String getSelected() {
        try {

            if (empMemberDetailDto.getEmpMemberDetail().getEmpMemberDetailPK().getEmpNumber() > 0
                    && empMemberDetailDto.getEmpMemberDetail().getEmpMemberDetailPK().getMembshipCode() > 0) {
                empMemberDetailDto.setEmpMemberDetail(empMemberDetailService.read(new Integer(empMemberDetailDto.getEmpMemberDetail().getEmpMemberDetailPK().getEmpNumber())));
            } else {
                addActionError(getText("e.entity.not.found", "EmpPassport"));
            }
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public String getAllEmpMemberDetail() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("empNumber"))) {
                EmpMemberDetailPK empMemberDetailPK = new EmpMemberDetailPK();
                empMemberDetailPK.setEmpNumber(new Integer(request.getParameter("empNumber")));
                empMemberDetailDto.getEmpMemberDetail().setEmpMemberDetailPK(empMemberDetailPK);
            }
            if (empMemberDetailDto.getEmpMemberDetail().getEmpMemberDetailPK().getEmpNumber() > 0) {
                empMemberDetailDto.setEmpMemberDetailList(empMemberDetailService.readByEmpNumber(empMemberDetailDto.getEmpMemberDetail().getEmpMemberDetailPK().getEmpNumber()));

            } else {
                addActionError(getText("e.entity.not.found", "EmpMemberDetail"));
            }
        } catch (NumberFormatException ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }
}
