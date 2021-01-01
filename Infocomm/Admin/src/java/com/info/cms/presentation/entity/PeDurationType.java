/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

/**
 *
 * @author software1
 */
public class PeDurationType {
    
   private String durationType;
   private String displayValue;
   private String InternateTime;
   private int InternateTimeValue;

    /**
     * @return the durationType
     */
    public String getDurationType() {
        return durationType;
    }

    /**
     * @param durationType the durationType to set
     */
    public void setDurationType(String durationType) {
        this.durationType = durationType;
    }

    /**
     * @return the displayValue
     */
    public String getDisplayValue() {
        return displayValue;
    }

    /**
     * @param displayValue the displayValue to set
     */
    public void setDisplayValue(String displayValue) {
        this.displayValue = displayValue;
    }

    /**
     * @return the InternateTime
     */
    public String getInternateTime() {
        return InternateTime;
    }

    /**
     * @param InternateTime the InternateTime to set
     */
    public void setInternateTime(String InternateTime) {
        this.InternateTime = InternateTime;
    }

    /**
     * @return the InternateTimeValue
     */
    public int getInternateTimeValue() {
        return InternateTimeValue;
    }

    /**
     * @param InternateTimeValue the InternateTimeValue to set
     */
    public void setInternateTimeValue(int InternateTimeValue) {
        this.InternateTimeValue = InternateTimeValue;
    }
    
}
