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

                        <s:form  id="eSalary" name="eSalary"  action="eSalary.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >

                            <s:hidden name="employee.empNumber" id="employee.empNumber"></s:hidden>                                                        
                            <s:hidden name="empBasicsalary.empNumber.empNumber"  value="%{employee.empNumber}" id="employee.empNumber"></s:hidden>
                            <s:hidden name="empBasicsalary.id"   id="empBasicsalary.id"></s:hidden>

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
                                                <li class="active" >

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
                                                            <i class="fa fa-gift"></i>Salary</div>
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
                          

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Pay Grade</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="empBasicsalary.salGrdCode.id"  headerValue="Select Pay Grade  "   headerKey=""  list="refDto.payGradeList"
                                                                                      listKey="id" listValue="name"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="edRelationshipType"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Salary Component *</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empBasicsalary.salaryComponent" id="salaryComponent"   placeholder="Salary Component"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="salaryComponent"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Pay Frequency</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="empBasicsalary.payperiodCode.payperiodCode"  id="payperiodCode"  headerValue="Select Frequency"   headerKey=""  list="refDto.payperiodList"
                                                                                      listKey="payperiodCode" listValue="payperiodName"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="payperiodCode"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Currency *</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="empBasicsalary.currencyId.currencyId"  headerValue="Select Currency"   headerKey=""  list="refDto.currencyTypeList"
                                                                                      listKey="currencyId" listValue="currencyName"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="currencyId"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Amount *</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empBasicsalary.ebsalBasicSalary" id="ebsalBasicSalary"   placeholder="Amount"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="ebsalBasicSalary"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Comments</label>
                                                                        </div>
                                                                        <div class="col-md-6">

                                                                            <s:textarea   cssClass="form-control"  autocomplete="off"  
                                                                                          name="empBasicsalary.comments" /> 
                                                                            <span class="help-block">
                                                                                <s:fielderror   fieldName="comments"/> 
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Add Direct Deposit Details </label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <input type="checkbox" id="inlineCheckbox21" value="option1">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!--/row-->
                                                            <div class="form-actions">
                                                                <a href="mEmployee.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="gSalaries.itb?empNumber=<s:property value="%{employee.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Reset </a>
                                                                <s:submit method="save" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn blue btn-outline"   id="saveSalaryInfo" key="Save Salary Info" />
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
                                                                                Salary Components</span>
                                                                        </div>

                                                                    </div>


                                                                    <div class="portlet-body">
                                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                                            <thead>
                                                                                <tr>

                                                                                    <th> SN# </th>
                                                                                    <th> Pay Grade</th>
                                                                                    <th> Salary Grade </th>
                                                                                    <th>Salary Component</th>


                                                                                    <th> Basic Salary </th>
                                                                                    
                                                                                         <th> Currency </th>
                                                                                       <th> Comments </th>
                                                                                    <th> Action </th>

                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator var="p" value="employee.empBasicsalaryCollection">
                                                                                    <tr class="odd gradeX">
                                                                                        <td>
                                                                                            <s:property value="%{#}" />
                                                                                        </td>
                                                                                        

                                                                                        <td>
                                                                                            <s:property value="%{payperiodCode.payperiodName}" />
                                                                                        </td>
                                                                                        
                                                                                        <td>
                                                                                            <s:property value="%{salGrdCode.name}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{salaryComponent}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{ebsalBasicSalary}" />
                                                                                        </td>
                                                                                        
                                                                                        <td>
                                                                                            <s:property value="%{currencyId.currencyName}" />
                                                                                        </td>
                                                                                        
                                                                                        

                                                                                        <td>
                                                                                            <s:property value="%{salaryComponent}" />
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