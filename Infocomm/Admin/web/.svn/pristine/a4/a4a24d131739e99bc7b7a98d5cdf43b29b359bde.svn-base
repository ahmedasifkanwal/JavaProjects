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
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span>
                        <%=session.getAttribute("SELACTIONNAME")%> </div>
                </div>
                <!-- page content -->
                <s:form  id="form1" action="editrole.icms"  name="form1"  method="POST"
                         enctype="multipart/form-data"  theme="simple" Class="form-horizontal" >
                    <s:hidden name="authority_id"    />
                    <div class="panel-body">
                        <jsp:include page="../include/CustomMessage.jsp"></jsp:include>
                            <div class="form-group">
                            <s:label   key="Current Role :"  cssClass="col-lg-2 control-label">

                              
                            </s:label>
                            <s:label name="authority"  id="authority" cssClass="control-label"  />

                        </div>
                        <div class="form-group">
                            <s:label   key="LU03" cssClass="col-lg-2 control-label"  />
                            <div class="star1"><span class="mandatorySymbol">*</span></div>
                            <div class="col-lg-8">
                                <s:textfield name="title" maxLength="50"   cssClass="form-control"    />
                                <s:fielderror   fieldName="title" />
                            </div>
                        </div>
                        <div class="form-group">
                            <s:label   key="LE03" cssClass="col-lg-2 control-label"  />
                            <div class="star1"><span class="mandatorySymbol">*</span></div>
                            <div class="col-lg-8">
                                <s:textfield name="description" maxLength="50"   cssClass="form-control"    />
                                <s:fielderror   fieldName="description" />
                            </div>
                        </div>
                        <div class="form-group">
                            <s:label key="LVG04" cssClass="col-lg-2 control-label" />
                            <div class="star1"></div>
                            <div class="col-lg-8">
                                <s:select cssClass="form-control"  headerKey=""  name="status" list="peStatusList"
                                          listKey="code" listValue="value"></s:select>
                                </div>
                            </div>
                            <div class="form-group" >
                            <s:label   cssClass="col-lg-2 control-label" />
                            <div class="col-lg-10"  >
                                <s:submit method="edit"   key="BTN08"   cssClass= "btn btn-info ladda-button" data-style="expand-left" />
                            </div>
                        </div>
                        <!-- Table display end -->
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

