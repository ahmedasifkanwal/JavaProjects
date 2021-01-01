<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head />

<!-- Bread Crumbs -->

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title"> <span class="glyphicons glyphicons-parents"></span> <%=session.getAttribute("SELACTIONNAME")%></div>
                    <div class="mini-action-icons margin-right-sm pull-right">

                        <a href="createsysuser.icms" >
                            <i class="fa fa-plus-circle" title="Add"></i>

                        </a>

                        <a href="searchusers.icms" >
                            <i class="fa fa-search-plus" title="Search"></i>

                        </a>
                    </div>

                </div>
                <div class="panel-body">
                    <!-- page content -->
                    <jsp:include page="../include/CustomMessage.jsp"></jsp:include>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-visible">
                                        <div class="panel-body padding-bottom-none">
                                        <div class="table-responsive">
                                        <s:form action="searchusers.icms" method="search" theme="simple"  >
                                             <input id="reportId" type="hidden" name="reportId" value="SEARCH_SYS_USER_SQL" />
                                            <table width="100%"   border="0" cellpadding="0" cellspacing="0" class="table table-striped table table-bordered" >
                                                <tr>
                                                    <td class="searchtd7" style="vertical-align:middle"><s:label   key="Name:"  /></td>
                                                    <td class="searchtd7"><s:textfield name="userFullName" cssClass="form-control" maxlength="200" /></td>
                                                    <td class="searchtd7" style="vertical-align:middle"><s:label   key="LU01"  /></td>
                                                    <td class="searchtd7"><s:textfield name="username" cssClass="form-control" maxlength="200" /></td>
                                                    <td class="searchtd7" style="vertical-align:middle"><s:label   key="LU02"  /></td>
                                                    <td class="searchtd7"><s:select  headerKey=""  headerValue="All" name="authority" list="authorityList" listKey="authority" listValue="authority" cssClass="form-control"></s:select></td>
                                                    <td class="searchtd7" style="vertical-align:middle"><s:label   key="LE08"  /></td>
                                                    <td ><s:select cssStyle="width:150px"   headerKey=""  headerValue="All" name="status" list="peStatusList" listKey="code" listValue="value" cssClass="form-control"></s:select></td>
                                                    <td  style="text-align:center"><s:submit key="BTN02" method="search" align="left" cssClass= "btn btn-info ladda-button" data-style="expand-left"  /></td>
                                                </tr>
                                            </table></s:form>
                                            </div>
                                       				<div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover" id="datatable">
                                                        <s:property value="searchResult" escapeHtml=""></s:property>
                                                    </table>
                                                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    <!-- page content -->
                </div>
            </div>
        </div>
    </div>
