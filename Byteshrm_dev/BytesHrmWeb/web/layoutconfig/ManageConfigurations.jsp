<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title><jsp:include page="../layout/_inc_page_title.jsp"/></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Bytes CRM ,HRM ,Free CRM, Free HRM" name="description" />
        <meta content="" name="author" />
        <%@include file="../layout/_inc_head.jsp" %>

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
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
   
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-gift"></i><%=session.getAttribute("SELACTIONNAME")%></div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse" data-original-title="" title=""> </a>
                                    <a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title=""> </a>
                                    <a href="javascript:;" class="reload" data-original-title="" title=""> </a>
                                    <a href="javascript:;" class="remove" data-original-title="" title=""> </a>
                                   
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                           <s:form action="mrole.itb" cssClass="horizontal-form" method="post" theme="simple" id="form_sample_2"  novalidate="novalidate">
                               
                               <div class="form-body">
                                        

                                        <div class="row">
                                            <div class="col-md-12">

                                                <!-- Begin: life time stats -->
                                                <div class="portlet light portlet-fit portlet-datatable bordered">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="icon-settings font-dark"></i>
                                                            <span class="caption-subject font-dark sbold uppercase"> <s:label key="lbl.search"/></span>
                                                        </div>
                                                        <div class="actions">

                                                            <div class="btn-group">
                                                                <a class="btn red btn-outline btn-circle" href="orole.itb" data-toggle="dropdown">
                                                                    <i class="fa fa-share"></i>
                                                                    <span class="hidden-xs"> Nationality </span>
                                                                    <i class="fa fa-angle-down"></i>
                                                                </a>
                                                                <ul class="dropdown-menu pull-right" id="datatable_ajax_tools">

 <li>
                                                                        <a  class="action" href="aNationalities.itb">
                                                                            <i class="icon-plus"></i> Add Nationality</a>
                                                                    </li>
                                                                    
                                                                    
                                                         
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    

                                                    <div class="portlet-body">

                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                            <thead>
                                                                <tr>
                                                                   <th> ID </th>
                                                            <th> Role </th>
                                                            <th> Description </th>
                                                            <th> Title </th>
                                                            <th> Status </th>
                                                            <th> Created By </th>
                                                            <th> Edit </th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                              
                                                                    
                                                                    
                                                                    
                                                                    
                                                             <s:iterator var="p" value="sysAuthoritiesDto.sysAuthoritiesList">
                                                               <tr class="odd gradeX">
                                                                    <td>
                                                                        <s:property value="%{id}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{authority}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{description}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{title}" />
                                                                    </td>

                                                                    <td>
                                                                        <s:property value="%{status}" />
                                                                    </td>
                                                                    <td>
                                                                        <s:property value="%{createdBy}" />
                                                                    </td>
                                                                    <td>
                                                                        <a href="grole.itb?id=<s:property value="%{id}" />" class="btn btn-outline btn-circle green btn-sm purple">
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



                             <div class="row">
                               <div class="col-md-2">
                                   <img src="screen/admin/Nationalities.PNG" alt=""  style="width:500px "/>
                                    
                                    </div>
                         </div>







                                    </div>

                               </s:form>
                                <!-- END FORM-->
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
      
        <%@include file="../layout/_inc_footer_script.jsp" %>

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
        <script src="assets/global/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->





        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/table-datatables-managed.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->


        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script src="assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->


    </body>

</html>