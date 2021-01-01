/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.orgnaization;

import com.bytes.hrm.dto.pim.*;
import com.bytes.hrm.dao.entity.Location;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class LocationDto  implements  Serializable{

    /**
     * @return the location
     */
    public Location getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(Location location) {
        this.location = location;
    }

    /**
     * @return the locationList
     */
    public List<Location> getLocationList() {
        return locationList;
    }

    /**
     * @param locationList the locationList to set
     */
    public void setLocationList(List<Location> locationList) {
        this.locationList = locationList;
    }
    
   private Location location=new Location();   
   private List<Location> locationList=new ArrayList<>();
    
}
