/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.info.cms.helper;


import com.info.cms.facade.ReportConfigurationFacade;
import com.info.wifi.cms.entity.ReportConfiguration;
import java.util.Map;

/**
 *
 * @author SALEEM
 */
public class ReportFilter {
    public static Map<Integer, ReportConfiguration> COMMON_PROPERTY_MAP = new ReportConfigurationFacade().getReportConfigurationMap();
}
