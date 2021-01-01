
<%@page import="com.bytes.hrm.dao.entity.SysModules"%>
<%@page import="com.bytes.hrm.dao.entity.SysAction"%>
<%@page import="java.util.List"%>
<!-- BEGIN SIDEBAR -->





<%

    String currentApplication = session.getAttribute("Application").toString();
    if (session.getAttribute("Modules") == null) {%>
<jsp:forward page="../layoutcommon//Login.jsp" />
<%}

    try {
%>

<%   if (currentApplication.equals("Harmony")) {%> 


<%@include file="../layout/_inc_left_menu_harmoney.jsp" %>


<%  }
%> 


<%   if (currentApplication.equals("Amanat")) {%> 


<%@include file="../layout/_inc_left_menu_amanat.jsp" %>


<%  }
%> 




<%   if (currentApplication.equals("Payroll")) {%> 


<%@include file="../layout/_inc_left_menu_payroll.jsp" %>


<%  }
%> 


<%
    } catch (Exception ex) {
        log("Exception:" + ex);
    }

%>