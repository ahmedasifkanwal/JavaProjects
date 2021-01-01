

<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.StringReader"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URI"%>
<%@page import="com.info.wifi.cms.entity.controller.GenericJpaController"%>
<%@page import="com.info.cms.helper.DateHelper"%>
<%@page import="com.info.cms.helper.UIConstants"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.cms.presentation.entity.PeReportInputValue"%>
<%@page import="com.info.cms.helper.StringHelper"%>
<%@page import="com.info.wifi.cms.entity.Vlan"%>
<%@page import="com.info.wifi.cms.entity.controller.VlanJpaController"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    JSONObject obj = new JSONObject();
    try {

        String s;
        Process p;
        String rsslt = "";
        try {

            {
                PeReportInputValue peReportInput = new PeReportInputValue(request.getParameter("data").toString());

                //
                if (peReportInput.getReportId().equalsIgnoreCase("IMSI_TO_MOBILE")) {
                    if (peReportInput.getParam2().equals("0")) {
                        String xmlRequestBody = getISDNforIMSIRequestXML("10000", peReportInput.getParam1());
                        obj.put("xmlRequestBody", xmlRequestBody);
                        String xmlResponseBody = sendRequest(xmlRequestBody);
                        obj.put("xmlResponseBody", xmlResponseBody);
                        obj = parseXMLString(xmlResponseBody, obj);
                    }

                    if (peReportInput.getParam2().equals("1")) {
                        String xmlRequestBody = getISDNforIMSIfromHSSXML("10001", peReportInput.getParam1());
                        obj.put("xmlRequestBody", xmlRequestBody);
                        String xmlResponseBody = sendRequest(xmlRequestBody);
                        obj.put("xmlResponseBody", xmlResponseBody);
                        obj = parseXMLString(xmlResponseBody, obj);
                    }
                }
                //MOBILE to HRL CHECK

                if (peReportInput.getReportId().equalsIgnoreCase("MOBILE_HRL_STATUS")) {
                    System.out.print("MOBILE_HRL_STATUSMOBILE_HRL_STATUSMOBILE_HRL_STATUSMOBILE_HRL_STATUSMOBILE_HRL_STATUS ");
                    String xmlRequestBody = getStatusFrommMSDNRequestXML("07123", peReportInput.getMobile());
                    obj.put("xmlRequestBody", xmlRequestBody);
                    String xmlResponseBody = sendRequest(xmlRequestBody);
                    obj.put("xmlResponseBody", xmlResponseBody);
                    obj = parseMSDNtoHLRXMLString(xmlResponseBody, obj);

                }

            }

        } catch (Exception ex) {
            out.println(ex.getMessage());
            obj.put("xmlerro", ex.getMessage());
        }

        out.print(obj);
        out.flush();

    } catch (Exception ex) {
        out.println(ex.getMessage());

        obj.put("xmlerro", ex.getMessage());
    }

%>

<%!
    public static String getISDNforIMSIfromHSSXML(String ReferenceNo, String IMSI) {
        StringBuffer str = new StringBuffer("");
        str.append("<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:mss='http://omantel/services/mssservice'>")
                .append("<soapenv:Header/>")
                .append("<soapenv:Body>")
                .append("<mss:getISDNforIMSIfromHSSRequest>")
                .append("<OT_EAI_HEADER>")
                .append(" <MsgFormat>MSS</MsgFormat>")
                .append("<MsgVersion>V1.0</MsgVersion>")
                .append(" <RequestorId>IGRP</RequestorId>")
                .append(" <RequestorChannelId>W</RequestorChannelId>")
                .append(" <RequestorUserId>IGRP</RequestorUserId>")
                .append(" <RequestorLanguage>E</RequestorLanguage>")
                .append(" <RequestorSecurityInfo></RequestorSecurityInfo>")
                .append(" <EaiReference>EAI</EaiReference>")
                .append(" <ReturnCode>0000</ReturnCode>")
                .append(" </OT_EAI_HEADER>")
                .append(" <Request>")
                .append("<ReferenceNo>" + ReferenceNo + "</ReferenceNo>")
                .append(" <!--Optional:-->")
                .append(" <IMSI>" + IMSI + "</IMSI>")
                .append(" <!--Optional:-->")
                .append(" <RequestTime></RequestTime>")
                .append("</Request>")
                .append(" </mss:getISDNforIMSIfromHSSRequest>")
                .append(" </soapenv:Body>")
                .append("</soapenv:Envelope>");
        return str.toString();
    }


    /*
Request SOAP created to test the msdn in omantel network
     */
    public static String getStatusFrommMSDNRequestXML(String ReferenceNo, String MSDN) {
        StringBuffer str = new StringBuffer("");
        str.append("<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:mss='http://omantel/services/mssservice'>")
                .append("<soapenv:Header/>")
                .append("<soapenv:Body>")
                .append("<mss:validateISDNRequest>")
                .append("<OT_EAI_HEADER>")
                .append(" <MsgFormat>MSS</MsgFormat>")
                .append("<MsgVersion>V1.0</MsgVersion>")
                .append(" <RequestorId>IGRP</RequestorId>")
                .append(" <RequestorChannelId>W</RequestorChannelId>")
                .append(" <RequestorUserId>IGRP</RequestorUserId>")
                .append(" <RequestorLanguage>E</RequestorLanguage>")
                .append(" <RequestorSecurityInfo></RequestorSecurityInfo>")
                .append(" <EaiReference>EAI</EaiReference>")
                .append(" <ReturnCode>0000</ReturnCode>")
                .append(" </OT_EAI_HEADER>")
                .append(" <Request>")
                .append("<ReferenceNo>" + ReferenceNo + "</ReferenceNo>")
                .append(" <!--Optional:-->")
                .append(" <ISDN>" + MSDN + "</ISDN>")
                .append(" <!--Optional:-->")
                .append(" <RequestTime></RequestTime>")
                .append("</Request>")
                .append(" </mss:validateISDNRequest>")
                .append(" </soapenv:Body>")
                .append("</soapenv:Envelope>");
        return str.toString();
    }

    public static String getISDNforIMSIRequestXML(String ReferenceNo, String IMSI) {
        StringBuffer str = new StringBuffer("");
        str.append("<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:mss='http://omantel/services/mssservice'>")
                .append("<soapenv:Header/>")
                .append("<soapenv:Body>")
                .append("<mss:getISDNforIMSIRequest>")
                .append("<OT_EAI_HEADER>")
                .append(" <MsgFormat>MSS</MsgFormat>")
                .append("<MsgVersion>V1.0</MsgVersion>")
                .append(" <RequestorId>IGRP</RequestorId>")
                .append(" <RequestorChannelId>W</RequestorChannelId>")
                .append(" <RequestorUserId>IGRP</RequestorUserId>")
                .append(" <RequestorLanguage>E</RequestorLanguage>")
                .append(" <RequestorSecurityInfo></RequestorSecurityInfo>")
                .append(" <EaiReference>EAI</EaiReference>")
                .append(" <ReturnCode>0000</ReturnCode>")
                .append(" </OT_EAI_HEADER>")
                .append(" <Request>")
                .append("<ReferenceNo>" + ReferenceNo + "</ReferenceNo>")
                .append(" <!--Optional:-->")
                .append(" <IMSI>" + IMSI + "</IMSI>")
                .append(" <!--Optional:-->")
                .append(" <RequestTime></RequestTime>")
                .append("</Request>")
                .append(" </mss:getISDNforIMSIRequest>")
                .append(" </soapenv:Body>")
                .append("</soapenv:Envelope>");
        return str.toString();
    }

    public String sendRequest(String xmlRequestBody) throws Exception {
        StringBuilder replyBuff = new StringBuilder();
        //10.64.163.16:7956
        String webserviceURL = "http://10.64.163.16:7956/mssservice";
        System.out.print("Sending request: " + xmlRequestBody);
        URL url = new URL(webserviceURL);
        System.out.print("URL: " + url);
        HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
        urlConn.setDoOutput(true);
        urlConn.setDoInput(true);
        urlConn.setRequestMethod("POST");
        urlConn.setRequestProperty("Content-Type", "text/xml; charset=UTF-8");

        System.out.print("Sending data: ");
        OutputStreamWriter out = new OutputStreamWriter(urlConn.getOutputStream());
        out.write(xmlRequestBody);
        out.flush();
        out.close();
        System.out.print("Reading Data: ");

        BufferedReader in = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
        int responseCode = urlConn.getResponseCode();
        //LOG.info("HttpResponseCode: " + responseCode);
        String responseMsg = urlConn.getResponseMessage();
        //LOG.info("HttpResponseMsg: " + responseMsg);
        String line = null;
        while ((line = in.readLine()) != null) {
            replyBuff.append(line + "\n");
        }
        in.close();

        return replyBuff.toString();
    }

    public JSONObject parseMSDNtoHLRXMLString(String xml, JSONObject obj) {
        try {
            StringBuilder addinfile = new StringBuilder();
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            InputSource is = new InputSource(new StringReader(xml));
            Document doc = dBuilder.parse(is);
            doc.getDocumentElement().normalize();
            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
            String celValue = "";
            // Getting Transction Id from xml
            // Geting Header Value

            NodeList rootNode = doc.getElementsByTagName("Reply");
            Node nNode1 = rootNode.item(0);
            Element eElement1 = (Element) nNode1;

            String ReturnCode = getTagValue("ReturnCode", eElement1);
            String ReturnMsg = getTagValue("ReturnMsg", eElement1);
            String ReferenceNo = getTagValue("ReferenceNo", eElement1);
            obj.put("MSDN", " ReturnCode " + ReturnCode + "  ReturnMsg  " + ReturnMsg + " ReturnCode  " + ReturnCode);
        } catch (Exception ex) {

            obj.put("xmlerro", ex.getMessage());
        }

        return obj;
    }

    public JSONObject parseXMLString(String xml, JSONObject obj) {
        try {
            StringBuilder addinfile = new StringBuilder();
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            InputSource is = new InputSource(new StringReader(xml));
            Document doc = dBuilder.parse(is);
            doc.getDocumentElement().normalize();
            //   System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
            String celValue = "";
            // Getting Transction Id from xml
            // Geting Header Value

            NodeList rootNode = doc.getElementsByTagName("Reply");
            Node nNode1 = rootNode.item(0);
            Element eElement1 = (Element) nNode1;
            String ISDN = getTagValue("ISDN", eElement1);
            String ReturnCode = getTagValue("ReturnCode", eElement1);
            String ReturnMsg = getTagValue("ReturnMsg", eElement1);
            String ReferenceNo = getTagValue("ReferenceNo", eElement1);
            obj.put("ISDN", ISDN + " ReturnCode " + ReturnCode + "  ReturnMsg  " + ReturnMsg + " ReturnCode  " + ReturnCode);
        } catch (Exception ex) {

            obj.put("xmlerro", ex.getMessage());
        }

        return obj;
    }

    private static String getTagValue(String sTag, Element eElement) {
        NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
        Node nValue = (Node) nlList.item(0);

        return nValue.getNodeValue();
    }
%>