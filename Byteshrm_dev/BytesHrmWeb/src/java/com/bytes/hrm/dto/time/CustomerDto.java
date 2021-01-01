/*
 * To change this license header, choose License Headers in Customer Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.time;

import com.bytes.hrm.dao.entity.Customer;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class CustomerDto implements Serializable {

    /**
     * @return the customer
     */
    public Customer getCustomer() {
        return customer;
    }

    /**
     * @param customer the customer to set
     */
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    /**
     * @return the customerList
     */
    public List<Customer> getCustomerList() {
        return customerList;
    }

    /**
     * @param customerList the customerList to set
     */
    public void setCustomerList(List<Customer> customerList) {
        this.customerList = customerList;
    }

   
  
    private Customer customer = new Customer();
    private List<Customer> customerList = new ArrayList<>();

}
