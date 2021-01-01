
<%@page import="com.bytes.hrm.common.helper.StringHelper"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

    StringBuilder RESULT = new StringBuilder();
    if (request.getParameter("action") != null && request.getParameter("action")
            .equals("MARK_EMP_SELECTED_TAB")) {
        String TAB = request.getParameter("TAB");
        session.setAttribute("tab_personal_details", "");
        session.setAttribute("tab_contact_details", "");
        session.setAttribute("tab_emergency_contact", "");
        session.setAttribute("tab_dependents", "");
        session.setAttribute("tab_Immigration", "");
        session.setAttribute("tab_job", "");
        session.setAttribute("tab_salary", "");
        session.setAttribute("tab_report_to", "");
        session.setAttribute("tab_qualifications", "");
        session.setAttribute("tab_memberships", "");
        if (TAB.contains("tab_personal_details")) {
            session.setAttribute("tab_personal_details",  "active");
        }
        if (TAB.contains("tab_contact_details")) {
            session.setAttribute("tab_contact_details", "active");
        }
        if (TAB.contains("tab_emergency_contact")) {
            session.setAttribute("tab_emergency_contact", "active");
        }

        if (TAB.contains("tab_dependents")) {
            session.setAttribute("tab_dependents", "active");
        }
        if (TAB.contains("tab_Immigration")) {
            session.setAttribute("tab_Immigration", "active");
        }

        if (TAB.contains("tab_job")) {
            session.setAttribute("tab_job", "active");
        }
        if (TAB.contains("tab_salary")) {
            session.setAttribute("tab_salary", "active");
        }

        if (TAB.contains("tab_report_to")) {
            session.setAttribute("tab_report_to", "active");
        }

        if (TAB.contains("tab_qualifications")) {
            session.setAttribute("tab_qualifications", "active");
        }

        if (TAB.contains("tab_memberships")) {
            session.setAttribute("tab_memberships", "active");
        }

    }

    JSONObject obj = new JSONObject();
    obj.put("RESULT", RESULT.toString());
    out.print(obj);
    out.flush();

%>