/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.report.graph.facade;

import com.info.cms.facade.ReportConfigurationFacade;
import com.info.cms.helper.StaticResource;
import com.info.cms.presentation.entity.PeChart;
import com.info.wifi.cms.entity.ReportConfiguration;
import java.io.FileNotFoundException;
import java.util.List;

/**
 *
 * @author SALEEM
 */
public class ChartFacade {

    public void createDashboard(PeChart peChart) throws FileNotFoundException {

        List<  ReportConfiguration> reportCon = new ReportConfigurationFacade().getDashboardByRole(peChart.getAuthority_id());
        if (reportCon != null && reportCon.size() > 0) {
            for (ReportConfiguration conf : reportCon) {
                List list = null;
                com.info.wifi.cms.entity.controller.GenericJpaController cmsFacade = new com.info.wifi.cms.entity.controller.GenericJpaController();
                com.info.wifi.rad.entity.controller.GenericJpaController radFacade = new com.info.wifi.rad.entity.controller.GenericJpaController();

                if (conf.getCode().contains("_RADIATOR")) {
                    list = radFacade.getAggDynamicReport(conf.getSelectSql());
                } else {
                    list = cmsFacade.getAggDynamicReport(conf.getSelectSql());
                }
                StaticResource.buildCharts(list, conf, peChart);
            }

        }

    }

}
