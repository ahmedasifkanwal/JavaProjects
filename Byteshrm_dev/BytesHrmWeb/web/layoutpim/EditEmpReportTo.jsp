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

                        <s:form  id="aReportTo" name="aReportTo"  action="aReportTo.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >

                            <s:hidden name="employee.empNumber" id="employee.empNumber"></s:hidden>                                                        


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tabbable-line boxless tabbable-reversed">


                                            <ul class="nav nav-tabs">
                                                <li >
                                                <s:a href="gPersonalDetail.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Personal Details </s:a>
                                                </li>

                                                <li  >
                                                <s:a href="gContactDetail.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Contact Details </s:a>
                                                </li>
                                                <li  >
                                                <s:a href="gEmergencyContacts.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Emergency Contacts </s:a>
                                                </li>
                                                <li  >

                                                <s:a href="gDependents.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Dependents </s:a>

                                                </li>
                                                <li   >

                                                <s:a href="gEmpImmigrations.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Immigration </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="gJob.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Job </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="gSalaries.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Salary </s:a>

                                                </li>
                                                <li class="active" >

                                                <s:a href="gReporting.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Report-To </s:a>

                                                </li>

                                          <li  >
                                            
                                              <s:a href="cEmpMemberDetail.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Membership </s:a>

                                            
                                            </li>

                                        </ul>



                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_personal_details">
                                                <div class="portlet box blue">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-gift"></i>Report-To</div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"> </a>
                                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                                            <a href="javascript:;" class="reload"> </a>
                                                            <a href="javascript:;" class="remove"> </a>
                                                        </div>
                                                    </div>


                                                    <!-- BEGIN FORM-->
                                                    <div class="portlet-body form">
                                                        <!-- BEGIN FORM-->
                                                        <div class="form-body"> 
                                                            <jsp:include page="../layoutcustom/CustomMessage.jsp" />
                                                            <h4 class="form-section"> 
                                                                Add Manager
                                                            </h4>


                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Report Name<span class="color red">*</span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empReportto.employee.empFirstname" id="empReportto.employee.empFirstname"   placeholder="Reporting To"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empFirstname"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Employee No<span class="color-red">*</span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empReportto.empReporttoPK.erepSupEmpNumber" id="empReportto.empReporttoPK.erepSupEmpNumber"   placeholder="Employee No."  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empNumber"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <!--/row-->

                                                            <h4 class="form-section"> 
                                                                Add Subordinate
                                                            </h4>



                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Report Name<span class="color red">*</span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empReportto.employee1.empFirstname" id="empReportto.employee1.empFirstname"   placeholder="Reporting To"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empFirstname1"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Employee No<span class="color-red">*</span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empReportto.empReporttoPK.erepSubEmpNumber" id="empReportto.empReporttoPK.erepSubEmpNumber"   placeholder="Employee No."  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empNumber1"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Report Method<span class="color-red">*</span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="empReportto.empReporttoPK.erepReportingMode"   headerValue="Select Reporting Method"   headerKey=""  list="refDto.empReportingMethodList"
                                                                                      listKey="reportingMethodId" listValue="reportingMethodName"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="reportingMethodId1"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!--/row-->

                                                            <div class="form-actions">
                                                                <a href="mEmployee.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="gReporting.itb?empNumber=<s:property value="%{employee.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Reset </a>
                                                                <s:submit method="save" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn blue btn-outline"   id="saveReportTo" key="Save Report To" />
                                                            </div>

                                                            <!-- END FORM-->  
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-12">

                                                                <!-- Begin: life time stats -->
                                                                <div class="portlet light portlet-fit portlet-datatable bordered">
                                                                    <div class="portlet-title">
                                                                        <div class="caption">
                                                                            <i class="icon-settings font-dark"></i>
                                                                            <span class="caption-subject font-dark sbold uppercase">Reporting-Has Search Issue</span>
                                                                        </div>

                                                                    </div>


                                                                    <div class="portlet-body">
                                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                                            <thead>
                                                                                <tr>

                                                                                    <th> SN# </th>
                                                                                    <th> Manager</th>
                                                                                    <th> Subordinate </th>
                                                                                    <th> Reporting Method </th>
                                                                                  
                                                                                  
                                                                                    <th> Action </th>

                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator var="p" value="employee.empPassportCollection">
                                                                                    <tr class="odd gradeX">
                                                                                        <td>
                                                                                            <s:property value="%{id}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{epPassportNum}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{couCode}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{epPassportissueddate}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{epPassportexpiredate}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{epI9Status}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <a href="X.itb?id=<s:property value="%{id}" />" class="btn btn-outline btn-circle green btn-sm purple">
                                                                                                <i class="fa fa-edit"></i> Edit </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </s:iterator>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <!-- END EXAMPLE TABLE PORTLET-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- END FORM-->



                                                </div>


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

    </body>

</html>