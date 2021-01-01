/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.facade;

import com.info.cms.helper.UIConstants;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.SysUserDashboard;
import com.info.wifi.cms.entity.controller.ReportConfigurationJpaController;
import com.info.wifi.cms.entity.controller.SysUserDashboardJpaController;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author SALEEM
 */
public class ReportConfigurationFacade {

    public List<ReportConfiguration> getReportConfiguration() {
        return new ReportConfigurationJpaController().getReportAllConfigurations();

    }

    public Map<Integer, ReportConfiguration> getReportConfigurationMap() {
        List<ReportConfiguration> list = getReportConfiguration();
        Map<Integer, ReportConfiguration> map = new TreeMap<Integer, ReportConfiguration>();
        for (int i = 0; i < list.size(); i++) {
            map.put(i, list.get(i));
        }
        return map;
    }

    public List<ReportConfiguration> getDashboardByRole(String authority) {
        List<ReportConfiguration> list = null;

        list = new ReportConfigurationJpaController().getReportConfigurationsByConfigName("DASHBOARD");
        if (authority.equals("System")) {
            return list;
        } else {
            List<SysUserDashboard> listAuth = new SysUserDashboardJpaController().getReportConfigurationsByAuthStatus(authority, UIConstants.STATUS_CODE.ACTIVE.value);
            List<ReportConfiguration> list2 = new ArrayList<ReportConfiguration>();
            if (list != null && list.size() > 0 && listAuth != null && listAuth.size() > 0) {
                for (int u = 0; u < list.size(); u++) {
                    for (int l = 0; l < listAuth.size(); l++) {
                        if (list.get(u).getCode().equals(listAuth.get(l).getConfCode())) {
                            list2.add(list.get(u));
                            continue;

                        }

                    }

                }
                return list2;
            }

        }
        return null;

    }

    public List<ReportConfiguration> getDashboardByRole(String authority, String dashBoard) {
        List<ReportConfiguration> list = null;

        list = new ReportConfigurationJpaController().getReportConfigurationsByConfigName(dashBoard);
        if (authority.equals("System")) {
            return list;
        } else {
            List<SysUserDashboard> listAuth = new SysUserDashboardJpaController().getReportConfigurationsByAuth(authority);
            List<ReportConfiguration> list2 = new ArrayList<ReportConfiguration>();
            if (list != null && list.size() > 0 && listAuth != null && listAuth.size() > 0) {
                for (int u = 0; u < list.size(); u++) {
                    for (int l = 0; l < listAuth.size(); l++) {
                        if (list.get(u).getCode().equals(listAuth.get(l).getConfCode())) {
                            list2.add(list.get(u));
                            continue;

                        }

                    }

                }
                return list2;
            }

        }
        return null;

    }

}
