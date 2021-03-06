<%   
 //SN#                 CR#                 Modified By         Modified On           Remarks
 // 1                  JWiFi001               Asif              14-Aug-2017          Add new condition GET_VLAN_LIST to get the vlan dropdown list   
 
%>

<%@page import="com.info.cms.presentation.entity.PeReportInputValue"%>
<%@page import="com.info.cms.facade.ReferenceData"%>
<%@page import="com.info.wifi.cms.entity.HotspotOwner"%>
<%@page import="com.info.wifi.cms.entity.controller.VlanJpaController"%>
<%@page import="com.info.wifi.cms.entity.Vlan"%>
<%@page import="com.info.wifi.cms.entity.SysUsers"%>
<%@page import="com.info.cms.helper.UIConstants"%>

<%@page import="com.info.cms.helper.StringHelper"%>

<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%     String owner = "";
    SysUsers user = (SysUsers) session.getAttribute("Users");

    if (user.getUserAuthority().equalsIgnoreCase(UIConstants.ADVERTISER_AUTHORITY)) {
        owner = (user.getOwner());
    }
    StringBuilder RESULT = new StringBuilder();
    if (request.getParameter("action") != null && request.getParameter("action")
            .equals("SIDE_BAR_TOGGLE")) {
        if (session.getAttribute("SIDE_BAR_TOGGLE") == null
                || StringHelper.isNullOrEmpty(session.getAttribute("SIDE_BAR_TOGGLE").toString())) {
            session.setAttribute("SIDE_BAR_TOGGLE", "sidebar-collapsed");
        } else {
            session.setAttribute("SIDE_BAR_TOGGLE", "");

        }

    }

    if (request.getParameter("action") != null
            && request.getParameter("action").toString().equals("GET_VLAN")) {

        if (StringHelper.isNullOrEmpty(owner)) {
            owner = request.getParameter("owner");
        }

        List<Vlan> list = null;

        if (StringHelper.isNullOrEmpty(owner)) {
            list = new VlanJpaController().findVlanEntities();
        } else {
            list = new VlanJpaController().findVlanByColumn("HotspotOwner", owner);
        }
        RESULT.append("<select name=\"vlanId\" id=\"vlanId\" style=\"width:100px\"  class=\"form-control\"><option selected value=\"\">ALL</option>");
        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                RESULT.append("<option  value=\"" + list.get(j).getVlanId() + "\">" + list.get(j).getVlanId() + "-" + list.get(j).getVlanName() + "</option>");
            }

        }
        RESULT.append(" </select>");
//CR# JWiFi001 Begin
    }else if (request.getParameter("action") != null
            && request.getParameter("action").toString().equals("GET_VLAN_LIST")) 
     {
    
        if (StringHelper.isNullOrEmpty(owner)) {
            owner = request.getParameter("owner");
        }

        List<Vlan> list = null;

        if (StringHelper.isNullOrEmpty(owner)) {
            list = new VlanJpaController().findVlanEntities();
        } else {
            list = new VlanJpaController().findVlanByColumn("HotspotOwner", owner);
        }
        RESULT.append("<select name=\"vlanId\" id=\"vlanId\" style=\"width:300px\" multiple='true'  size='5' onchange='selectAll()' class=\"form-control\"><option selected value=\"\"   >ALL</option>");
        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                RESULT.append("<option  value=\"" + list.get(j).getVlanId() + "\">" + list.get(j).getVlanId() + "-" + list.get(j).getVlanName() + "</option>");
            }

        }
        RESULT.append(" </select>");
    
    }
//End
    if (request.getParameter("action") != null
            && request.getParameter("action").toString().equals("GET_ADVERTISER")
            && request.getParameter("authority").toString().equals("Advertiser")) {
        List<HotspotOwner> list = ReferenceData.getHotspotOwnersList(null);
        RESULT.append("<select name=\"ownerName\" id=\"ownerName\" class=\"form-control\"><option selected value=\"\">Select Business Owner</option>");
        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                RESULT.append("<option  value=\"" + list.get(j).getOwnerName() + "\">" + list.get(j).getOwnerName() + "</option>");
            }
            RESULT.append(" </select>");
        }
    }

    JSONObject obj = new JSONObject();
    obj.put("RESULT", RESULT.toString());
    out.print(obj);
    out.flush();


%>