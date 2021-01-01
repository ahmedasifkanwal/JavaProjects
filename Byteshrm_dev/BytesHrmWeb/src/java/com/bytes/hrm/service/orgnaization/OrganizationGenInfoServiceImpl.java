/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.orgnaization;


import com.bytes.hrm.dao.entity.OrganizationGenInfo;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.orgnaization.OrganizationGenInfoDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class OrganizationGenInfoServiceImpl implements OrganizationGenInfoService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    OrganizationGenInfoDao dao = factory.getOrganizationGenInfoDao();

    @Override
    public OrganizationGenInfo create(OrganizationGenInfo t) {
        return dao.create(t);
        
    }

    @Override
    public OrganizationGenInfo read(Integer id) {
        return dao.read(id);
    }

    @Override
    public OrganizationGenInfo update(OrganizationGenInfo t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<OrganizationGenInfo> findAll() {
        return dao.findAll();
    }

   
    

}
