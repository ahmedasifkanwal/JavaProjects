/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.report.graph;


import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SALEEM
 */
public class UIPieChartData {

    public String seriesdata = "";
    public List labelData = new ArrayList();
    public int recordCount = 0;
    public int total = 0;

    public void setChart() {
        StringBuilder dataPoint = new StringBuilder("");
        if (labelData != null && labelData.size() > 0) {
            if (recordCount == 0) {
                recordCount = labelData.size();
            }
            for (int j = 0; j < recordCount; j++) {
                Object[] data = (Object[]) labelData.get(j);
                dataPoint.append("['").append(data[0]).append("',")
                        .append(data[1]).append("],");

                total = total + Integer.parseInt(data[1].toString().trim());
            }

        }
        seriesdata = dataPoint.toString();

    }

}
