<%@page import="com.bytes.hrm.common.helper.DateHelper"%>
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
        <title>      
            <jsp:include page="../layout/_inc_page_title.jsp"/></title>

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

                        <%   if (!session.getAttribute("isPageAuthorized").toString().equalsIgnoreCase("Not Authorized")) {%>


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
                                <s:form  id="addleaves" name="addleaves"  action="aLeaves.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >

                                    <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>

                                    </div>


                                    <div class="form-body">
                                        <div class="row"> 
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Employees Number
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>
                                                    <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                 name="" id="empNumber" onblur="getLeaveBalance()"  /> 
                                                    <span> <s:fielderror   fieldName="empNumber"/></span>

                                                </div>
                                            </div>
                                            <div class="col-md-6">   
                                                <div class="form-group">
                                                    <label class="control-label">Leave Type
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>
                                                    <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="employee.counCode"  id="counCode"  headerValue="Select Country "   headerKey=""  list="refDto.countryList"
                                                              listKey="code" listValue="name"></s:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <script type="text/javascript">

                                            </script>
                                            <div class="row"> 
                                                <div class="col-md-6">       
                                                    <div class="form-group">
                                                        <label class="control-label">Leave Balance
                                                            <span class="required" aria-required="true"> </span>
                                                        </label>
                                                        <table class="table table-condensed" id="getLeaveBalance">
                                                        </table>
                                                        <div id="container"></div>

                                                    </div>
                                                </div>
                                                <div class="col-md-6"> 
                                                    <div class="form-group">
                                                        <label class="control-label">From Date
                                                            <span class="required" aria-required="true"> * </span>
                                                        </label>
                                                    <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                 name=""     id="mask_date_mmddyyyy1" /> 
                                                    <span class="help-block"> Like [mm/dd/yyyy] <s:fielderror   fieldName=""/> </span>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row"> 
                                            <div class="col-md-6">            
                                                <div class="form-group">
                                                    <label class="control-label">To Date
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>
                                                    <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                 name=""     id="mask_date_mmddyyyy1" /> 
                                                    <span class="help-block"> Like [mm/dd/yyyy] <s:fielderror   fieldName=""/> </span>

                                                </div>
                                            </div>
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label class="control-label">Comment
                                                        <span class="required" aria-required="true"> </span>
                                                    </label>
                                                    <s:textarea   cssClass="form-control"  autocomplete="off"  
                                                                  name="" /> 
                                                    <span class="help-block">
                                                        <s:fielderror   fieldName=""/> 
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <a href="mLeaves.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                <i class="fa fa-mail-reply"></i> Cancel </a>
                                            <a href="oLeaves.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                <i class="fa fa-remove"></i> Clear </a>
                                                <s:submit   method="save" data-toggle="confirmation" data-original-title="Are you sure ?" cssClass="btn green btn-outline"   id="save" key="btn.save" />
                                        </div>

                                    </div>


                                </s:form>
                            </div>
                        </div>

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
        <script type="text/javascript">
            function getLeaveBalance() {
                $.ajax({
                    type: "GET",
                    url: "json/JsonLeave.jsp?action=get_emp_by_id&emp_no=" + $("#empNumber").val(),
                    success: function (data) {
                        // alert(data);
                        var output = $.parseJSON(data);
                        //$("#getLeaveBalance").html((output.getLeaveBalance));
                        alert(output.getLeaveBalance);
                    }
                });
            
                var charttype = {
                    type: 'bar'
                }
                var chartitle = {
                    text: 'Leave Balance'
                }
                var chartxaxis = {
                    categories: ['No. of Days']
                }
                var chartyaxis = {
                    title: {
                        text: 'Leave Types'
                    }
                }
                var chartseries = [
                    {
                        name: 'Jane',
                        data: [4]
                    }, {
                        name: 'John',
                        data: [3]
                    }, {
                        name: 'John',
                        data: [3]
                    }]
                $('#container').highcharts({
                    chart: charttype,
                    title: chartitle,
                    xAxis: chartxaxis,
                    yAxis: chartyaxis,
                    series: chartseries
                });
            }
        </script>
    </body>

</html>