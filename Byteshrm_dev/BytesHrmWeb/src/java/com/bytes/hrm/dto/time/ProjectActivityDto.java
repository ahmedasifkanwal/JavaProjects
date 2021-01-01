/*
 * To change this license header, choose License Headers in Activity Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.time;


import com.bytes.hrm.dao.entity.ProjectActivity;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class ProjectActivityDto implements Serializable {

    /**
     * @return the projectActivity
     */
    public ProjectActivity getProjectActivity() {
        return projectActivity;
    }

    /**
     * @param projectActivity the projectActivity to set
     */
    public void setProjectActivity(ProjectActivity projectActivity) {
        this.projectActivity = projectActivity;
    }

    /**
     * @return the projectActivityList
     */
    public List<ProjectActivity> getProjectActivityList() {
        return projectActivityList;
    }

    /**
     * @param projectActivityList the projectActivityList to set
     */
    public void setProjectActivityList(List<ProjectActivity> projectActivityList) {
        this.projectActivityList = projectActivityList;
    }

  
   
  
    private ProjectActivity  projectActivity = new ProjectActivity();
    private List<ProjectActivity> projectActivityList = new ArrayList<>();

}
