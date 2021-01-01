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
        <link href="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
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
                                    <i class="icon-users"></i><%=session.getAttribute("SELACTIONNAME")%>
                                </div>
                                <div class="tools">
                                    <a href="" class="collapse"> </a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                    <a href="" class="reload"> </a>
                                    <a href="" class="remove"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <s:form  id="form1" name="form1"  action="auser.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >

                                    <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>

                                    </div>


                                    <div class="form-body">    
                                        <div class="form-group">
                                            <label class="control-label"> Login ID
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="sysUserDto.sysUser.username" id="username"   /> 
                                            <span> <s:fielderror   fieldName="username"/></span>

                                        </div>

                                        <div class="form-group">
                                            <label class="control-label"> 
                                                Password
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:password cssClass="form-control"  autocomplete="off"   name="sysUserDto.sysUser.password" id="password"    />
                                            <span class="help-block">   <s:fielderror   fieldName="password" /> </span>

                                        </div>
                                            <div class="form-group">
                                            <label class="control-label"> Email
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="sysUserDto.sysUser.email" id="email"   /> 
                                            <span> <s:fielderror   fieldName="email"/></span>

                                        </div>
                                            

                                        <div class="form-group">
                                            <label class="control-label">Role
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:select cssClass="bs-select form-control" 
                                                      data-live-search="true" 
                                                      data-size="8"  
                                                      name="sysUserDto.sysUser.userAuthority"  
                                                      id="sysUserDto.id"  
                                                      headerValue="Select "   
                                                      headerKey=""  
                                                      list="refDto.sysAuthoritiesList"
                                                      accesskey=""
                                                      listKey="authority" 
                                                      listValue="authority">
                                            </s:select>
                                              <span class="help-block">   <s:fielderror   fieldName="authority" /> </span>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label"> Employee ID(ESS)
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="sysUserDto.employeeId" id="employeeId"   /> 
                                            <span> <s:fielderror   fieldName="employeeId"/></span>

                                        </div>

                                        <div class="form-actions">
                                            <a href="mrole.itb" class="btn red btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?" >
                                                <i class="fa fa-mail-reply"></i> Cancel </a>
                                            <a href="orole.itb" class="btn blue btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?" >
                                                <i class="fa fa-remove"></i> Clear </a>

                                            <s:submit   method="save"  cssClass="btn blue btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?" id="save" key="btn.add" />
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

        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
        <script src="assets/global/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/form-validation.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->



    </body>

</html>