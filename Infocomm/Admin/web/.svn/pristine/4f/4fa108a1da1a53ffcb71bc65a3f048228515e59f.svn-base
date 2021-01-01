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
                    <div class="panel-title"> <span class="glyphicon glyphicon-th-large"></span> <%=session.getAttribute("SELACTIONNAME")%></div>
                </div>
                <div class="panel-body" >
                    <!-- page content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-visible">
                                    <div class="panel-body padding-bottom-none">
                                        <s:form action="backuphistory.icms"  theme="simple"  >
                                            <s:hidden name="reportFilterName" value="SYS_KIOSK_REPORT" />

                                            <div class="col-sm-2 col-md-4" >
                                                <div class="console-btn" style="color:#33cccc ;padding: 1px 1px 10px 10px" data-toggle="tooltip" title="" data-original-title="Please Select Date Range." data-placement="bottom">
                                                    <div class="console-icon divider-right" >
                                                        <span class="glyphicons glyphicons-calendar" ></span> </div>
                                                    <div class="console-text">
                                                        <div class="console-title">
                                                            <s:textfield id="daterange"   cssClass="form-control margin-top-none"  name="daterange"/>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-md-2">
                                                <div class="console-btn" style="color:#33cccc ;padding: 1px 1px 10px 10px"  data-original-title="Click here to searh." data-placement="bottom">
                                                    <div class="console-icon divider-right" >
                                                        <span class="glyphicons glyphicons-refresh" ></span> </div>
                                                    <div class="console-text">

                                                        <div class="console-subtitle">
                                                            <s:submit key="BTN02"  method="searchSyserror" align="left"   cssClass= "btn btn-info ladda-button" data-style="expand-left" />

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                            <br>

                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="panel-body">
                                                            <div class="table-responsive">

                                                                <div class="panel-body padding-bottom-none" >
                                                                    <table class="table table-striped table-bordered table-hover">
                                                                        <tr> 
                                                                            <th>
                                                                                SN# 
                                                                            </th>
                                                                            <th>
                                                                                Date Created
                                                                            </th>
                                                                            <th>
                                                                                Row Count
                                                                            </th>
                                                                            <th>
                                                                                Status
                                                                            </th>
                                                                            <th>
                                                                                Sql Executed
                                                                            </th>
                                                                            <th>
                                                                                Remarks
                                                                            </th>
                                                                            <th>
                                                                                Source Table
                                                                            </th>
                                                                            <th>
                                                                                Destination Table
                                                                            </th>
                                                                            <th>
                                                                                Sql Operation
                                                                            </th>
                                                                        </tr>
                                                                        <tbody>
                                                                            <s:iterator var="p" status="row" value="peBackupHistory.backupHistoryList">
                                                                                <tr> 
                                                                                    <td>
                                                                                        <s:property value="#row.count"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{dateCreated}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{rowCount}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{status}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{sqlExecuted}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{remarks}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{sourceTable}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{destinationTable}"/>
                                                                                    </td>
                                                                                    <td>
                                                                                        <s:property value="%{sqlOperation}"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </s:iterator>
                                                                        </tbody>

                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>    
                                        </s:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>