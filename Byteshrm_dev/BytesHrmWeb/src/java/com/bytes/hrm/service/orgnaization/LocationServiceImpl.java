/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.orgnaization;


import com.bytes.hrm.dao.entity.Location;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.orgnaization.LocationDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LocationServiceImpl implements LocationService {
    
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    LocationDao dao = factory.getLocationDao();

    @Override
    public Location create(Location t) {
        return dao.create(t);
        
    }

    @Override
    public Location read(Integer id) {
        return dao.read(id);
    }

    @Override
    public Location update(Location t) {
      return dao.update(t);
    }

    @Override
    public void delete(Integer id) {
          dao.delete(id);
    }

    @Override
    public List<Location> findAll() {
        return dao.findAll();
    }

   
    

}
