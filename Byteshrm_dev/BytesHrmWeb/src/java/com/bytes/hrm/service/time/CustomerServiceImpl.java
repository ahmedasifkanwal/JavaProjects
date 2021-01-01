/*
 * To change this license header, choose License Headers in Customer Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.time;

import com.bytes.hrm.dao.entity.Customer;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.time.CustomerDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class CustomerServiceImpl implements CustomerService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    CustomerDao dao = factory.getCustomerDao();

    @Override
    public Customer create(Customer t) {

        return dao.create(t);
    }

    @Override
    public Customer read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Customer update(Customer t) {
        return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public List<Customer> findAll() {
        return dao.findAll();
    }

}
