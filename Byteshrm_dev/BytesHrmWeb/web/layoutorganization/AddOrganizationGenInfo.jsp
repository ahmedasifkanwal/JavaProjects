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




                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <s:form  id="aGeneralInformation" name="aGeneralInformation"  action="aGeneralInformation.itb"   cssClass="login-form" method="post" theme="simple" novalidate="novalidate"  >
                                           <div class="row " >
                                           <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>

                                        </div>
                                        <div class="form-body">
                                          
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Organization</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="organizationGenInfo.name" id="name"   /> 
                                                         <span class="help-block red">Required!</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                             <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">TAX ID</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.taxId" id="taxId"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">No. Of Employee</label>
                                                           
                                                        <div class="col-md-9">
                                                           <span class="help-block"> 10 </span>
                                                        
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Registration Number</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.registrationNumber" id="registrationNumber"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                          
                                            <h3 class="form-section"></h3>
                                               <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Phone</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="organizationGenInfo.phone" id="phone"   /> 
                                                         <span class="help-block red"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                             <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Fax</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.fax" id="fax"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>                                                      
                                               <div class="row">
                                                
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Email</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.email" id="email"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                                        
                                                        
                                                <h3 class="form-section"></h3>
                                               <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Address Street 1</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="organizationGenInfo.street1" id="street1"   /> 
                                                         <span class="help-block red"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                             <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Address Street 2</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.street2" id="street2"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>                                                      
                                               <div class="row">
                                                
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">City</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.city" id="city"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                        
                                                        <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">State/Province</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.province" id="province"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>         
                                                        
                                                           <div class="row">
                                                
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Zip/Postal Code</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.zipCode" id="zipCode"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                        
                                                        <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Country</label>
                                                           
                                                        <div class="col-md-9">
                                                             <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="organizationGenInfo.country"  id="code"  headerValue="Select Country "   headerKey=""  list="refDto.countryList"
                                                      listKey="couCode" listValue="name"></s:select>
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>          
                                                        
                                                        
                                                        
                                                        
                                                        
                                                   <div class="row">
                                                
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">Note</label>
                                                           
                                                        <div class="col-md-9">
                                                            <s:textarea cssClass="form-control"  autocomplete="off"  
                                                           name="organizationGenInfo.note" id="note"   /> 
                                                        <span class="help-block">  </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                        
                                                <!--/span-->
                                            </div>      
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                        </div>
                                        <div class="form-actions">                                                            
                                            <a href="mGeneralInformation.itb" class="btn red btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?">
                                               <i class="fa fa-mail-reply"></i> Cancel 
                                            </a>
                                            <a href="oGeneralInformation.itb" class="btn blue btn-outline"data-toggle="confirmation" data-original-title="Are you sure ?">
                                               <i class="fa fa-remove"></i> Clear 
                                            </a>

                                           <s:submit   method="save"  cssClass="btn blue  btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?" id="save" key="btn.save" />

                                            </div>
                                        </div>
                                        </s:form>  
                                            <!-- END FORM-->
                                        </div>



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