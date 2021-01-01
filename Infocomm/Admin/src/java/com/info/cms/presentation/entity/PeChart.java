/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.presentation.entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SALEEM
 */
public class PeChart extends PeCommon {

    private String name;
    private String title;
    private String chartId;
    private String chart;
    private String reportIconCss;
    private int total = 0;
    private PeProfileStatistics peProfileStatistics;

    private List<PeChart> peChartList = new ArrayList<PeChart>();

    public PeChart(String module, String status, String ADV_AGENCY_ID) {
        super.Pecommon(module, status, ADV_AGENCY_ID);
    }

    public PeChart() {
    }

    /**
     * @return the chart
     */
    public String getChart() {
        return chart;
    }

    /**
     * @param chart the chart to set
     */
    public void setChart(String chart) {
        this.chart = chart;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the peChartList
     */
    public List<PeChart> getPeChartList() {
        return peChartList;
    }

    /**
     * @param peChartList the peChartList to set
     */
    public void setPeChartList(List<PeChart> peChartList) {
        this.peChartList = peChartList;
    }

    /**
     * @return the chartId
     */
    public String getChartId() {
        return chartId;
    }

    /**
     * @param chartId the chartId to set
     */
    public void setChartId(String chartId) {
        this.chartId = chartId;
    }

    /**
     * @return the reportIconCss
     */
    public String getReportIconCss() {
        return reportIconCss;
    }

    /**
     * @param reportIconCss the reportIconCss to set
     */
    public void setReportIconCss(String reportIconCss) {
        this.reportIconCss = reportIconCss;
    }

    /**
     * @return the total
     */
    public int getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * @return the peProfileStatistics
     */
    public PeProfileStatistics getPeProfileStatistics() {
        return peProfileStatistics;
    }

    /**
     * @param peProfileStatistics the peProfileStatistics to set
     */
    public void setPeProfileStatistics(PeProfileStatistics peProfileStatistics) {
        this.peProfileStatistics = peProfileStatistics;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

}
