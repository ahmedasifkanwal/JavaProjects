/*
 * To change this license header, choose License Headers in Customer Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.time;

import com.bytes.hrm.dao.entity.Customer;
import java.util.List;


/**
 *
 * @author Shahid
 */
public interface CustomerService {
  
    Customer create(Customer t);

    Customer read(Integer id);

    Customer update(Customer t);

    void delete(Integer id);

    List<Customer> findAll();

}
