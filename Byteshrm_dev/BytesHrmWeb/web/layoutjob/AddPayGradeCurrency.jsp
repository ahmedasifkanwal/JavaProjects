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
   
                        <%   if (!session.getAttribute("isPageAuthorized").toString().equalsIgnoreCase("Not Authorized")) {%>


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
                                <s:form  id="aPayGradesCurrency" name="aPayGradesCurrency"  action="aPayGradesCurrency.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >

                                    <s:hidden name="payGradeCurrency.payGrade.id" id="payGradeCurrency.payGrade.id"></s:hidden>
                                    <s:hidden name="payGradeCurrency.id" id="payGradeCurrency.id"></s:hidden>



                                        <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>

                                    </div>


                                    <div class="form-body">




                                        <div class="form-group">



                                            <label class="control-label">Pay Grade
                                                <span class="required" aria-required="true"> : </span>
                                            </label>



                                            <s:label cssClass="control-label"  autocomplete="off"  
                                                     name="payGradeCurrency.payGrade.name" id="name"   /> 


                                        </div>





                                        <div class="form-group">



                                            <label class="control-label">Currency
                                                <span class="required" aria-required="true"> * </span>
                                            </label>



                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="payGradeCurrency.currencyType.currencyId"  id="code"  headerValue="Select Business "   headerKey=""  list="refDto.currencyTypeList"
                                                      listKey="currencyId" listValue="currencyName"></s:select>

                                                <span> <s:fielderror   fieldName="currencyId"/></span>

                                        </div>




                                        <div class="form-group">



                                            <label class="control-label">Salary(Min)
                                                <span class="required" aria-required="true"> * </span>
                                            </label>



                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="payGradeCurrency.minSalary" id="minSalary"  maxLength="5"   /> 
                                            <span> <s:fielderror   fieldName="minSalary"/></span>

                                        </div>






                                        <div class="form-group">



                                            <label class="control-label">Salary(Max)
                                                <span class="required" aria-required="true"> * </span>
                                            </label>



                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="payGradeCurrency.maxSalary" id="maxSalary"  maxLength="5"  /> 
                                            <span> <s:fielderror   fieldName="maxSalary"/></span>

                                        </div>





                                        <div class="form-actions">
                                            <a href="mPayGradesCurrency.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                <i class="fa fa-mail-reply"></i> Cancel </a>
                                            <a href="oPayGradesCurrency.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                <i class="fa fa-remove"></i> Clear </a>

                                            <s:submit   method="save" data-toggle="confirmation" data-original-title="Are you sure ?" cssClass="btn blue btn-outline"   id="save" key="btn.save" />
                                        </div>

                                    </div>


                                </s:form>
                            </div>
                        </div>



                        <!-- END CONTENT -->
                        <!-- BEGIN QUICK SIDEBAR -->

                        <!-- END QUICK SIDEBAR -->
                    </div>


                    <%} else {%>

                    <jsp:include  page="../layout/_inc_action_denied.jsp"></jsp:include>

                    <%}%>
                    <!-- END CONTAINER -->
                    <%@include file="../layout/_inc_footer.jsp" %>           
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