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

                        <s:form  id="aEmpSkill" name="aEmpSkill"  action="aEmpSkill.itb"  cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >

                            <s:hidden name="empSkill.empNumber.empNumber" id="empSkill.empNumber"></s:hidden>    
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tabbable-line boxless tabbable-reversed">
                                            <ul class="nav nav-tabs">
                                                <li  >
                                                <s:a href="cEmpEducation.itb?empNumber=%{empSkill.empNumber.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Education </s:a>
                                                </li>

                                                <li class="active" >
                                                <s:a href="cEmpSkill.itb?empNumber=%{empSkill.empNumber.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Skills </s:a>
                                                </li>
                                                <li  >
                                                <s:a href="cEmpWorkExperience.itb?empNumber=%{empSkill.empNumber.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Work Experience </s:a>
                                                </li>
                                                <li  >

                                                <s:a href="cEmpLanguage.itb?empNumber=%{empSkill.empNumber.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Languages </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="cEmpLicense.itb?empNumber=%{empSkill.empNumber.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> License </s:a>

                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab_personal_details">
                                                    <div class="portlet box blue">
                                                        <div class="portlet-title">
                                                            <div class="caption">
                                                                <i class="fa fa-gift"></i>Skills</div>
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
                                                                            <label class="control-label col-md-12">Skills *</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="empSkill.skillId.id"  id="skillId.id"  headerValue="Select your skills "   headerKey=""  list="refDto.skillList"
                                                                                      listKey="id" listValue="name"></s:select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <div class="col-md-4">
                                                                                <label class="control-label col-md-12">Years of Experience</label>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="empSkill.yearsOfExp" id="yearsOfExp"   placeholder="Years of Experience"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="yearsOfExp"/> </span>
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
                                                                                          name="empSkill.comments" /> 
                                                                            <span class="help-block">
                                                                                <s:fielderror   fieldName="comments"/> 
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <!--/row-->
                                                            <div class="form-actions">
                                                                <a href="mEmployee.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="cEmpSkill.itb?empNumber=<s:property value="%{empSkill.empNumber.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Clear </a>
                                                                <s:submit   method="save" data-toggle="confirmation" data-original-title="Are you sure ?" cssClass="btn green btn-outline" id="saveEmpSkill" key="Save Skill Info"  />
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
                                                                                    <th> Skill </th>
                                                                                    <th> Years of Experience</th>   
                                                                                    <th> Comments</th>   
                                                                                    <th> Action</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <s:iterator var="p" status="rowCount" value="empSkillDto.empSkillList">
                                                                                    <tr class="odd gradeX">
                                                                                        <td>
                                                                                            <s:property value="#rowCount.count" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <s:property value="%{skillId.name}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{yearsOfExp}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <s:property value="%{comments}" />
                                                                                        </td>

                                                                                        <td>
                                                                                            <a href="" class="btn btn-outline btn-circle green btn-sm blue-stripe">
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