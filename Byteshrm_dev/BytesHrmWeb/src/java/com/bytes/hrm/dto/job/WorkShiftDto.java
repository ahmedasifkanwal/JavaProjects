/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.job;

import com.bytes.hrm.dao.entity.WorkShift;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class WorkShiftDto  implements  Serializable{

  
    

    
    /**
     * @return the workShift
     */
    public WorkShift getWorkShift() {
        return workShift;
    }

    /**
     * @param workShift the workShift to set
     */
    public void setWorkShift(WorkShift workShift) {
        this.workShift = workShift;
    }

    /**
     * @return the workShiftList
     */
    public List<WorkShift> getWorkShiftList() {
        return workShiftList;
    }

    /**
     * @param workShiftList the workShiftList to set
     */
    public void setWorkShiftList(List<WorkShift> workShiftList) {
        this.workShiftList = workShiftList;
    }

    
   private WorkShift workShift=new WorkShift();   
   private List<WorkShift> workShiftList=new ArrayList<>();
  
    
    
}
