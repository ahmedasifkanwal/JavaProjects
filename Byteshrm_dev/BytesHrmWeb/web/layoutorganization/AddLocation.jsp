 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>

        <title>      <jsp:include page="../layout/_inc_page_title.jsp"/></title>

        <%@include file="../layout/_inc_head.jsp" %>

    </head>

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-content-white <%=session.getAttribute("SIDE_BAR_TOGGLE")%>">
        <div class="page-wrapper">
            <%@include file="../layout/_inc_header.jsp" %>       
            <div class="page-container">
                <%@include file="../layout/_inc_left_menu.jsp" %>

                <div class="page-content-wrapper">

                    <div class="page-content">
                        <%   if (!session.getAttribute("isPageAuthorized").toString().equalsIgnoreCase("Not Authorized")) {%>


                        <div class="portlet box blue ">
                            <div class="portlet-title">
                                <div class="caption">
                                  <i class="fa fa-map-pin"></i><%=session.getAttribute("SELACTIONNAME")%>
                                </div>
                                <div class="tools">
                                    <a href="" class="collapse"> </a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                                    <a href="" class="reload"> </a>
                                    <a href="" class="remove"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <s:form  id="aLocation" name="aLocation"  action="aLocation.itb"   cssClass="login-form" method="post" theme="simple" enctype="multipart/form-data" novalidate="novalidate"  >
                                    <s:hidden name="location.id" id="location.id"></s:hidden>
                                        <div class="row">
                                        <jsp:include page="../layoutcontrol/CustomMessage.jsp"/>

                                    </div>
                                    <div class="form-body">
                                       <div class="form-group">
                                            <label class="control-label">Name
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="location.name" id="name"  maxLength="50"  /> 
                                            <span> <s:fielderror   fieldName="name"/></span>

                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Country
                                                <span class="required" aria-required="true"> * </span>
                                            </label>
                                            <s:select cssClass="bs-select form-control" data-live-search="true" data-size="8"  name="location.countryCode.couCode"  id="code"  headerValue="Select Country "   headerKey=""  list="refDto.countryList"
                                                      listKey="couCode" listValue="name"></s:select>
                                            <span> <s:fielderror   fieldName="couCode"/></span>
                                        </div>

                                        <div class="form-group"      >
                                            <label class="control-label">State/Province
                                            </label>
                                            <s:textfield      cssClass="form-control"  autocomplete="off"  
                                                         name="location.province" id="province"  maxLength="50"  /> 
                                            <span> <s:fielderror   fieldName="province"/></span>

                                        </div>


                                        <div class="form-group">
                                            <label class="control-label">City
                                            </label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="location.city" id="city"  maxLength="50"  /> 
                                            <span> <s:fielderror   fieldName="city"/></span>

                                        </div>





                                        <div class="form-group">



                                            <label class="control-label">Address

                                            </label>



                                            <s:textarea cssClass="form-control"  autocomplete="off"  
                                                        name="location.address" id="address"  /> 
                                            <span> <s:fielderror   fieldName="address"/></span>

                                        </div>   





                                        <div class="form-group">
                                            <label class="control-label">Zip/Postal Code</label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="location.zipCode" id="zipCode"  maxLength="50"  /> 
                                            <span> <s:fielderror   fieldName="zipCode"/></span>
                                        </div>





                                        <div class="form-group">
                                            <label class="control-label">Phone</label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="location.phone" id="phone"  maxLength="50"  /> 
                                            <span> <s:fielderror   fieldName="phone"/></span>
                                        </div>




                                        <div class="form-group">
                                            <label class="control-label">Fax</label>
                                            <s:textfield cssClass="form-control"  autocomplete="off"  
                                                         name="location.fax" id="fax"  maxLength="50"  /> 
                                            <span> <s:fielderror   fieldName="fax"/></span>
                                        </div>


                                        <div class="form-group">
                                            <label class="control-label">Notes</label>
                                            <s:textarea cssClass="form-control"  autocomplete="off"  
                                                        name="location.notes" id="notes"  maxLength="250"  /> 
                                            <span> <s:fielderror   fieldName="notes"/></span>
                                        </div>


                                        <div class="form-actions">
                                            <a href="mLocation.itb" class="btn red btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?">
                                                <i class="fa fa-mail-reply"></i> Cancel </a>
                                            <a href="oLocation.itb" class="btn blue btn-outline" data-toggle="confirmation" data-original-title="Are you sure ?">
                                                <i class="fa fa-remove"></i> Clear </a>

                                            <s:submit   method="save" data-toggle="confirmation" data-original-title="Are you sure ?" cssClass="btn blue btn-outline"   id="save" key="Save" />
                                        </div>

                                    </div>


                                </s:form>
                            </div>
                        </div>


                    </div>


                    <%} else {%>

                    <jsp:include  page="../layout/_inc_action_denied.jsp"></jsp:include>

                    <%}%>

                    <%@include file="../layout/_inc_footer.jsp" %>           
                </div>
            </div>
        </div>


        <%@include file="../layout/_inc_footer_script.jsp" %>





    </body>

</html>