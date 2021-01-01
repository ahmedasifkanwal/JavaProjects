
<%@page import="javax.persistence.Convert"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bytes.hrm.dao.entity.LeaveEntitlement"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bytes.hrm.service.leave.LeaveEntitlementServiceImpl"%>
<%@page import="com.bytes.hrm.service.leave.LeaveEntitlementService"%>
<%@page import="com.bytes.hrm.common.helper.StringHelper"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String error = "";
    JSONObject obj = new JSONObject();
    if (request.getParameter("action") != null && request.getParameter("action")
            .equals("get_emp_by_id") && request.getParameter("emp_no") != null) {
        //System.out.print(new SysAuthoritiesServiceImpl().findAllRole().size());
        LeaveEntitlementService leaveEntitlementService = new LeaveEntitlementServiceImpl();
        Integer empNumber = Integer.parseInt(request.getParameter("emp_no"));
//        Map<String, Object> m = new HashMap<String, Object>();
//        m.put("o.employeeId",request.getParameter("emp_no").toString());
        Collection<LeaveEntitlement> e = leaveEntitlementService.readByEmpNumber(empNumber);
        if (e.size() == 0) {
            error = "Employee not found for entered employee number:" + request.getParameter("emp_no");
        } else {
              String getRecords = "";
//            String getRecords = "<tr><td><strong>Leave Type</strong></td><td><strong>No. of Days</strong></td></tr>";
            for(int i=0; i<e.size(); i++)
            {
                LeaveEntitlement leaveEntitlement = (LeaveEntitlement) e.toArray()[i];
//                getRecords = getRecords +  "<tr><td>" + leaveEntitlement.getLeaveTypeId().getName() + "</td><td>" + leaveEntitlement.getNoOfDays().intValue() + "</td></tr>";
                
            }
            getRecords = getRecords + "";
            obj.put("getLeaveBalance",getRecords);
        }
    } else {
        error = "Please enter correct employee id";
    }

    obj.put("error", error);
    out.print(obj);
    out.flush();

%>