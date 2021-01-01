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

                        <s:form  id="eJob" name="eJob"  action="eJob.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >

                            <s:hidden name="employee.empNumber" id="employee.empNumber"></s:hidden>      
                            <s:hidden name="empContractExtend.empContractExtendPK.empNumber"  value="%{employee.empNumber}" id="employee.empNumber"></s:hidden>


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
                                                <li class="active" >

                                                <s:a href="gJob.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Job </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="gSalaries.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Salary </s:a>

                                                </li>
                                                <li  >

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
                                                                <i class="fa fa-gift"></i>Job</div>
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
                                                                            <label class="control-label col-md-12">Job Title</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" 
                                                                                      name="employee.jobTitleCode.id"  headerValue="Select Job Title"   headerKey="0"  list="refDto.jobTitleList"
                                                                                      listKey="id" listValue="jobTitle"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="jobTitleCode"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Job Specification</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <span class="form-control-static"> Accepts upto 1MB</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Employment Status</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" name="employee.empStatus.id"   
                                                                                      headerValue="Select Emp Status "   headerKey=""  list="refDto.employmentStatusList"
                                                                                      listKey="id"  listValue="name"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName=""/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Job Category</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="employee.eeoCatCode.id"  headerValue="Select Category"   headerKey=""  list="refDto.jobCategoryList"
                                                                                      listKey="id" listValue="name"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName=""/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Joined Date</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.joinedDate" id="mask_date_mmddyyyy"    /> 
                                                                            <span class="help-block">  Like [mm/dd/yyyy]  <s:fielderror   fieldName="joinedDate"/> </span>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Sub Unit</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" 
                                                                                      name="employee.workStation.id"         headerValue="Select Unit"   headerKey=""  list="refDto.subunitList"
                                                                                      listKey="id" listValue="name"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName=""/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Location</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="employee.locationCollection[0].location.id"  id=""  headerValue="Select"   headerKey=""  list="refDto.locationList"
                                                                                      listKey="id" listValue="name"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName=""/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h4 class="form-section"> 
                                                                Employment Contract
                                                            </h4>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Start Date</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empContractExtend.econExtendStartDate" id="mask_date_mmddyyyy8"    /> 
                                                                            <span class="help-block">  Like [mm/dd/yyyy]  <s:fielderror   fieldName=""/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">End Date</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empContractExtend.econExtendEndDate" id="mask_date_mmddyyyy9"    /> 
                                                                            <span class="help-block">  Like [mm/dd/yyyy]  <s:fielderror   fieldName=""/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Contract Details</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:file   requiredLabel="false"  cssClass="dropzone dropzone-file-area"  />  
                                                                            <span class="help-block"> <s:fielderror   fieldName="Attachment"/> </span>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="form-actions">
                                                                <a href="mEmployee.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="gJob.itb?empNumber=<s:property value="%{employee.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Reset </a>
                                                                 <s:submit method="saveEmpJob" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn blue btn-outline"   id="save" key="Save Job Details" />
                                                                 <s:submit method="" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn red btn-outline"   id="save" key="Terminate Employee" />

                                                            </div>
                                                            

                                                            <!-- END FORM-->  

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">

                                                                <!-- Begin: life time stats -->
                                                                <div class="portlet light portlet-fit portlet-datatable bordered">
                                                                    <div class="portlet-title">
                                                                        <div class="caption">
                                                                            <i class="fa fa-mobile font-blue-chambray"></i>
                                                                            <span class="caption-subject font-dark sbold uppercase">
                                                                                Job</span>
                                                                        </div>

                                                                    </div>


                                                                    <div class="portlet-body">
                                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                                            <thead>
                                                                                <tr>

                                                                                    <th> SN# </th>
                                                                                    <th> Job Title</th>
                                                                                    <th> Employment Status </th>
                                                                                    <th> Job Category</th>
                                                                                    <th> Joined Date </th>
                                                                                    <th> Sub Unit</th>
                                                                                    <th> Location </th>
                                                                                    <th> Action </th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator var="p" status="rowCount" value="employee">
                                                                                    <tr class="odd gradeX">
                                                                                        <td>
                                                                                            <s:property value="#rowCount.count" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{jobTitleCode.name}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{empStatus.name}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{eeoCatCode.name}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{joinedDate}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{workStation.name}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{locationCollection[0].location.name}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <a href="#.itb?id=<s:property value="%{id}" />" class="btn btn-outline btn-circle green btn-sm purple">
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

        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <!-- END PAGE LEVEL SCRIPTS -->



    </body>

</html>