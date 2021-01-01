<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>      <jsp:include page="../../layout/_inc_page_title.jsp"/></title>

        <%@include file="../../layout/_inc_head.jsp" %>

    </head>
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white <%=session.getAttribute("SIDE_BAR_TOGGLE")%>">


        <div class="page-wrapper">
            <%@include file="../../layout/_inc_header.jsp" %>       
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <%@include file="../../layout/_inc_left_menu.jsp" %>
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">
                     
                        <s:form  id="aEmpWorkExperience" name="aEmpWorkExperience"  action="aEmpWorkExperience.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >
                            <s:hidden name="empWorkExperience.employee.empNumber" id="empEducation.empNumber"></s:hidden>    
                            <s:hidden name="empWorkExperience.empWorkExperiencePK.empNumber" value="%{empWorkExperience.employee.empNumber}" id="empEducation.empWorkExperiencePK"></s:hidden>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tabbable-line boxless tabbable-reversed">
                                            <ul class="nav nav-tabs">
                                                <li >
                                                <s:a href="cEmpEducation.itb?empNumber=%{empWorkExperience.employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Education </s:a>
                                                </li>

                                                <li  >
                                                <s:a href="cEmpSkill.itb?empNumber=%{empWorkExperience.employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Skills </s:a>
                                                </li>
                                                <li  class="active" >
                                                <s:a href="cEmpWorkExperience.itb?empNumber=%{empWorkExperience.employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Work Experience </s:a>
                                                </li>
                                                <li  >

                                                <s:a href="cEmpLanguage.itb?empNumber=%{empWorkExperience.employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Languages </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="cEmpLicense.itb?empNumber=%{empWorkExperience.employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> License </s:a>

                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab_personal_details">
                                                    <div class="portlet box blue">
                                                        <div class="portlet-title">
                                                            <div class="caption">
                                                                <i class="fa fa-gift"></i>Work Experience</div>
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


                                                            <jsp:include page="../../layoutcustom/CustomMessage.jsp" />

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Company *</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empWorkExperience.eexpEmployer" id="eexpEmployer"   placeholder="Company"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="eexpEmployer"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Job Title *</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empWorkExperience.eexpJobtit" id="eexpJobtit"   placeholder="Job Title"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="eexpJobtit"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">From</label>
                                                                        </div>
                                                                        
                                                                        
                                                                        
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empWorkExperience.eexpFromDate"     id="mask_date_mmddyyyy1" /> 
                                                                            <span class="help-block"> Like [mm/dd/yyyy] <s:fielderror   fieldName="eexpFromDate"/> </span>
                                                                        </div>
                                                                        
                                                                        
                                                                        
                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">To</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empWorkExperience.eexpToDate"     id="mask_date_mmddyyyy2" /> 
                                                                            <span class="help-block"> Like [mm/dd/yyyy] <s:fielderror   fieldName="eexpToDate"/> </span>
                                                                        </div>
                                                                        
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Comments</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textarea   cssClass="form-control"  autocomplete="off"  
                                                                                          name="empWorkExperience.eexpComments" /> 
                                                                            <span class="help-block">
                                                                                <s:fielderror   fieldName="eexpComments"/> 
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <!--row-->
                                                            <div class="form-actions">
                                                                <a href="mEmployee.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="cEmpWorkExperience.itb?empNumber=<s:property value="%{empWorkExperience.employee.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Clear </a>
                                                                <s:submit   method="save" data-toggle="confirmation" data-original-title="Are you sure ?" cssClass="btn green btn-outline"  id="saveEmpWorkExperience" key="Save Work Info" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <!-- Begin: life time stats -->
                                                                <div class="portlet light portlet-fit portlet-datatable bordered">
                                                                 
                                                                    <div class="portlet-body">
                                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                                            <thead>
                                                                                <tr>

                                                                                    <th> SN# </th>
                                                                                    <th> Company </th>
                                                                                    <th> Job Title</th>   
                                                                                    <th> From</th>   
                                                                                    <th> To</th>  
                                                                                    <th> Comments</th>  
                                                                                    <th> Action</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator var="p" status="rowCount" value="empWorkExperienceDto.empWorkExperienceList">
                                                                                    <tr class="odd gradeX">
                                                                                        <td>
                                                                                            <s:property value="#rowCount.count" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{eexpEmployer}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{eexpJobtit}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{eexpFromDate}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{eexpToDate}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{eexpComments}" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <a href="#" class="btn btn-outline btn-circle green btn-sm blue-stripe">
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
        <%@include file="../../layout/_inc_footer_script.jsp" %>

        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <!-- END PAGE LEVEL SCRIPTS -->



    </body>

</html>