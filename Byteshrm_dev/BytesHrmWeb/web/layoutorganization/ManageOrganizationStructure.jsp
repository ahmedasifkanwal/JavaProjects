
<%@page import="com.bytes.hrm.service.orgnaization.SubunitService"%>
<%@page import="com.bytes.hrm.service.orgnaization.SubunitServiceImpl"%>

<%@page import="com.bytes.hrm.dao.entity.Subunit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%!
    SubunitService subunitService = new SubunitServiceImpl();
    public String tree = "";

    public void displayChildren(List<Subunit> subunitList) {
        tree = tree + "<ul>";

        for (Subunit subunit : subunitList) {
            tree = tree + " <li>" + subunit.getName();
            List<Subunit> subunitList1 = subunitService.findChild(subunit.getId());
            if (subunitList1 != null && subunitList1.size() > 0) {

                displayChildren(subunitList1);

            }
            tree = tree + " <span > <a href=\"#\"  onclick=\"window.location.href='oUnit.itb?level=" + subunit.getId() + "';return false;\"  > <span class=\"fa fa-plus-circle\"> </a></span> <span > <a href=\"#\"  onclick=\"window.location.href='dUnit.itb?level=" + subunit.getId() + "';return false;\"  ><span class=\"fa fa-minus-circle\"></a></span</li>";
        }
        tree = tree + "</ul>";

    }
%>
<%
    tree = "";
    List<Subunit> subunitList = subunitService.findChild(0);
    displayChildren(subunitList);
    System.out.println("tree:" + tree);
%>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>

        <title>      <jsp:include page="../layout/_inc_page_title.jsp"/></title>

        <%@include file="../layout/_inc_head.jsp" %>

    </head>

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white <%=session.getAttribute("SIDE_BAR_TOGGLE")%>">
        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>



                <div class="page-content-wrapper">

                    <div class="page-content">
 
                        <%   if (!session.getAttribute("isPageAuthorized").toString().equalsIgnoreCase("Not Authorized")) {%>


                        <div class="portlet box blue ">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-diamond "></i><%=session.getAttribute("SELACTIONNAME")%>
                                </div>
                                <div class="tools">
                                    <a href="" class="collapse"> </a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                    <a href="" class="reload"> </a>
                                    <a href="" class="remove"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="tree-demo" id="tree_1">
                                    <%=tree%>
                                </div>
                            </div>
                        </div>


                    </div>


                    <%} else {%>

                    <jsp:include  page="../layout/_inc_action_denied.jsp"></jsp:include>

                    <%}%>

                    <%@include file="../layout/_inc_footer.jsp" %>           
                </div>
            </div>
        </div>


        <%@include file="../layout/_inc_footer_script.jsp" %>





    </body>

</html>