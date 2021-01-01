
<%@page import="com.bytes.hrm.service.pim.SubunitServiceImpl"%>
<%@page import="com.bytes.hrm.service.pim.SubunitService"%>
<%@page import="com.bytes.hrm.dao.entity.Subunit"%>
<%@page import="com.bytes.hrm.action.orgnaization.OrganizationStructureAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
                                    <i class="fa fa-map-pin"></i><%=session.getAttribute("SELACTIONNAME")%>
                                </div>
                                <div class="tools">
                                    <a href="" class="collapse"> </a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                    <a href="" class="reload"> </a>
                                    <a href="" class="remove"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div id="tree_1" class="tree-demo">
                                    <ul>
                                     
                                        
                                        
                                        
                                      
                                                <%

                                                    SubunitService subunitDtoService = new SubunitServiceImpl();

                                                    List<Subunit> list = subunitDtoService.getSubunitByLevel(1);

                                                    for (int outer = 0; outer < list.size(); outer++) {%>

                                                <li data-jstree='{ "icon" : "fa fa-briefcase icon-state-success " }'><%=list.get(outer).getName()%>
                                                    <%

                                                        String tree = getData(list.get(outer).getId());
                                                    %>
                                                    <%=tree%>
                                                    <%}%>
                                                    </li>


                                                <%!
                                                    public String getData(int id) {
                                                        String subTree = "";
                                                        SubunitService subunitDtoService = new SubunitServiceImpl();
                                                        List<Subunit> list1 = subunitDtoService.getSubunitByLevel(id);
                                                        subTree = subTree + " <ul>";
                                                        for (int j = 0; j < list1.size(); j++) {

                                                            subTree = subTree + " <li data-jstree='{ " + "\"" + "type" + "\"" + " : " + "\"" + "file" + "\"" + " }'> " + list1.get(j).getName() + " </li>";

                                                            getData(list1.get(j).getId());
                                                        }
                                                        subTree = subTree + " </ul>";

                                                        return subTree;

                                                    }%>


                                        </li>
                                        <ul>
                                        </ul>
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