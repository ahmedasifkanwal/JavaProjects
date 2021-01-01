/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.common;

import com.bytes.hrm.dao.entity.Country;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class DayLengthDto  implements  Serializable{

    /**
     * @return the lengthHours
     */
    public int getLengthHours() {
        return lengthHours;
    }

    /**
     * @param lengthHours the lengthHours to set
     */
    public void setLengthHours(int lengthHours) {
        this.lengthHours = lengthHours;
    }

    /**
     * @return the holiddayLength
     */
    public String getHoliddayLength() {
        return holiddayLength;
    }

    /**
     * @param holiddayLength the holiddayLength to set
     */
    public void setHoliddayLength(String holiddayLength) {
        this.holiddayLength = holiddayLength;
    }

   
    private int lengthHours;
    private String holiddayLength;
    
}
