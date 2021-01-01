<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>      <jsp:include page="../layout/_inc_page_title.jsp"/></title>

        <%@include file="../layout/_inc_head.jsp" %>


        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <!-- END PAGE LEVEL PLUGINS -->



    </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white <%=session.getAttribute("SIDE_BAR_TOGGLE")%>">
        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">

                        <%   if (true) {%>


                        <div class="portlet box blue ">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-graduation"></i><%=session.getAttribute("SELACTIONNAME")%>
                                </div>
                                <div class="tools">
                                    <a href="" class="collapse"> </a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                    <a href="" class="reload"> </a>
                                    <a href="" class="remove"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <s:form  id="eLeaveType" name="eLeaveType"  action="eLeaveType.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >

                                    <s:hidden name="leaveType.id" id="id"></s:hidden>


                                        <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>

                                    </div>


                                    <div class="form-body">

                                        <div class="form-body">
                                            <div class="row"> 
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Name 
                                                            <span class="required" aria-required="true"> * </span>
                                                        </label>
                                                        <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                     name="leaveType.name" id="leaveType"   /> 
                                                        <span> <s:fielderror   fieldName="leaveType"/></span>

                                                    </div>
                                                </div>
                                                <div class="col-md-6"> 
                                                    <div class="form-group">
                                                        <label class="control-label">Is entitlement Situational
                                                            <span class="required" aria-required="true"> * </span>
                                                        </label>
                                                        <s:checkbox  autocomplete="off" name="leaveType.excludeInReportsIfNoEntitlement" id="excludeInReportsIfNoEntitlement.id"  > 
                                                        </s:checkbox>
                                                        <span>  <s:fielderror   fieldName="excludeInReportsIfNoEntitlement"/></span>
                                                    </div>
                                                </div>
                                            </div>                          

                                            <div class="form-group">            
                                                <label class="control-label">Operational Country
                                                    <span class="required" aria-required="true"> * </span>
                                                </label>
                                                <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="leaveType.operationalCountryId.id"  id="operationalCountryId.id"  headerValue="Select "   headerKey=""  list="refDto.operationalCountryList"
                                                          listKey="id" listValue="countryCode.couName"></s:select>
                                                </div>
                                            </div>

                                            <div class="form-actions">
                                            <a href="mLeaveType.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                <i class="fa fa-remove"></i> Cancel </a>
                                            <a href="gLeaveType.itb?id=<s:property value="%{leaveType.id}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                <i class="fa fa-remove"></i> Reset </a>
                                                <s:submit   method="edit"  cssClass="btn green btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?"  id="save" key="btn.save" />
                                        </div>

                                    </div>


                                </s:form>
                            </div>
                        </div>



                        <!-- END CONTENT -->
                        <!-- BEGIN QUICK SIDEBAR -->

                        <!-- END QUICK SIDEBAR -->
                    </div>


                    <%} else {%>

                    <jsp:include  page="../layout/_inc_action_denied.jsp"></jsp:include>

                    <%}%>
                    <!-- END CONTAINER -->
                    <%@include file="../layout/_inc_footer.jsp" %>           
                </div>
            </div>
        </div>

        <!--  layout/_inc_footer_quick_nav.jsp-->
        <%@include file="../layout/_inc_footer_script.jsp" %>

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <!-- END PAGE LEVEL SCRIPTS -->



    </body>

</html>