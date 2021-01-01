/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.leave;

import com.bytes.hrm.dao.entity.WorkWeek;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class WorkWeekDto implements Serializable {

    /**
     * @return the workWeek
     */
    public WorkWeek getWorkWeek() {
        return workWeek;
    }

    /**
     * @param workWeek the workWeek to set
     */
    public void setWorkWeek(WorkWeek workWeek) {
        this.workWeek = workWeek;
    }

    /**
     * @return the workWeekList
     */
    public List<WorkWeek> getWorkWeekList() {
        return workWeekList;
    }

    /**
     * @param workWeekList the workWeekList to set
     */
    public void setWorkWeekList(List<WorkWeek> workWeekList) {
        this.workWeekList = workWeekList;
    }

    private WorkWeek workWeek = new WorkWeek();
    private List<WorkWeek> workWeekList = new ArrayList<>();

}
