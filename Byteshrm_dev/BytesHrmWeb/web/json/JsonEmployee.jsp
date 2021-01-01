
<%@page import="java.util.Collection"%>
<%@page import="com.bytes.hrm.dao.entity.Employee"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bytes.hrm.service.pim.EmployeeServiceImpl"%>
<%@page import="com.bytes.hrm.service.pim.EmployeeService"%>
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
        EmployeeService employeeService = new EmployeeServiceImpl();
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("o.employeeId",request.getParameter("emp_no").toString());
        Collection<Employee> e = employeeService.search(m);
        if (e.size() == 0) {
            error = "Employee not found for entered employee number: " + request.getParameter("emp_no");
        } else {
            error = "-1";
            Employee employee = (Employee) e.toArray()[0];
            obj.put("getEmpNickName", employee.getEmpNickName());
            obj.put("getEmpFirstname", employee.getEmpFirstname());
            obj.put("getEmpMiddleName", employee.getEmpMiddleName());
            obj.put("getEmpLastname", employee.getEmpLastname());
            obj.put("getEmpMobile", employee.getEmpMobile());
            obj.put("getEmpWorkEmail", employee.getEmpWorkEmail());
        }
    } else {
        error = "Please enter correct employee id";
    }

    obj.put("error", error);
    out.print(obj);
    out.flush();

%>