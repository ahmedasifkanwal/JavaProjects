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
public class UILineChartData {

    public String x_categories = "";
    public String series_name_data = "";

    public List labelData = new ArrayList();
    public List labelName = new ArrayList();
    public int recordCount = 0;
    public int total = 0;

    public void setChart() {
        String dataDownload = ""; //"{  legendcount:'Download(MB)',data: [", dataUpload = "{legendcount:'Upload(MB)',data: [";
        if (labelData != null && labelData.size() > 0) {
            if (recordCount == 0) {
                recordCount = labelData.size();
            }
            for (int legendcount = 0; legendcount < labelName.size(); legendcount++) {
                x_categories = "";

                dataDownload = dataDownload + "{  name:'" + labelName.get(legendcount) + "',data: [";

                for (int j = 0; j < recordCount; j++) {

                    if (j < labelData.size()) {
                        Object[] data = (Object[]) labelData.get(j);

                        x_categories = x_categories + "'" + ((data[0] == null ? "NA" : data[0].toString()) + "',");

                        dataDownload = dataDownload + data[legendcount + 1] + ",";
                        total = total + Integer.parseInt(data[legendcount + 1].toString().trim());

                    }

                }
                dataDownload = dataDownload + "]},";
            }

        }
        series_name_data = dataDownload;
    }

}
