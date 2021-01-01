<%-- 
    Document   : SearchReportConfig
    Created on : Dec 21, 2015, 1:56:45 PM
    Author     : Zuha
--%>

<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<sx:head />

<!-- Bread Crumbs -->
<script language="JavaScript" type="text/javascript" src="js/billing.js"></script>
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="panel">
<div class="panel-heading">
  <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%></div>
</div>
<div class="panel-body">
<!-- page content -->
<jsp:include page="../include/CustomMessage.jsp"></jsp:include>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-visible">
        <div class="panel-body padding-bottom-none">
        <s:form action="searchhotspotowner.icms"  theme="simple" >
            <s:hidden name="reportFilterName" value="SEARCH_HOTSPOTOWNER_FILTER" />
            <input id="reportId" type="hidden" name="reportId" value="SEARCH_HOTSPOTOWNER_SQL" /> 
          <div class="table-responsive">
            <table width="100%"   border="0" cellpadding="0" cellspacing="0" class="table table-striped table table-bordered"   >
              <tr>
              
                <td class="searchtd7" style="vertical-align:middle">
                    <s:label   key="LE02" />
                </td>
                <td class="searchtd7" style="vertical-align:middle">
                    <s:select 
                        cssClass="form-control"  
                        headerKey=""  
                        headerValue="All" 
                        name="name" 
                        list="peHotSpotOwnerList"
                        listKey="name"
                        listValue="name">
                    </s:select>
                  
                <td class="searchtd7" style="vertical-align:middle">
                    <s:label   key="LE08" />
                </td>
                <td class="searchtd7" style="vertical-align:middle">
                    <s:select 
                        cssClass="form-control"  
                        headerKey=""  
                        headerValue="All" 
                        name="status" 
                        list="peStatusList"
                        listKey="code" 
                        listValue="value">
                    </s:select>
                    
                 <td class="searchtd7" style="vertical-align:middle">
                     <s:label   key="Filter:" />
                 </td>
                <td class="searchtd7" style="vertical-align:middle">
                    <s:select 
                        cssClass="form-control"  
                        headerKey=""  
                        headerValue="All"
                        name="filterCode" 
                        list="peReportFilterList"
                        listKey="columnName" 
                        listValue="displayName">
                    </s:select></td>
                <td class="searchtd7" style="vertical-align:middle"><s:textfield name="filterText" maxLength="150"   cssClass="form-control"    />
                  <s:fielderror   fieldName="filterText" /></td>
                <td class="searchtd7" style="vertical-align:middle; text-align:center">
                    <s:submit key="BTN07" method="search" align="left" cssClass= "btn btn-info ladda-button" data-style="expand-left"   /></td>
              </tr>
            </table>
           </div>
          </s:form>
          <br>
          <div class="table-responsive">
              <div style="overflow:scroll">
                  <table class="table table-striped table-bordered table-hover" id="datatable">


          <s:property value="searchResult" escapeHtml=""></s:property>

                  </table>
           </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>


 
