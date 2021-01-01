<%--
    Document   : CreateCategory
    Created on : Apr 28, 2012, 2:13:26 PM
    Author     : naeem
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head  />

<!-- Bread Crumbs-->


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>
                </div>

                <!-- page content -->
                <s:form  id="form1" action="updatesysuser.icms"  name="form1"  method="POST" enctype="multipart/form-data"  theme="simple" Class="form-horizontal" >
                    <s:hidden id="username" name="username"> </s:hidden>
                        <div class="panel-body">
                        <jsp:include page="../include/CustomMessage.jsp"></jsp:include>

                            <div class="form-group">
                            <s:label   key="User ID:" cssClass="col-lg-2 control-label"  />
                            <div class="star1"><span class="mandatorySymbol"></span></div>
                            <div class="col-lg-8">
                                <s:label name="username" cssClass="form-control_label"    />

                            </div>
                        </div>
                                <jsp:include page="../include/RoleWithAdvertiser.jsp"></jsp:include>
                                    <div class="form-group">
                                    <s:label   key="LU01" cssClass="col-lg-2 control-label"  />
                            <div class="star1"></div>
                            <div class="col-lg-8">
                                <s:textfield name="userFullName" maxLength="100"   cssClass="form-control"    />
                            </div>
                        </div>

                        <div class="form-group">
                            <s:label   key="label.email" cssClass="col-lg-2 control-label"  />
                            <div class="star1"><span class="mandatorySymbol">*</span></div>
                            <div class="col-lg-8">
                                <s:textfield name="email" maxLength="50"   cssClass="form-control"    />
                                <s:fielderror   fieldName="email" />
                            </div>
                        </div>

                        <div class="form-group">
                            <s:label   key="Account Validity:" cssClass="col-lg-2 control-label"  />
                            <div class="col-md-8">
                                <div class="input-group"> <span class="input-group-addon">
                                        <i class="fa fa-calendar"></i> </span>
                                        <s:textfield  name="toDate" id="toDate" cssClass="form-control datepicker margin-top-none" />

                                    <s:fielderror   fieldName="todate" />
                                </div>
                            </div>
                        </div>

                                    <div class="form-group">
                                        <s:label   key="LE08"  cssClass="col-lg-2 control-label" for="chosen-list2" />
                                        <div class="star1"><span class="mandatorySymbol">*</span></div>

                            <div class="col-lg-8">
                                <s:select   name="status" list="peStatusList" listKey="code" listValue="value" cssClass="form-control"></s:select>
                                <s:fielderror   fieldName="status" />
                            </div>
                        </div>

                                <div class="form-group " >
                                    <s:label   key=""  cssClass="col-lg-2 control-label" for="chosen-list2" />
                                    <div class="col-lg-1 pull-left"  >
                                        <s:submit method="edit"   key="Update"  cssClass= "btn btn-info ladda-button" data-style="expand-left" />
                                    </div>
                        </div>
                        <!-- Table display end -->
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

