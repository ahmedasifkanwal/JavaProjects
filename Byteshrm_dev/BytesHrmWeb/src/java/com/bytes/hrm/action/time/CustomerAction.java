package com.bytes.hrm.action.time;



import com.bytes.hrm.action.system.MyActionSupport;
import com.bytes.hrm.action.system.MyOperation;


import com.bytes.hrm.common.db.helper.StringHelper;
import com.bytes.hrm.dto.common.RefDto;
import com.bytes.hrm.dto.time.CustomerDto;
import com.bytes.hrm.service.time.CustomerService;
import com.bytes.hrm.service.time.CustomerServiceImpl;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;

public final class CustomerAction extends MyActionSupport implements MyOperation,
         ModelDriven<CustomerDto> {

    private CustomerDto customerDto = new CustomerDto();
   CustomerService customerService = new CustomerServiceImpl();

    public CustomerAction() {

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
            customerDto.setCustomerList(customerService.findAll());
            return SUCCESS;
        } catch (Exception ex) {
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    @Override
    public void validateSaveInput() {
//        if (StringHelper.isNullOrEmpty(customerDto.getCustomer().getName())) {
//            addFieldError("customer", "Leave Type Required.");
//        }
      

    }

    @Override
    public String save() {
        try {
            validateSaveInput();
            if (isValidInput()) {

                if (customerService.create(customerDto.getCustomer()) != null) {
                    return FORWARD;
                } else {
                    addActionError(getText("E_00"));

                }
            }

        } catch (Exception ex) {
            addActionError("There is Exception,operation not completed.");
            saveException(this.getClass().getSimpleName() + ":" + new Object() {
            }.getClass().getEnclosingMethod().getName(), ex);

        }finally
        {
          new RefDto().resetReferenceData(customerDto.getCustomer().getClass());
        }

        return SUCCESS;
    }

    @Override
    public void validateEditInput() {
//        if (StringHelper.isNullOrEmpty(customerDto.getCustomer().getName())) {
//            addFieldError("customer", "Leave Type Required.");
//        }
      
// THIS ONE
//        if (customerDto.getCustomer().getId() == 0) {
//            addActionError("Job Title Not Found.");
//        }

    }

    @Override
    public String edit() {
        try {
            validateEditInput();
            if (isValidInput()) {

                if (customerService.update(customerDto.getCustomer()) != null) {

                    return FORWARD;

                } else {
                    addActionError(getText("E_00"));
                }
            }

        } catch (Exception ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            /// }.getClass().getEnclosingMethod().getName(), ex);
        }finally
        {
          new RefDto().resetReferenceData(customerDto.getCustomer().getClass());
        }
        return SUCCESS;
    }

    @Override
    public CustomerDto getModel() {
        return this.customerDto;
    }

    @Override
    public String getSelected() {
        try {
            if (!StringHelper.isNullOrEmpty(request.getParameter("id"))) {
                String id = (request.getParameter("id"));
                customerDto.setCustomer(customerService.read(new Integer(id)));

            }
        } catch (NumberFormatException ex) {
            /// saveException(this.getClass().getSimpleName() + ":" + new Object() {
            // }.getClass().getEnclosingMethod().getName(), ex);

        }
        return SUCCESS;
    }

    /**
     * @return the customerDto
     */
    public CustomerDto getCustomerDto() {
        return customerDto;
    }

    /**
     * @param customerDto the customerDto to set
     */
    public void setCustomerDto(CustomerDto customerDto) {
        this.customerDto = customerDto;
    }
}
