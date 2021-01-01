/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.time;

import com.bytes.hrm.dao.entity.Project;
import com.bytes.hrm.dao.factory.DAOFactory;
import java.util.List;


/**
 *
 * @author Shahid
 */
public class ProjectServiceImpl implements ProjectService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
  //  EducationDao dao = factory.getEducationDao();

    @Override
    public Project create(Project t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Project read(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Project update(Project t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Project> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
  
    

}
