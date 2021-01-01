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

                        <s:form  id="aDependent" name="aDependent"  action="aDependent.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >

                            <s:hidden name="employee.empNumber" id="employee.empNumber"></s:hidden>                                                        
                            <s:hidden name="empDependents.empDependentsPK.empNumber"  value="%{employee.empNumber}" id="employee.empNumber"></s:hidden>



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
                                                <li class="active"  >

                                                <s:a href="gDependents.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Dependents </s:a>

                                                </li>
                                              <li  >
                                             
                                                           <s:a href="gEmpImmigrations.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Immigration </s:a>

                                              </li>
                                             <li  >
                                             
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
                                                            <i class="fa fa-gift"></i>Dependents</div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"> </a>
                                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                                            <a href="javascript:;" class="reload"> </a>
                                                            <a href="javascript:;" class="remove"> </a>
                                                        </div>
                                                    </div>

                                                    <div class="portlet-body form">
                                                        <!-- BEGIN FORM-->



                                                        <div class="form-body">
                                                            <jsp:include page="../layoutcustom/CustomMessage.jsp" />
                                                 

                                                            <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">Name <span class="color-red">*</span></label>
                                                                        <div class="col-md-9">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empDependents.edName" id="edName"   placeholder="Full Name"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="edName"/> </span>



                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--/span-->



                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">Relationship Type</label>
                                                                        <div class="col-md-9">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="empDependents.edRelationshipType"  id="edRelationshipType"  headerValue="Select Relationship Type "   headerKey=""  list="refDto.relationshipTypeList"
                                                                                      listKey="code" listValue="name"></s:select> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="edRelationshipType"/> </span>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->

                                                            <div class="row">


                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">Relationship <span class="color-red">*</span></label>
                                                                        <div class="col-md-9">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empDependents.edRelationship" id="edRelationship"   placeholder="Relationship"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="edRelationship"/> </span>



                                                                        </div>
                                                                    </div>
                                                                </div>


                                                                <div class="col-md-6" >
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">Date of Birth</label>
                                                                        <div class="col-md-9">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empDependents.edDateOfBirth"     id="mask_date_mmddyyyy3" /> 
                                                                            <span class="help-block"> Like [mm/dd/yyyy] <s:fielderror   fieldName="edDateOfBirth"/> </span>
                                                                        </div>
                                                                    </div>
                                                                    <!--/span-->
                                                                </div>


                                                            </div>
                                                                <!--/row-->
                                                                <div class="form-actions">
                                                                <a href="mEmployee.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="gDependents.itb?empNumber=<s:property value="%{employee.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Reset </a>
                                                                <s:submit method="save" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn blue btn-outline"   id="saveDependantsInfo" key="Save Dependants Info" />
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
                                                                            <span class="caption-subject font-dark sbold uppercase"> <s:label key="lbl.search"/></span>
                                                                        </div>

                                                                    </div>


                                                                    <div class="portlet-body">
                                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                                            <thead>
                                                                                <tr>

                                                                                    <th> SN# </th>
                                                                                    <th> Dependent Name</th>
                                                                                    <th> Relationship Type </th>
                                                                                    <th>Relationship</th>


                                                                                    <th> Birthday </th>
                                                                                    <th> Action </th>

                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator var="p"  status="rowCount" value="employee.empDependentsCollection">
                                                                                    <tr class="odd gradeX">
                                                                                        <td>
                                                                                            <s:property value="#rowCount.count" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{edName}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{edRelationshipType}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{edRelationship}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{edDateOfBirth}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <a href="gJobTitles.itb?id=<s:property value="%{id}" />" class="btn btn-outline btn-circle green btn-sm purple">
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


                                                </div>


                                            </div>



                                        </div>

                                    </div>
                                </div>
                            </div>
                        </s:form>   
                    </div>
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