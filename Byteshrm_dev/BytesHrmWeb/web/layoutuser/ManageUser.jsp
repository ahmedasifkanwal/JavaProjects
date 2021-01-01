<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>

        <title>      <jsp:include page="../layout/_inc_page_title.jsp"/></title>

        <%@include file="../layout/_inc_head.jsp" %>

    </head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white <%=session.getAttribute("SIDE_BAR_TOGGLE")%>">
        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <!-- BEGIN CONTAINER -->
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>
                <!-- BEGIN CONTENT -->
                <!-- BEGIN CONTENT -->
                <div class="page-content-wrapper">
                    <!-- BEGIN CONTENT BODY -->
                    <div class="page-content">
                        <!-- BEGIN PAGE HEADER-->
                        <!-- BEGIN THEME PANEL -->

                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->

                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-graduation"></i><%=session.getAttribute("SELACTIONNAME")%></div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse" data-original-title="" title=""> </a>
                                    <a href="javascript:;" class="reload" data-original-title="" title=""> </a>
                                    <a href="javascript:;" class="remove" data-original-title="" title=""> </a>
                                </div>
                                 <div class="actions">
                                    <a href="ouser.itb"   class="btn btn-default btn-sm">
                                        <i class="fa fa-plus"></i> Add User </a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->

                                <s:form action="muser.itb" cssClass="horizontal-form" method="post" theme="simple" id="form_sample_1"  novalidate="novalidate">


                                    <div class="form-body">


                                        <div class="row">
                                            <div class="col-md-12">

                                                    <div class="portlet-body">  <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                            <thead>
                                                                <th> SN# </th>
                                                            <th> User Name </th>
                                                            <th> Role </th>
                                                             <th> Employee# </th>
                                                            <th> Email </th>
                                                            <th> Expiry </th>
                                                            <th> STATUS </th>
                                                            <th> Action </th>
                                                            <th> Created By </th>Z
                                                            <th> Edit </th>

                                                            </thead>
                                                            <tbody>
                                                                <s:iterator var="p" status="rowStatus"    value="sysUserDto.sysUserList">
                                                                    <tr class="odd gradeX">
                                                                        
                                                                        <td>
                                                                            <s:property value="#rowStatus.count" />
                                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{username}" />
                                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{userAuthority}" />
                                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{empNumber}" />
                                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{email}" />
                                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{expiryDate}" />
                                                                        </td>

                                                                        <td>
                                                                            <s:property value="%{status}" />
                                                                        </td>
                                                                        <td>
                                                            <span class="label label-sm label-info">Set Permissions </span>
                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{createdBy}" />
                                                                        </td>
                                                                        <td>
                                                                            <a href="guser.itb?id=<s:property value="%{id}" />" class="btn btn-outline btn-circle green btn-sm purple">
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

                                    

                                </s:form>
                            </div>
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







    </body>

</html>