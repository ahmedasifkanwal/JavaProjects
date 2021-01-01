
<%@page import="com.bytes.hrm.common.helper.StringHelper"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%  
    
    StringBuilder RESULT = new StringBuilder();
    if (request.getParameter("action") != null && request.getParameter("action")
            .equals("SIDE_BAR_TOGGLE")) {
        if (session.getAttribute("SIDE_BAR_TOGGLE") == null || StringHelper.isNullOrEmpty(session.getAttribute("SIDE_BAR_TOGGLE").toString())) {
            session.setAttribute("SIDE_BAR_TOGGLE", "page-sidebar-closed");
        } else {
            if (session.getAttribute("SIDE_BAR_TOGGLE").toString().equals("page-sidebar-closed")) 
            {
                session.setAttribute("SIDE_BAR_TOGGLE", "");
            }else
                
            {
             session.setAttribute("SIDE_BAR_TOGGLE", "page-sidebar-closed");
            }
            
        }
        
    }
    
    JSONObject obj = new JSONObject();
    obj.put("RESULT", RESULT.toString());
    out.print(obj);
    out.flush();
    

%>