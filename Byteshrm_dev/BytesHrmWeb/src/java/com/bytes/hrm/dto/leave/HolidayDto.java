/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.leave;

import com.bytes.hrm.dao.entity.Holiday;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class HolidayDto implements Serializable {

    /**
     * @return the holidayList
     */
    public List<Holiday> getHolidayList() {
        return holidayList;
    }

    /**
     * @param holidayList the holidayList to set
     */
    public void setHolidayList(List<Holiday> holidayList) {
        this.holidayList = holidayList;
    }


    /**
     * @return the holiday
     */
    public Holiday getHoliday() {
        return holiday;
    }

    /**
     * @param holiday the holiday to set
     */
    public void setHoliday(Holiday holiday) {
        this.holiday = holiday;
    }


  
    private Holiday holiday = new Holiday();
    private List<Holiday> holidayList = new ArrayList<>();

}
