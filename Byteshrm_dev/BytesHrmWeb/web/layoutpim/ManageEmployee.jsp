<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <title><jsp:include page="../layout/_inc_page_title.jsp"/></title>
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
                                    <a href="oEmployee.itb"   class="btn btn-default btn-sm">
                                        <i class="fa fa-plus"></i> Add Employee </a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <s:form action="mEmployee.itb" cssClass="horizontal-form" method="post" theme="simple" id="form_sample_2"  novalidate="novalidate">


                                    <div class="form-body">


                                        <div class="row">
                                            <div class="col-md-12">

                                                <!-- Begin: life time stats -->
                                                <div class="portlet light portlet-fit portlet-datatable bordered">
                                                 
                                                    <div class="portlet-body">
                                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                                            <thead>
                                                                <tr>

                                                                    <th> SN# </th>
                                                                    <th> Employee No. </th>
                                                                    <th> Name(First,Middle,Last)</th>   
                                                                    <th> Gender</th>   
                                                                    <th> Birthday</th>   
                                                                    <th> Married ?</th>   
                                                                    <th> Action</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <s:iterator var="p" value="employeeDto.employeeList">
                                                                    <tr class="odd gradeX">
                                                                        <td>
                                                                            <s:property value="%{empNumber}" />
                                                                        </td>
                                                                        <td>
                                                                            <s:property value="%{employeeId}" />
                                                                        </td>

                                                                        <td>

                                                                            <label class="text-success">
                                                                                <s:property value="%{empFirstname}" /></label>



                                                                            <label class="text-warning">
                                                                                <s:property value="%{empMiddleName}" />
                                                                            </label> 



                                                                              <label class="text-success">


                                                                                <s:property value="%{empLastname}" />   </label> 
                                                                        </td>

                                                                        <td>
                                                                            <s:property value="%{empGender}" />
                                                                        </td>

                                                                        <td>
                                                                            <s:property value="%{empBirthday}" />
                                                                        </td>
                                                                        
                                                                         <td>
                                                                            <s:property value="%{empMaritalStatus}" />
                                                                        </td>
                                                                        
                                                                        <td>
                                                                            <a href="mEmployeeView.itb?empNumber=<s:property value="%{empNumber}" />" class="btn btn-outline btn-circle green btn-sm blue-stripe">
                                                                                <i class="fa fa-edit"></i> View </a>
                                                                                
                                                                            <a href="gPersonalDetail.itb?empNumber=<s:property value="%{empNumber}" />" class="btn btn-outline btn-circle green btn-sm blue-stripe">
                                                                                <i class="fa fa-edit"></i> Edit </a>
                                                                                
                                                                                 <a href="cEmpEducation.itb?empNumber=<s:property value="%{empNumber}" />" class="btn btn-outline btn-circle green btn-sm blue-stripe">
                                                                                <i class="fa fa-book "></i> Skills </a>


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







        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <!-- END PAGE LEVEL SCRIPTS -->


        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <!-- END PAGE LEVEL PLUGINS -->


    </body>

</html>