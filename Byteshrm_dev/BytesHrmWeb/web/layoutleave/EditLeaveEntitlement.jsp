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
        <title>      <jsp:include page="../layout/_inc_page_title.jsp"/></title>

        <%@include file="../layout/_inc_head.jsp" %>

    </head>
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

                        <s:form  id="eLeaveEntitlement" name="eLeaveEntitlement"  action="eLeaveEntitlement.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >
                            <s:hidden name="leaveEntitlement.id" id="leaveEntitlement.id"></s:hidden>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tabbable-line boxless tabbable-reversed">
                                                <div class="tab-pane active" id="tab_personal_details">
                                                    <div class="portlet box blue">
                                                        <div class="portlet-title">
                                                            <div class="caption">
                                                                <i class="fa fa-gift"></i><%=session.getAttribute("SELACTIONNAME")%></div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"> </a>
                                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                                            <a href="javascript:;" class="reload"> </a>
                                                            <a href="javascript:;" class="remove"> </a>
                                                        </div>
                                                    </div>



                                                    <!-- BEGIN FORM-->
                                                    <div class="portlet-body form">
                                                        <div class="form-body">
                                                            <!-- BEGIN FORM-->
                                                            <jsp:include page="../layoutcustom/CustomMessage.jsp" />

                                                                                                                  <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Employee Number<span class="required" aria-required="true"> * </span></label>
                                                                        </div>

                                                                         <script type="text/javascript">
                                                                            function setSideBarToggle() {


                                                                                $.ajax({
                                                                                    type: "GET",
                                                                                    url: "json/JsonEmployee.jsp?action=get_emp_by_id&emp_no=" + $("#empNumber").val(),
                                                                                    success: function (data) {
                                                                                        // alert(data);
                                                                                        var output = $.parseJSON(data);
                                                                                           if(output.error == -1)
                                                                                           {
                                                                                                $("#empname").removeAttr("hidden");
                                                                                                $("#empemail").removeAttr("hidden");
                                                                                                $("#empmobile").removeAttr("hidden");
                                                                                                $("#empname").html('<i class="fa fa-user"></i> ' + (output.getEmpFirstname) + ' ' + (output.getEmpMiddleName) + ' ' + (output.getEmpLastname));
                                                                                                $("#empemail").html('<i class="fa fa-envelope-o"></i> ' + (output.getEmpWorkEmail));
                                                                                                $("#empmobile").html('<i class="fa fa-phone"></i> ' + (output.getEmpMobile));
                                                                                           }
                                                                                           else
                                                                                           {
                                                                                               $("#empname").removeAttr("hidden");
                                                                                               $("#empemail").attr("hidden", "true");
                                                                                               $("#empmobile").attr("hidden", "true");
                                                                                               $("#empname").html((output.error));
                                                                                           }
                                                                                    }

                                                                                });
                                                                            }
                                                                        </script>

                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="leaveEntitlement.empNumber.empNumber" id="empNumber"  onblur="setSideBarToggle()" /> 
                                                                            <span> <s:fielderror   fieldName="empNumber"/></span>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">

                                                                    <div>
                                                                        <address>
                                                                            <span id="empname" hidden="true">Employee Name</span>
                                                                            <br/><span id="empemail" hidden="true" >Employee E-Mail</span>
                                                                            <br/><span id="empmobile" hidden="true" >Employee Mobile</span>
                                                                        </address>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Leave Type<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="leaveEntitlement.leaveTypeId.id"  id="leaveTypeId"  headerValue="Select Leave Type "   headerKey=""  list="refDto.leaveTypeList"
                                                                                      listKey="id" listValue="name"></s:select>
                                                                            <span class="help-block"> <s:fielderror   fieldName="leaveTypeId"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <h4 class="form-section"> 
                                                                Leave Period
                                                            </h4>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">From Date<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="leaveEntitlement.fromDate" id="mask_date_mmddyyyy1"  format="mm/dd/yyyy"   /> 
                                                                            <span class="help-block">  Like [mm/dd/yyyy]  <s:fielderror   fieldName="fromDate"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">To Date<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="leaveEntitlement.toDate" id="mask_date_mmddyyyy2"    /> 
                                                                            <span class="help-block">  Like [mm/dd/yyyy]  <s:fielderror   fieldName="toDate"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">No. Of Days  <span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="leaveEntitlement.noOfDays" id="noOfDays"    /> 
                                                                            <span class="help-block">  <s:fielderror   fieldName="noOfDays"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Entitlement  <span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="leaveEntitlement.entitlementType.id"  id="entitlementType"  headerValue="Select Leave Entitlement"   headerKey=""  list="refDto.leaveEntitlementTypeList"
                                                                                      listKey="id" listValue="name"></s:select>
                                                                            <span class="help-block"> <s:fielderror   fieldName="entitlement"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->

                                                            <div class="form-actions">
                                                                <a href="mLeaveEntitlement.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-remove"></i> Cancel </a>
                                                                <a href="gLeaveEntitlement.itb?id=<s:property value="%{leaveEntitlement.id}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Reset </a>
                                                                    <s:submit   method="edit"  cssClass="btn green btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?"  id="save" key="btn.save" />
                                                            </div>
                                                            <!-- END FORM-->  
                                                        </div>
                                                    </div>
                                                    <!-- END FORM-->
                                                </div>
                                            </div>

                                    </div>
                                </div>
                            </div>
                        </s:form>   </div>
                    <!-- END CONTENT BODY -->
                </div>
            </div>
        </div>

        <!--  layout/_inc_footer_quick_nav.jsp-->
        <%@include file="../layout/_inc_footer_script.jsp" %>

        <!-- BEGIN PAGE LEVEL PLUGINS -->
    </body>
</html>