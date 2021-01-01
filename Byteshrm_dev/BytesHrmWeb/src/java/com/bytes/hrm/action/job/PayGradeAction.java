package com.bytes.hrm.action.job;

import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.job.PayGradeDto;
import com.bytes.hrm.service.job.PayGradeService;
import com.bytes.hrm.service.job.PayGradeServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import java.math.BigDecimal;

public final class PayGradeAction extends MyActionSupport
        implements ModelDriven<PayGradeDto> {

    private PayGradeDto payGradeDto = new PayGradeDto();
    PayGradeService payGradeDtoService = new PayGradeServiceImpl();

    public PayGradeAction() {

        initialize();
    }

    public void initialize() {

     
    }

    public void validateSearchInput() {
    }

    public String search() {
        try {
            payGradeDto.setPayGradeList(payGradeDtoService.findAll());
            
     
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    public void validateSaveInput() {
        if (StringHelper.isNullOrEmpty(payGradeDto.getPayGrade().getName())) {
            addFieldError("name", "Pay Grade Required.");
        }

    }

    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (payGradeDtoService.create(payGradeDto.getPayGrade()) != null) {
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

    public void validateEditInput() {
        if (StringHelper.isNullOrEmpty(payGradeDto.getPayGrade().getName())) {
            addFieldError("name", "Pay Grade Required.");
        }
        if (payGradeDto.getPayGrade().getId().intValue()==0) {
            addActionError("Pay Grade Not Found.");
        }
    }

    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (payGradeDtoService.update(payGradeDto.getPayGrade()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }
        return SUCCESS;
    }

    @Override
    public PayGradeDto getModel() {
        return this.payGradeDto;
    }

    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                payGradeDto.setPayGrade(payGradeDtoService.read(new Integer(id)));

            }
        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the payGradeDto
     */
    public PayGradeDto getPayGradeDto() {
        return payGradeDto;
    }

    /**
     * @param payGradeDto the payGradeDto to set
     */
    public void setPayGradeDto(PayGradeDto payGradeDto) {
        this.payGradeDto = payGradeDto;
    }
}
