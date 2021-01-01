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
    
                        <s:form  id="eJobVacancy" name="eJobVacancy"  action="eJobVacancy.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >
                         <s:hidden name="jobVacancy.id" id="jobVacancy.id"></s:hidden>
                                    
                                
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="tabbable-line boxless tabbable-reversed">
                                        <div class="tab-content">
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
                                                                            <label class="control-label col-md-12">Job Title<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="jobVacancy.jobTitleCode"  id="jobTitleCode"  headerValue="Select Job Title"   headerKey=""  list="refDto.jobTitleList"
                                                                                      listKey="id" listValue="jobTitle"></s:select>
                                                                            <span class="help-block"> <s:fielderror   fieldName="jobTitle"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Vacancy Name<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="jobVacancy.name" id="name" /> 
                                                                            <span> <s:fielderror   fieldName="name"/></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Hiring Manager<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                             <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="jobVacancy.hiringManagerId" id="hiringManagerId"   /> 
                                                                            <span> <s:fielderror   fieldName="hiringManagerId"/></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Number of positions<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                             <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="jobVacancy.noOfPositions" id="noOfPositions"   /> 
                                                                            <span> <s:fielderror   fieldName="noOfPositions"/></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Description<span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                             <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="jobVacancy.description" id="description"   /> 
                                                                            <span> <s:fielderror   fieldName="description"/></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Active  <span class="required" aria-required="true"> * </span></label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:checkbox  autocomplete="off"  
                                                                             name="jobVacancy.status" id="status"  > 
                                                                            </s:checkbox>
                                                                            <span>  <s:fielderror   fieldName="status"/></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->

                                                            <div class="form-actions">
                                                                                <a href="mJobVacancy.itb" class="btn red btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?" >
                                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                                <a href="gJobVacancy.itb" class="btn blue btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?" >
                                                                                    <i class="fa fa-remove"></i> Reset </a>
                                                                                <s:submit method="edit" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn blue btn-outline"   id="save" key="Save" />

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