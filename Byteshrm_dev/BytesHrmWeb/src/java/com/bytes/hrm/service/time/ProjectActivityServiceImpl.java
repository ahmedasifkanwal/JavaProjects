/*
 * To change this license header, choose License Headers in Activity Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.time;

import com.bytes.hrm.dao.entity.ProjectActivity;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.time.ProjectActivityDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class ProjectActivityServiceImpl implements ProjectActivityService {

// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    ProjectActivityDao dao = factory.getProjectActivityDao();

    @Override
    public ProjectActivity create(ProjectActivity t) {
        return dao.create(t);
    }

    @Override
    public ProjectActivity read(Integer id) {
        return dao.read(id);
    }

    @Override
    public ProjectActivity update(ProjectActivity t) {
        return dao.update(t);
    }

    @Override
    public void delete(Integer id) {

        dao.delete(id);
    }

    @Override
    public List<ProjectActivity> findAll() {
        return dao.findAll();

    }

}
