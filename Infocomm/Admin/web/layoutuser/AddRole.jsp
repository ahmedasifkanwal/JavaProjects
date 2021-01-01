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
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%> </div>

                    <div class="mini-action-icons margin-right-sm pull-right">

                        <a href="addrole.icms" >
                            <i class="fa fa-plus-circle" title="Add"></i>

                        </a>

                        <a href="searchusers.icms" >
                            <i class="fa fa-search-plus" title="Search"></i>

                        </a>
                    </div>


                </div>
                <!-- page content -->
                <s:form  id="form1" action="addrole.icms"  name="form1"  method="POST" enctype="multipart/form-data"  theme="simple" Class="form-horizontal" >

                    <div class="panel-body">
                        <jsp:include page="../include/CustomMessage.jsp"></jsp:include>
                            <div class="form-group">
                            <s:label   key="LU02" cssClass="col-lg-2 control-label"  />
                            <div class="star1"><span class="mandatorySymbol">*</span></div>
                            <div class="col-lg-8">
                                <s:textfield name="authority" maxLength="50"   cssClass="form-control"    />
                                <s:fielderror   fieldName="authority" />
                            </div>
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
                        <div class="form-group" >
                            <s:label   cssClass="col-lg-2 control-label" />
                            <div class="col-lg-10" style="text-align: center" >
                                <s:submit method="save"   key="BTN08"  cssClass= "btn btn-info ladda-button" data-style="expand-left" />
                            </div>
                        </div>
                        <!-- Table display end -->
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

