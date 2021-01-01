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
                                <s:form  id="aEmployee" name="aEmployee"  action="aEmployee.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >

                                    <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>
                                    </div>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="form-group col-lg-3">
                                                <label class="control-label">Full Name
                                                    <span class="required" aria-required="true"> * </span>
                                                </label>

                                                <s:textfield cssClass="form-control"  autocomplete="off"  
                                                             name="employee.empFirstname" id="empFirstname"   placeholder="First Name"  /> 
                                                <span> <s:fielderror   fieldName="empFirstname"/></span>





                                            </div>

                                            <div class="form-group col-lg-3">
                                                <label class="control-label">
                                                    <span class="required" aria-required="true">  </span>
                                                </label>
                                                <s:textfield cssClass="form-control"  
                                                             name="employee.empMiddleName" id="empMiddleName"   placeholder="Middle Name" /> 
                                                <span> <s:fielderror   fieldName="empMiddleName"/></span>

                                            </div>

                                            <div class="form-group col-lg-3">
                                                <label class="control-label">
                                                    <span class="required" aria-required="true">  </span>
                                                </label>
                                                <s:textfield cssClass="form-control"  
                                                             name="employee.empLastname" id="empLastname"  placeholder="Last Name"   /> 
                                                <span> <s:fielderror   fieldName="empLastname"/></span>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-lg-3">
                                                <label class="control-label">Employee ID
                                                    <span class="required" aria-required="true"> * </span>
                                                </label>
                                                <s:textfield cssClass="form-control"  autocomplete="off"  
                                                             name="employee.employeeId" id="employeeId"  /> 
                                                <span> <s:fielderror   fieldName="employeeId"/></span>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-3">
                                                <label class="control-label">Profile Picture
                                                    <span class="required" aria-required="true">  </span>
                                                </label>
                                                <s:file   requiredLabel="false"  cssClass="dropzone dropzone-file-area"  /> 
                                                <span> 

                                                    <s:fielderror   fieldName="employee"/></span>

                                            </div>  </div>
                                        <div class="row">
                                            <div class="form-group col-lg-3">

                                                <label class="pull-left">Create Login Details

                                                </label>
                                                <s:checkbox  cssClass="form-control"  autocomplete="off"  
                                                             name="isLoginRequired" id="isLoginRequired"  > 

                                                </s:checkbox>
                                                <span>  <s:fielderror   fieldName="isLoginRequired"/></span>

                                            </div>  </div>
                                        <div class="row">
                                            <div class="form-group col-lg-3">
                                                <label class="control-label">Login Details
                                                    <span class="required" aria-required="true"> * </span>
                                                </label>
                                                <s:textfield cssClass="form-control"  autocomplete="off"  
                                                             name="employee.sysUsers.username" id="username"  placeholder="Username Name"  /> 
                                                <span> <s:fielderror   fieldName="username"/></span>

                                            </div>

                                            <div class="form-group col-lg-3">
                                                <label class="control-label">
                                                    <span class="required" aria-required="true">  </span>
                                                </label>
                                                <s:textfield cssClass="form-control"  autocomplete="off"  
                                                             name="employee.sysUsers.password" id="password"  placeholder="Password" /> 
                                                <span> <s:fielderror   fieldName="password"/></span>

                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label class="control-label">
                                                    <span class="required" aria-required="true">  </span>
                                                </label>
                                                <s:textfield cssClass="form-control"  autocomplete="off"  
                                                             name="rePassword" id="rePassword" placeholder="Re-Password"   /> 
                                                <span> <s:fielderror   fieldName="rePassword"/></span>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-actions">
                                                <div class="col-md-12">
                                                    <a href="mEmployee.itb" class="btn red btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?">
                                                        <i class="fa fa-mail-reply"></i> Cancel 
                                                    </a>
                                                    <a href="oEmployee.itb" class="btn blue btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?">
                                                        <i class="fa fa-remove"></i> Clear 
                                                    </a>
                                                    <s:submit method="save"  cssClass="btn blue" data-toggle="confirmation" data-original-title="Are you sure ?" id="save" key="btn.save" />
                                                </div>

                                            </div>
                                        </div>  
                                    </div>
                                </s:form>
                            </div>
                        </div>
                        <!-- END CONTENT -->
                        <!-- BEGIN QUICK SIDEBAR -->
                        <!-- END QUICK SIDEBAR -->
                    </div>

                    <!-- END CONTAINER -->
                    <%@include file="../layout/_inc_footer.jsp" %>           
                </div>
            </div>
        </div>
        <!--  layout/_inc_footer_quick_nav.jsp-->
        <%@include file="../layout/_inc_footer_script.jsp" %>
    </body>
</html>