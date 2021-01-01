<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">Search
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>Metronic Admin Theme #1 | New User Profile | Account</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Bytes CRM ,HRM ,Free CRM, Free HRM" name="description" />
        <meta content="" name="author" />
        <%@include file="../layout/_inc_head.jsp" %>
        <!-- BEGIN PAGE LEVEL STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->

        <link href="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
    </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white  <%=session.getAttribute("SIDE_BAR_TOGGLE")%>" >
        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN EXAMPLE TABLE PORTLET-->

                                <s:form  id="form1" name="form1"  action="erole.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >
                                    <s:hidden name="sysAuthoritiesDto.sysAuthoritiesVo.id"    />
                                    <div class="form-body">

                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group"> 
                                                    <label class="control-label"><s:label key="lbl.role"/>
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>



                                                    <s:textfield cssClass="form-control form-control-solid placeholder-no-fix form-group"  autocomplete="off"   name="sysAuthoritiesDto.sysAuthoritiesVo.authority" id="authority"   /> </div>



                                                <span class="help-block">     <s:fielderror   fieldName="authority" /></span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group"> 
                                                <label class="control-label"><s:label key="lbl.title"/> 
                                                    <span class="required" aria-required="true"> * </span>
                                                </label>

                                                <s:textfield cssClass="form-control form-control-solid placeholder-no-fix form-group"  autocomplete="off"   name="sysAuthoritiesDto.sysAuthoritiesVo.title" id="title"    /> </div>

                                            <span class="help-block">  <s:fielderror   fieldName="title" /> </span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group"> 
                                                <label class="control-label"><s:label key="lbl.desc"/> 
                                                    <span class="required" aria-required="true"> * </span>
                                                </label>

                                                <s:textfield cssClass="form-control form-control-solid placeholder-no-fix form-group"  autocomplete="off"   name="sysAuthoritiesDto.sysAuthoritiesVo.description" id="description"    /> </div>

                                            <span class="help-block">  <s:fielderror   fieldName="description" /></span>
                                        </div>
                                    </div>




                                    <div class="form-actions">
                                            <a href="mrole.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                <i class="fa fa-remove"></i> Cancel </a>
                                            <a href="grole.itb?id=<s:property value="%{sysAuthoritiesDto.sysAuthoritiesVo.id}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                <i class="fa fa-remove"></i> Reset </a>
                                                <s:submit   method="edit"  cssClass="btn green btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?"  id="save" key="btn.save" />
                                        </div>

                                </div>




                            </div>








                        </s:form>


                        <!-- END EXAMPLE TABLE PORTLET-->
                    </div>
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN QUICK SIDEBAR -->

        <!-- END QUICK SIDEBAR -->
    </div>
    <!-- END CONTAINER -->
    <%@include file="../layout/_inc_footer.jsp" %>           
</div>
<%@include file="../layout/_inc_footer_quick_nav.jsp" %>
<%@include file="../layout/_inc_footer_script.jsp" %>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->



<!-- END PAGE LEVEL SCRIPTS -->

</body>

</html>