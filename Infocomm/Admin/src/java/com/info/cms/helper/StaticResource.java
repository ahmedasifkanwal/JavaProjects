/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

import com.info.cms.presentation.entity.PeChart;
import com.info.cms.presentation.entity.PeReportInputValue;
import com.info.cms.presentation.entity.PeStatictics;
import com.info.cms.report.graph.UIChartBase;
import com.info.cms.report.graph.UILineChartData;
import com.info.cms.report.graph.UIPieChartData;
import com.info.wifi.cms.entity.ReportConfiguration;
import com.info.wifi.cms.entity.SysErrorLog;
import com.info.wifi.cms.entity.controller.GenericJpaController;
import com.info.wifi.cms.entity.controller.SysErrorLogJpaController;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.StringBufferInputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;

/**
 *
 * @author SALEEM
 */
public class StaticResource {

    private static final Logger logger = Logger.getLogger(StaticResource.class.getName());
    public static Map<String, Object> GLOBAL_DATA = new TreeMap<String, Object>();

    public static PeReportInputValue getAdminReport(PeReportInputValue peReportInput) {

        peReportInput = new ReportRequest().getAdminReport(peReportInput);
        return peReportInput;
    }

    public static void getPDFReport(HttpServletRequest request, String reportName, String data, String filePath) {
        try {
            StringBuilder buf = new StringBuilder();
            buf.append("<html>");
            // put in some style
            buf.append("<head>");
            buf.append("<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/bootstrap.min.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/font-awesome.min.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/datatables/css/datatables.min.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/datatables/extras/TableTools/media/css/TableTools.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/editors/xeditable/css/bootstrap-editable.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/chosen/chosen.min.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/timepicker/bootstrap-timepicker.min.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/colorpicker/colorpicker.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/daterange/daterangepicker.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/formswitch/css/bootstrap-switch.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/vendor/plugins/tags/tagmanager.css'></link>");

            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/theme.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/pages.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/plugins.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/responsive.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/boxed.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/demo.css'></link>");
            buf.append("<link rel='stylesheet' type='text/css' href='").append(request.getContextPath()).append("/css/custom.css'></link>");

            buf.append("</head>");

            // generate the body
            buf.append("<body>");
            buf.append("<table class='table table-striped table-bordered table-hover' id='datatable'>");
            buf.append(data);
            buf.append("</table>");
            buf.append("</body>");
            buf.append("</html>");
            // parse the markup into an xml Document
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document doc = builder.parse(new StringBufferInputStream(buf.toString()));

          //  ITextRenderer renderer = new ITextRenderer();
          // renderer.setDocument(doc, null);

            String outputFile = filePath;
            OutputStream os = new FileOutputStream(outputFile);
           // renderer.layout();
           // renderer.createPDF(os);
            os.close();
            System.out.println(buf.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void buildCharts(List list, ReportConfiguration conf, PeChart peChart) throws FileNotFoundException {

        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.SPEEDO.value)) {

            UIPieChartData obj = new UIPieChartData();
            obj.labelData = list;
            obj.setChart();
            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setTotal(obj.total);
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmspie.js").replace("G_TITLE", "").replace("G_ID", chart.getChartId()).replace("G_DATA", obj.seriesdata)
                    + "</script>");

            peChart.getPeChartList().add(chart);

        }

        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.FUNNEL.value)) {

            UIPieChartData obj = new UIPieChartData();
            obj.labelData = list;
            obj.setChart();
            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setTotal(obj.total);
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmsfunnel.js").replace("G_TYPE", "funnel").replace("G_TITLE", "").replace("G_ID", chart.getChartId()).replace("G_DATA", obj.seriesdata)
                    + "</script>");

            peChart.getPeChartList().add(chart);

        }

        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.PYRAMID.value)) {

            UIPieChartData obj = new UIPieChartData();
            obj.labelData = list;
            obj.setChart();

            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setTotal(obj.total);
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmsfunnel.js").replace("G_TYPE", "pyramid").replace("G_TITLE", "").replace("G_ID", chart.getChartId()).replace("G_DATA", obj.seriesdata)
                    + "</script>");

            peChart.getPeChartList().add(chart);

        }

        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.PIE.value)) {

            UIPieChartData obj = new UIPieChartData();
            obj.labelData = list;
            obj.setChart();
            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setTotal(obj.total);
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmspie.js").replace("G_TITLE", "").replace("G_ID", chart.getChartId()).replace("G_DATA", obj.seriesdata)
                    + "</script>");

            peChart.getPeChartList().add(chart);

        }
        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.DONUTS.value)) {
            UIPieChartData obj = new UIPieChartData();
            obj.labelData = list;
            obj.setChart();
            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setTotal(obj.total);
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmsdonuts.js").replace("G_TITLE", "").replace("G_ID", chart.getChartId()).replace("G_DATA", obj.seriesdata)
                    + "</script>");
            peChart.getPeChartList().add(chart);

        }

        //
        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.LINE.value)) {

            UILineChartData uILineChartObj = new UILineChartData();
            uILineChartObj.labelData = list;
            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            String[] legends = conf.getSelectColumn().split(",");
            for (int l = 0; l < legends.length; l++) {
                uILineChartObj.labelName.add(legends[l]);
            }

            uILineChartObj.setChart();
            chart.setTotal(uILineChartObj.total);
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmsline.js").replace("G_ID", chart.getChartId()).replace("G_TITLE", "").replace("G_CATEGORY", uILineChartObj.x_categories).replace("G_SERIES_NAME_DATA", uILineChartObj.series_name_data)
                    + "</script>");
            peChart.getPeChartList().add(chart);
        }
        //
        if (conf.getConfType().equals(UIConstants.REPORT_CONG_TYPE.BAR.value)) {

            UILineChartData uILineChartObj = new UILineChartData();
            uILineChartObj.labelData = list;
            PeChart chart = new PeChart();
            chart.setTitle(conf.getReportTitle() == null ? "" : conf.getReportTitle());
            chart.setName(conf.getValue());
            chart.setReportIconCss(conf.getReportIcon());
            chart.setChartId(conf.getCode() + "_" + conf.getId());
            String[] legends = conf.getSelectColumn().split(",");
            for (int l = 0; l < legends.length; l++) {
                uILineChartObj.labelName.add(legends[l]);
            }

            uILineChartObj.setChart();
            chart.setTotal(uILineChartObj.total);
            chart.setChart(" <script type=\"text/javascript\">"
                    + UIChartBase.getChartLayout("icmsbar.js").replace("G_ID", chart.getChartId()).replace("G_TITLE", "").replace("G_CATEGORY", uILineChartObj.x_categories).replace("G_SERIES_NAME_DATA", uILineChartObj.series_name_data).replace("G_TYPE", conf.getDescription())
                    + "</script>");
            peChart.getPeChartList().add(chart);

        }
    }

    public static PeStatictics getStatistics() {
        PeStatictics pe = new PeStatictics();
        pe.setGatewayCount(Integer.parseInt(new GenericJpaController().getSingleRow("select count(*) as gateway from gateway   where status='A'").toString()));
        pe.setVlanCount(Integer.parseInt(new GenericJpaController().getSingleRow("select count(*) as vlan from vlan   where status='A'").toString()));
        pe.setOnlineCount(Integer.parseInt(new GenericJpaController().getSingleRow("select count(*) from online_user").toString()));
        pe.setOnlineCount(Integer.parseInt(new GenericJpaController().getSingleRow("select count(*) from bill_customer where status='A'").toString()));

        return pe;

    }

    public static void saveExceptionLocal(String username, String component, Exception ex) throws Exception {
        SysErrorLog object = new SysErrorLog();
        object.setComponent(component);
        object.setCreatedOn(DateHelper.getCurrentDate());
        object.setCreatedBy(username);
        object.setDescription(ex == null ? "" : ex.toString());
        object.setMessage(ex == null ? "" : ex.getMessage());
        object.setLocalizedMessage(ex == null ? "" : ex.getLocalizedMessage());
        new SysErrorLogJpaController().create(object);
        logger.log(Level.SEVERE, component, ex);

    }

    public static boolean sendEmail(String bcc, String cc, String reference, String message, String sendFrom, String sendTo, String status, String subject) {
        boolean sentResult = false;
        try {
            ;

        } catch (Exception ex) {
            logger.info("Message could not be send.Error in Sending Alert message: " + ex.getMessage());
        }
        logger.info("messageSent: " + sentResult);
        return sentResult;
    }

    public static List<String> getSessionogTablesBetweenDate(String dateRange) throws ParseException {
        String liPrefix = "log_session_monitor";
        String from = DateHelper.getSearchFormated(dateRange.split(UIConstants.DATE_SEPRATOR)[0], DateHelper.DATE_TYPE.BEGIN);
        String toDate = DateHelper.getSearchFormated(dateRange.split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.BEGIN);

        Date to = DateHelper.DB_DATETIME_FORMAT.parse(DateHelper.getSearchFormated(dateRange
                .split(UIConstants.DATE_SEPRATOR)[1], DateHelper.DATE_TYPE.END));
        List<String> list = new ArrayList<String>();
        //
        Date mDate = new Date(System.currentTimeMillis());
        int month = mDate.getMonth() + 1;
        if (Integer.parseInt(from.split("-")[1]) == month
                || Integer.parseInt(toDate.split("-")[1]) == month) {
            list.add(liPrefix);
        }

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(DateHelper.DB_DATETIME_FORMAT.parse(from));
        GenericJpaController controller = new GenericJpaController();
        do {
            String logTabel = liPrefix + DateHelper.BACKUP_TABLE_SESSION_Format.format(calendar.getTime());
            calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
            if (list.contains(logTabel)) {
                continue;
            }
            int c = controller.getCount("select count(*) from information_schema.`TABLES`  where table_name='" + logTabel + "'");
            if (c > 0) {
                list.add(logTabel);
            }
        } while (!calendar.getTime().after(to));

        return list;
    }

}
