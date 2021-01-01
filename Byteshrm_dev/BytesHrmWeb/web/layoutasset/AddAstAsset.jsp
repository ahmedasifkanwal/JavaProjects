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

                        <%   if (true) {%>


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
                                <s:form  id="addastAsset" name="addastAsset"  action="aAstAsset.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >

                                    <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>
                                    </div>


                                    <div class="form-body">
                                        <div class="row"> 
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Serial Number </label>
                                                    <s:textfield cssClass="form-control"  autocomplete="off" size="10" 
                                                                 name="astAsset.serialNumber" id="serialNumber"   /> 
                                                </div>
                                            </div>
                                        </div>    
                                                    
                                        <div class="row"> 
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Asset Brand
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>
                                                    <s:select cssClass="bs-select form-control" 
                                                              data-live-search="true" 
                                                              data-size="8"  
                                                              name="astAsset.astBrand.id"  
                                                              id="astBrand.id"  
                                                              headerValue="Select Brand"   
                                                              headerKey=""  
                                                              list="refDto.astBrandList"
                                                              listKey="id" 
                                                              listValue="name"></s:select>
                                                    <span> <s:fielderror   fieldName="astAsset"/></span>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Asset Category
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>
                                                    <s:select cssClass="bs-select form-control" 
                                                              data-live-search="true" 
                                                              data-size="8"  
                                                              name="astAsset.astCategory.id"  
                                                              id="astCategory.id"  
                                                              headerValue="Select Category "   
                                                              headerKey=""  
                                                              list="refDto.astCategoryList"
                                                              listKey="id" 
                                                              listValue="name"></s:select>
                                                    <span> <s:fielderror   fieldName="astAsset"/></span>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Asset Vendor
                                                        <span class="required" aria-required="true"> * </span>
                                                    </label>
                                                    <s:select cssClass="bs-select form-control" 
                                                              data-live-search="true" 
                                                              data-size="8"  
                                                              name="astAsset.astVendor.id"  
                                                              id="astVendor.id"  
                                                              headerValue="Select Vendor "   
                                                              headerKey=""  
                                                              list="refDto.astVendorList"
                                                              listKey="id" 
                                                              listValue="name"></s:select>
                                                    <span> <s:fielderror   fieldName="astAsset"/></span>
                                                </div>
                                            </div>   
                                        </div>                       
                                        <div class="row"> 
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Location </label>
                                                    <s:select cssClass="bs-select form-control" 
                                                              data-live-search="true" 
                                                              data-size="8"  
                                                              name="location.countryCode.couCode"  
                                                              id="code"  
                                                              headerValue="Select Country "   
                                                              headerKey=""  
                                                              list="refDto.countryList"
                                                              listKey="couCode" 
                                                              listValue="name"></s:select>
                                                    <span> <s:fielderror   fieldName="couCode"/></span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Model
                                                    </label>
                                                    <s:textfield cssClass="form-control"  
                                                                 autocomplete="off"  
                                                                 name="astAsset.model" 
                                                                 size="45"
                                                                 id="model"   /> 
                                                </div>
                                                 <s:fielderror   fieldName="model"/> </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label"> Acquired Date </label>
                                                    <s:textfield cssClass="form-control"  
                                                                 autocomplete="off"  
                                                                 name="astAsset.acquiredDate" 
                                                                 id="mask_date_mmddyyyy"    /> 
                                                    <span class="help-block">  Like [mm/dd/yyyy]  
                                                </div>
                                            </div>
                                        </div>
                                                    
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label"> Warranty Start Date   </label>
                                                    <s:textfield cssClass="form-control"  
                                                                 autocomplete="off"  
                                                                 name="astAsset.warrantyStartDate" 
                                                                 id="mask_date_mmddyyyy_start"    /> 
                                                    <span class="help-block">  Like [mm/dd/yyyy]  
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label"> Warranty End Date</label>
                                                    <s:textfield cssClass="form-control"  
                                                                 autocomplete="off"  
                                                                 name="astAsset.warrantyEndDate" 
                                                                 id="mask_date_mmddyyyy_end"    /> 
                                                    <span class="help-block">  Like [mm/dd/yyyy]  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label"> Description  </label>
                                                    <s:textfield cssClass="form-control"  
                                                                 autocomplete="off"  
                                                                 name="astAsset.warrantyStartDate" 
                                                                 id="mask_date_mmddyyyy_start"    /> 
                                                    <span class="help-block">  Like [mm/dd/yyyy]  
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label"> Warranty End Date</label>
                                                    <s:textfield cssClass="form-control"  
                                                                 autocomplete="off"  
                                                                 name="astAsset.warrantyEndDate" 
                                                                 id="mask_date_mmddyyyy_end"    /> 
                                                    <span class="help-block">  Like [mm/dd/yyyy]  
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                                 <a href="mAstAsset.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                     <i class="fa fa-mail-reply"></i> Cancel </a>
                                                 <a href="oAstAsset.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                     <i class="fa fa-remove"></i> Clear </a>
                                                 <s:submit   method="save" data-toggle="confirmation" data-original-title="Are you sure ?" cssClass="btn green btn-outline"   id="save" key="btn.save" />
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