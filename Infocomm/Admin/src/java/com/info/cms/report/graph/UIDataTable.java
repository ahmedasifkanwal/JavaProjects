/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.report.graph;

import com.info.cms.action.MyActionSupport;
//import com.info.cms.helper.JasparReport;
import com.info.cms.helper.StringHelper;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author SALEEM
 */
public class UIDataTable extends MyActionSupport {

    public static String getTableWithTotal(List data, String columnName, String totalColumnsIndex, String columnFormat,String reportPrintRequire) {
        columnFormat = StringHelper.isNullOrEmpty(columnFormat) ? "center" : columnFormat;
        String defaultAlign = "center";
        StringBuilder header = new StringBuilder();
        if (reportPrintRequire.equalsIgnoreCase("Y")) {
            header = new StringBuilder("<div align='right'>    <span id='downloadIcon' style='display:none'>         <img alt=''  src='img/elements/loaders/6s.gif' > <b style='margin-left: 5px; margin-right: 5px;'>Processing ...</b>    </span>    <a     onclick='findpdf()'   class='btn btn-dark5 btn-gradient' >        <span class='glyphicons glyphicons-print'></span> </a> </div>");
        }
        header.append("<br/> <thead><tr  ><th  style=' width:5px; text-align:" + defaultAlign + "'>SN#</th>");
        StringBuilder rows = new StringBuilder();
        String[] columns = columnName.split(",");
        String[] columnsFormat = columnFormat.split(",");
        Double[] totalValueVariable = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
        String[] totalColumnIndex = totalColumnsIndex.split(",");
        try {
            for (String column : columns) {
                header.append(" <th style='text-align:" + defaultAlign + "'>").append(column).append("</th>");
            }
            header.append(" </tr></thead>");
            if (!data.isEmpty()) {
                rows = new StringBuilder("<tbody>");
                for (int j = 0; j < data.size(); j++) {
                    Object[] row = (Object[]) data.get(j);
                    rows.append("<tr>");
                    rows.append("<td>").append(j + 1).append("</td>");
                    for (int c = 0; c < columns.length; c++) {
                        try {
                            defaultAlign = columnsFormat[c];
                        } catch (Exception ex) {
                        }
                        if ((Arrays.asList(totalColumnIndex).contains((c + 1) + ""))) {
                            totalValueVariable[c + 1] = totalValueVariable[c + 1] + (row[c] != null ? Double.parseDouble(row[c].toString().trim().replace(",", "")) : 0.0);
                            rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c] != null && Double.parseDouble(row[c].toString().trim().replace(",", "")) > 0.0 ? row[c].toString().trim() : "0.0").append("</td>");

                        } else {
                            rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c] != null ? row[c].toString().trim() : "0.0").append("</td>");
                        }
                    }
                    rows.append("</tr>");
                }
                rows.append("<tr>");
                rows.append("<td align='right' colspan='").append(Integer.parseInt(totalColumnIndex[0])).append("' > <b>Total</b>").append("</td>");
                for (int k = 0; k < totalColumnIndex.length; k++) {
                    rows.append(" <td align='right' ><b>").append(roundTwoDecimals(totalValueVariable[Integer.parseInt(totalColumnIndex[k])])).append("</b></td>");
                }
                rows.append("</tr>");
                rows.append("</tbody>");

            }
        } catch (Exception ex) {
            String mes = ex.getMessage();
            logger.info("Exception:" + mes);
        }

        header = header.append(rows);

        return header.toString();
    }
    //The value will show in number format  without decimal point

    public static String getTableWithTotaLNumber(List data, String columnName, String totalColumnsIndex, String columnFormat, String reportPrintRequire) {
        columnFormat = StringHelper.isNullOrEmpty(columnFormat) ? "center" : columnFormat;
        String defaultAlign = "center";
        StringBuilder header = new StringBuilder();
        if (reportPrintRequire.equalsIgnoreCase("Y")) {
            header = new StringBuilder("<div align='right'>    <span id='downloadIcon' style='display:none'>         <img alt=''  src='img/elements/loaders/6s.gif' > <b style='margin-left: 5px; margin-right: 5px;'>Processing ...</b>    </span>    <a     onclick='findpdf()'   class='btn btn-dark5 btn-gradient' >        <span class='glyphicons glyphicons-print'></span> </a> </div>");
        }
        header.append("<br/> <thead><tr  ><th  style=' width:5px; text-align:" + defaultAlign + "'>SN#</th>");
        StringBuilder rows = new StringBuilder();
        String[] columns = columnName.split(",");
        String[] columnsFormat = columnFormat.split(",");
        int[] totalValueVariable = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        String[] totalColumnIndex = totalColumnsIndex.split(",");
        try {
            for (String column : columns) {
                header.append(" <th style='text-align:" + defaultAlign + "'>").append(column).append("</th>");
            }
            header.append(" </tr></thead>");
            if (!data.isEmpty()) {
                rows = new StringBuilder("<tbody>");
                for (int j = 0; j < data.size(); j++) {
                    Object[] row = (Object[]) data.get(j);
                    rows.append("<tr>");
                    rows.append("<td>").append(j + 1).append("</td>");
                    for (int c = 0; c < columns.length; c++) {
                        try {
                            defaultAlign = columnsFormat[c];
                        } catch (Exception ex) {
                        }
                        if ((Arrays.asList(totalColumnIndex).contains((c + 1) + ""))) {
                            totalValueVariable[c + 1] = totalValueVariable[c + 1] + (row[c] != null ? Integer.parseInt(row[c].toString().trim().replace(",", "")) : 0);
                            rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c] != null && Integer.parseInt(row[c].toString().trim().replace(",", "")) > 0 ? row[c].toString().trim() : "0").append("</td>");

                        } else {
                            rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c] != null ? row[c].toString().trim() : "0").append("</td>");
                        }
                    }
                    rows.append("</tr>");
                }
                rows.append("<tr>");
                rows.append("<td align='right' colspan='").append(Integer.parseInt(totalColumnIndex[0])).append("' > <b>Total</b>").append("</td>");
                for (int k = 0; k < totalColumnIndex.length; k++) {
                    rows.append(" <td align='right' ><b>").append((totalValueVariable[Integer.parseInt(totalColumnIndex[k])])).append("</b></td>");
                }
                rows.append("</tr>");
                rows.append("</tbody>");

            }
        } catch (Exception ex) {
            String mes = ex.getMessage();
            logger.info("Exception:" + mes);
        }

        header = header.append(rows);

        return header.toString();
    }

    static double roundTwoDecimals(double d) {
        DecimalFormat twoDForm = new DecimalFormat("#.##");
        return Double.valueOf(twoDForm.format(d));
    }

    public static String getFormattedTable(List data, String columnName, String columnFormat, String reportPrintRequire) {

        columnFormat = StringHelper.isNullOrEmpty(columnFormat) ? "center" : columnFormat;
        String defaultAlign = "center";
        StringBuilder header = new StringBuilder();
        if (reportPrintRequire.equalsIgnoreCase("Y")) {
            header = new StringBuilder("<div align='right'>    <span id='downloadIcon' style='display:none'>         <img alt=''  src='img/elements/loaders/6s.gif' > <b style='margin-left: 5px; margin-right: 5px;'>Processing ...</b>    </span>    <a     onclick='findpdf()'   class='btn btn-dark5 btn-gradient' >        <span class='glyphicons glyphicons-print'></span> </a> </div>");
        }
        header.append("<br/> <thead><tr  ><th  style=' width:5px; text-align:" + defaultAlign + "'>SN#</th>");
        StringBuilder rows = new StringBuilder();
        String[] columns = columnName.split(",");
        String[] columnsFormat = columnFormat.split(",");
        try {
            for (String column : columns) {
                header.append(" <th  style='text-align:").append(defaultAlign).append("' >").append(column).append("</th>");
            }
            header.append(" </tr></thead>");
            if (!data.isEmpty()) {
                rows = new StringBuilder("<tbody>");
                for (int j = 0; j < data.size(); j++) {
                    Object[] row = (Object[]) data.get(j);
                    rows.append("<tr>");
                    rows.append("<td>").append(j + 1).append("</td>");
                    for (int c = 0; c < columns.length; c++) {
                        try {
                            defaultAlign = columnsFormat[c];
                        } catch (Exception ex) {
                        }
                        rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c] != null ? row[c].toString().trim() : "").append("</td>");

                    }

                    rows.append("</tr>");
                }
                rows.append("</tbody>");

            }
        } catch (Exception ex) {
            String mes = ex.getMessage();
            logger.info("Exception:" + mes);
        }

        header = header.append(rows);
        logger.info("Table:" + header.toString());
        return header.toString();
    }

    public static String getTransactionSummaryTable(List data, String columnName, String columnFormat,String reportPrintRequire) {

        columnFormat = StringHelper.isNullOrEmpty(columnFormat) ? "center" : columnFormat;
        String defaultAlign = "center";
        StringBuilder header = new StringBuilder();
        if (reportPrintRequire.equalsIgnoreCase("Y")) {
            header = new StringBuilder("<div align='right'>    <span id='downloadIcon' style='display:none'>         <img alt=''  src='img/elements/loaders/6s.gif' > <b style='margin-left: 5px; margin-right: 5px;'>Processing ...</b>    </span>    <a     onclick='findpdf()'   class='btn btn-dark5 btn-gradient' >        <span class='glyphicons glyphicons-print'></span> </a> </div>");
        }
        header.append("<br/> <thead><tr  ><th  style=' width:5px; text-align:" + defaultAlign + "'>SN#</th>");
        StringBuilder rows = new StringBuilder();
        String[] columns = columnName.split(",");
        String[] columnsFormat = columnFormat.split(",");
        try {
            for (String column : columns) {
                header.append(" <th  style='text-align:").append(defaultAlign).append("' >").append(column).append("</th>");
            }
            header.append(" </tr></thead>");
            if (!data.isEmpty()) {
                rows = new StringBuilder("<tbody>");
                float closingAmount = 0;
                for (int j = 0; j < data.size(); j++) {
                    Object[] row = (Object[]) data.get(j);
                    rows.append("<tr>");
                    rows.append("<td>").append(j + 1).append("</td>");
                    for (int c = 0; c < columns.length - 1; c++) {
                        try {
                            defaultAlign = columnsFormat[c];

                        } catch (Exception ex) {
                        }
                        if (c == 2) {
                            //closingAmount = closingAmount + Float.parseFloat(row[c].toString());
                            if (row[c + 1].toString().equalsIgnoreCase("CREDIT")) {
                                closingAmount = closingAmount + Float.parseFloat(row[c].toString());
                                rows.append(" <td align='").append(defaultAlign).append("' >").append(closingAmount).append("</td>");
                                rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c].toString()).append("</td>");
                                rows.append(" <td align='").append(defaultAlign).append("' >").append("0.0").append("</td>");

                            } else {
                                closingAmount = closingAmount - Float.parseFloat(row[c].toString());
                                rows.append(" <td align='").append(defaultAlign).append("' >").append(closingAmount).append("</td>");
                                rows.append(" <td align='").append(defaultAlign).append("' >").append("0.0").append("</td>");
                                rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c].toString()).append("</td>");

                            }
                            c = c + 1;
                            continue;
                        }
                        rows.append(" <td align='").append(defaultAlign).append("' >").append(row[c] != null ? row[c].toString().trim() : "").append("</td>");

                    }

                    rows.append("</tr>");
                }
                rows.append("</tbody>");

            }
        } catch (Exception ex) {
            String mes = ex.getMessage();
            logger.info("Exception:" + mes);
        }

        header = header.append(rows);
        logger.info("Table:" + header.toString());
        return header.toString();
    }

    public static void printRecords(List data, String columnName, String columnCssStyle, String reportTitle) {
        //String defaultAlign = "center";
        String downloadContent[][] = null;
        //StringBuilder header = new StringBuilder(" <thead><tr  ><th  style=' width:5px; text-align:" + defaultAlign + "'>SN#</th>");

        String[] columns = columnName.split(",");
        //String[] columnsFormat = columnFormat.split(",");
        try {

            if (!data.isEmpty()) {
                downloadContent = new String[data.size() + 1][columns.length];
                for (int j = 0; j < data.size(); j++) {
                    Object[] row = (Object[]) data.get(j);

                    for (int c = 0; c < columns.length; c++) {
                        downloadContent[j][c] = (row[c] != null ? row[c].toString().trim() : "");
                    }
                }
            }
           // JasparReport.generateReport(columns, downloadContent, data.size(), reportTitle);
        } catch (Exception ex) {
            String mes = ex.getMessage();
            logger.info("Exception getDownloadRecords:" + mes);
        }

        logger.info("getDownloadRecords:");
    }
}
