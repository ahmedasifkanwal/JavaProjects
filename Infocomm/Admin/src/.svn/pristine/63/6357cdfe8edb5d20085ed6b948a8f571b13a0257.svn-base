/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.wifi.cms.entity.SysSettings;
import com.info.wifi.cms.entity.controller.SysSettingsJpaController;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author SALEEM
 */
public class SettingsFacade  {

    public List<SysSettings> getSetting() {
        return new SysSettingsJpaController().getSettings();

    }

    public Map<Integer, SysSettings> getSettingMap() {
        List<SysSettings> list = getSetting();
        Map<Integer, SysSettings> map = new TreeMap<Integer, SysSettings>();
        for ( int j=0; j<list.size();j++ ) {
            map.put(j, list.get(j));            
        }
        return map;
    }

   

}
