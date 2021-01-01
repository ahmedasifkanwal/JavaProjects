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

                        <s:form  id="eContactDetail" name="eContactDetail"  action="eContactDetail.itb"   cssClass="form-horizontal" method="post" theme="simple" novalidate="novalidate"  >
                            <s:hidden name="employee.empNumber" id="employee.empNumber"></s:hidden>    
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tabbable-line boxless tabbable-reversed">


                                            <ul class="nav nav-tabs">
                                                <li >
                                                <s:a href="gPersonalDetail.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Personal Details </s:a>
                                                </li>

                                                <li  class="active" >
                                                <s:a href="gContactDetail.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Contact Details </s:a>
                                                </li>
                                                <li  >
                                                <s:a href="gEmergencyContacts.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Emergency Contacts </s:a>
                                                </li>
                                                <li  >

                                                <s:a href="gDependents.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Dependents </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="gEmpImmigrations.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Immigration </s:a>

                                                </li>
                                                <li  >

                                                <s:a href="gJob.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Job </s:a>

                                                </li>


                                                <li  >

                                                <s:a href="gSalaries.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Salary </s:a>

                                                </li>

                                                <li  >

                                                <s:a href="gReporting.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Report-To </s:a>

                                                </li>

                                           

                                            <li  >
                                            
                                              <s:a href="cEmpMemberDetail.itb?empNumber=%{employee.empNumber}"  id="empNumber" name="employee.empNumber"  value="employee.empNumber"> Membership </s:a>

                                            
                                            </li>

                                        </ul>



                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_personal_details">
                                                <div class="portlet box blue">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-gift"></i> Contact Details</div>
                                                        <div class="tools">
                                                            <a href="javascript:;" class="collapse"> </a>
                                                            <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                                            <a href="javascript:;" class="reload"> </a>
                                                            <a href="javascript:;" class="remove"> </a>
                                                        </div>
                                                    </div>


                                                    <div class="portlet-body form">
                                                        <!-- BEGIN FORM--> <div class="form-body">


                                                            <jsp:include page="../layoutcustom/CustomMessage.jsp" />
                        
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Address Street 1</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empStreet1" id="empStreet1"   placeholder="Address Street 1"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empStreet1"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Address Street 2</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empStreet2" id="empStreet2"   placeholder="Address Street 2"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empStreet2"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">City</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.cityCode" id="cityCode"   placeholder="City"  /> 
                                                                            <span class="help-block"> <s:fielderror fieldName="cityCode"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">State/Province</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.provinCode" id="provinCode"   placeholder="State/Province"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="provinCode"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/row-->
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Zip/Postal Code</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empZipcode" id="empZipcode"   placeholder="Zip/Postal Code"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empZipcode"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Country</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="employee.counCode"  id="counCode"  headerValue="Select Country "   headerKey=""  list="refDto.countryList"
                                                                                      listKey="code" listValue="name"></s:select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--row-->
                                                                <h3 class="form-section"></h3>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <div class="col-md-2">
                                                                                <label class="control-label col-md-12">Phone</label>
                                                                            </div>
                                                                            <div class="col-md-3">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empHmTelephone" id="empHmTelephone"   placeholder="Home Telephone"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empHmTelephone"/> </span>
                                                                        </div>
                                                                        <div class="col-md-3">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empMobile" id="empMobile"   placeholder="Mobile"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empMobile"/> </span>
                                                                        </div>
                                                                        <div class="col-md-3">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empWorkTelephone" id="empWorkTelephone"   placeholder="Work Telephone"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empWorkTelephone"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Work E-Mail</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empWorkEmail" id="empWorkEmail"   placeholder="Work E-Mail"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empWorkEmail"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <div class="col-md-4">
                                                                            <label class="control-label col-md-12">Other E-Mail</label>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                                                         name="employee.empOthEmail" id="empOthEmail"   placeholder="Other E-Mail"  /> 
                                                                            <span class="help-block"> <s:fielderror   fieldName="empOthEmail"/> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <h3 class="form-section"></h3>
                                                            <!--/row-->
                                                            <div class="row">



                                                                <div class="col-md-6" >
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">Attachment</label>
                                                                        <div class="col-md-9">
                                                                            <s:file   requiredLabel="false"  cssClass="dropzone dropzone-file-area"  />  
                                                                            <span class="help-block"> <s:fielderror   fieldName="Attachment"/> </span>
                                                                        </div>
                                                                    </div>
                                                                    <!--/span-->
                                                                </div>



                                                                <!--/span-->

                                                                
                                                                <!--/span-->
                                                            </div>
                                                            <!--/row-->
                                                            <!--/row-->
                                                            <div class="form-actions">
                                                                <a href="mContactDetail.itb" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn red btn-outline">
                                                                    <i class="fa fa-mail-reply"></i> Cancel </a>
                                                                <a href="gContactDetail.itb?empNumber=<s:property value="%{employee.empNumber}" />" data-toggle="confirmation" data-original-title="Are you sure ?" class="btn blue btn-outline">
                                                                    <i class="fa fa-remove"></i> Clear </a>
                                                                <s:submit method="saveEmpContactDetail" data-toggle="confirmation" data-original-title="Are you sure ?"  cssClass="btn blue btn-outline"   id="saveEmpContactDetail" key="Save Contact Info" />
                                                            </div>
                                                            

                                                        </div>
                                                    </div>

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

        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->

        <!-- END PAGE LEVEL SCRIPTS -->



    </body>

</html>