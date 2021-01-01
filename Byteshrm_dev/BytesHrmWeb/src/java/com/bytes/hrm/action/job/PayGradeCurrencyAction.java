/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.action.job;

import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dao.entity.PayGradeCurrencyPK;
import com.bytes.hrm.dto.job.PayGradeCurrencyDto;
import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;
import com.bytes.hrm.service.job.PayGradeCurrencyService;
import com.bytes.hrm.service.job.PayGradeCurrencyServiceImpl;
import com.bytes.hrm.service.job.PayGradeService;
import com.bytes.hrm.service.job.PayGradeServiceImpl;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

/**
 *
 * @author Saleem
 */
public final class PayGradeCurrencyAction extends MyActionSupport implements MyOperation,
        ModelDriven<PayGradeCurrencyDto> {

    private PayGradeCurrencyDto payGradeCurrencyDto = new PayGradeCurrencyDto();
    PayGradeCurrencyService payGradeCurrencyService = new PayGradeCurrencyServiceImpl();
    PayGradeService payGradeDtoService = new PayGradeServiceImpl();

    public PayGradeCurrencyAction() {

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
            // payGradeCurrencyDto.setPayGradeCurrencyList(payGradeCurrencyService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {

        if (payGradeCurrencyDto.getPayGradeCurrency().getPayGrade().getId() == 0) {
            addActionMessage("Pay Grade Not Selected");
        }

        if (StringHelper.isNullOrEmptyObject(payGradeCurrencyDto.getPayGradeCurrency().getMinSalary())) {
            addFieldError("mixSalary", "Min Salary Required.");
        }

        if (StringHelper.isNullOrEmptyObject(payGradeCurrencyDto.getPayGradeCurrency().getMaxSalary())) {
            addFieldError("maxSalary", "Max Salary Required.");
        }

        if (StringHelper.isNullOrEmpty(payGradeCurrencyDto.getPayGradeCurrency().getCurrencyType().getCurrencyId())) {
            addFieldError("currencyId", "Max Salary Required.");
        }
    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (payGradeCurrencyService.create(payGradeCurrencyDto.getPayGradeCurrency()) != null) {

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
        if (payGradeCurrencyDto.getPayGradeCurrency().getPayGrade().getId() == 0) {
            addActionMessage("Pay Grade Not Selected");
        }

        if (StringHelper.isNullOrEmptyObject(payGradeCurrencyDto.getPayGradeCurrency().getMinSalary())) {
            addFieldError("mixSalary", "Min Salary Required.");
        }

        if (StringHelper.isNullOrEmptyObject(payGradeCurrencyDto.getPayGradeCurrency().getMaxSalary())) {
            addFieldError("maxSalary", "Max Salary Required.");
        }

        if (StringHelper.isNullOrEmpty(payGradeCurrencyDto.getPayGradeCurrency().getCurrencyType().getCurrencyId())) {
            addFieldError("currencyId", "Max Salary Required.");
        }
    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (payGradeCurrencyService.update(payGradeCurrencyDto.getPayGradeCurrency()) != null) {

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
    public PayGradeCurrencyDto getModel() {
        return this.payGradeCurrencyDto;
    }

    @Override
    public String getSelected() {
        try {

            if (!StringHelper.isNullOrEmpty(request.getParameter("paygradesid"))) {
                String paygradesid = (request.getParameter("paygradesid"));
                payGradeCurrencyDto.getPayGradeCurrency().setPayGrade(payGradeDtoService.read(new Integer(paygradesid)));
                payGradeCurrencyDto.getPayGradeCurrency().getPayGrade().setId(new Integer(paygradesid));

            }

            if (!StringHelper.isNullOrEmpty(request.getParameter("currencyid"))) {
                String id = (request.getParameter("currencyid"));

                PayGradeCurrencyPK payGradeCurrencyPK = new PayGradeCurrencyPK();
                payGradeCurrencyPK.setCurrencyId(id);
                payGradeCurrencyPK.setPayGradeId(new Integer(request.getParameter("paygradesid")));
                payGradeCurrencyDto.setPayGradeCurrency(payGradeCurrencyService.read(payGradeCurrencyPK));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the payGradeCurrencyDto
     */
    public PayGradeCurrencyDto getPayGradeCurrencyDto() {
        return payGradeCurrencyDto;
    }

    /**
     * @param payGradeCurrencyDto the payGradeCurrencyDto to set
     */
    public void setPayGradeCurrencyDto(PayGradeCurrencyDto payGradeCurrencyDto) {
        this.payGradeCurrencyDto = payGradeCurrencyDto;
    }
}
