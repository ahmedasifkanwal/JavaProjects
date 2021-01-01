/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.time;

import com.bytes.hrm.dao.entity.Project;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class ProjectDto implements Serializable {

    /**
     * @return the project
     */
    public Project getProject() {
        return project;
    }

    /**
     * @param project the project to set
     */
    public void setProject(Project project) {
        this.project = project;
    }

    /**
     * @return the projectList
     */
    public List<Project> getProjectList() {
        return projectList;
    }

    /**
     * @param projectList the projectList to set
     */
    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }

   
  
    private Project project = new Project();
    private List<Project> projectList = new ArrayList<>();

}
