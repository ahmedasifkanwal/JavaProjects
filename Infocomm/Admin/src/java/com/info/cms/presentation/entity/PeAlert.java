/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author naeem
 */
public class PeAlert implements Serializable {

  
    private List<PeAlert> peAlertList = new ArrayList<PeAlert>();
    private String iconName;
    private String iconColor;
    private String message;
    private String type;
    private String typeClass;

    /**
     * @return the iconName
     */
    public String getIconName() {
        return iconName;
    }

    /**
     * @param iconName the iconName to set
     */
    public void setIconName(String iconName) {
        this.iconName = iconName;
    }

    /**
     * @return the iconColor
     */
    public String getIconColor() {
        return iconColor;
    }

    /**
     * @param iconColor the iconColor to set
     */
    public void setIconColor(String iconColor) {
        this.iconColor = iconColor;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the typeClass
     */
    public String getTypeClass() {
        return typeClass;
    }

    /**
     * @param typeClass the typeClass to set
     */
    public void setTypeClass(String typeClass) {
        this.typeClass = typeClass;
    }

    /**
     * @return the peAlertList
     */
    public List<PeAlert> getPeAlertList() {
        return peAlertList;
    }

    /**
     * @param peAlertList the peAlertList to set
     */
    public void setPeAlertList(List<PeAlert> peAlertList) {
        this.peAlertList = peAlertList;
    }


    
    
}
